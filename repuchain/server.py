import os, socket, json
try:
    from blockchain.blockchain import *
except:
    from repuchain.blockchain.blockchain import *

# send_handle vote block dua vao handle block

nodeAddress = ''
miningAddress = ''
nodeVersion = 1

knownNodes = []
nodes = settings.KNOWNNODES
knownNodes = nodes.split('_')

commandLength = 12
timeWait = 10 

mempool = dict()                    # txid: str = tx: bytes
blocksInTransit = []                # list bytes

# create json reputation list
if not os.path.isfile(settings.BASE_DIR_BC + '/repulist.json'):
    repufile = open(settings.BASE_DIR_BC + '/repulist.json', 'w')
    # init reputation list
    repulist = settings.reputationjson
    # write file
    repufile.write(json.dumps(repulist, indent = 4))
    repufile.close()

class NodeVersion:
    def __init__(self,  addrfrom: str, version: int, bestheight: int) -> None:
        self.addrfrom = addrfrom
        self.version = version
        self.bestheight = bestheight
    
    def to_dict(self):
        return {
            'addrfrom': self.addrfrom,
            'version': self.version,
            'bestheight': self.bestheight
        }

    def serialize(self):
        return encode_to_bytes(self.to_dict())

    @staticmethod
    def deserialize(data: bytes):
        data = decode_from_bytes(data)
        return NodeVersion(data['addrfrom'], data['version'], data['bestheight'])

class ReputationList:
    def __init__(self,  addrfrom: str, blockindex: int, data: json) -> None:
        self.addrfrom = addrfrom
        self.blockindex = blockindex
        self.data = data
    
    def to_dict(self):
        return {
            'addrfrom': self.addrfrom,
            'blockindex': self.blockindex,
            'data': self.data
        }

    def serialize(self):
        return encode_to_bytes(self.to_dict())

    @staticmethod
    def deserialize(data: bytes):
        data = decode_from_bytes(data)
        return ReputationList(data['addrfrom'], data['blockindex'], data['data'])

class GetBlocks:
    def __init__(self, addrfrom: str) -> None:
        self.addrfrom = addrfrom
    
    def to_dict(self):
        return {
            'addrfrom': self.addrfrom
        }
    
    def serialize(self):
        return encode_to_bytes(self.to_dict())
    
    @staticmethod
    def deserialize(data: bytes):
        data = decode_from_bytes(data)
        return GetBlocks(data['addrfrom'])

class Inventory:
    def __init__(self, addrfrom: str, type: str, items: list) -> None:
        self.addrfrom  = addrfrom
        self.type = type
        self.items = items
    
    def to_dict(self):
        list_items = []
        for item in self.items:
            list_items.append(item.hex())
        return {
            'addrfrom': self.addrfrom,
            'type': self.type,
            'items': list_items
        }
    
    def serialize(self):
        return encode_to_bytes(self.to_dict())
    
    @staticmethod
    def deserialize(data: bytes):
        data = decode_from_bytes(data)
        items = []
        for it in data['items']:
            items.append(bytes.fromhex(it))
        return Inventory(data['addrfrom'], data['type'], items)

class GetData:
    def __init__(self, addrfrom: str, type: str, id: bytes) -> None:
        self.addrfrom  = addrfrom
        self.type = type
        self.id = id
    
    def to_dict(self):
        return {
            'addrfrom': self.addrfrom,
            'type': self.type,
            'id': self.id.hex()
        }
    
    def serialize(self):
        return encode_to_bytes(self.to_dict())
    
    @staticmethod
    def deserialize(data: bytes):
        data = decode_from_bytes(data)
        return GetData(data['addrfrom'], data['type'], bytes.fromhex(data['id']))

class SBlock:
    def __init__(self, addrfrom: str, block: bytes) -> None:
        self.addrfrom = addrfrom
        self.block = block
    
    def to_dict(self):
        return {
            'addrfrom': self.addrfrom,
            'block': decode_from_bytes(self.block) 
        }
    
    def serialize(self):
        return encode_to_bytes(self.to_dict())
    
    @staticmethod
    def deserialize(data: bytes):
        data = decode_from_bytes(data)
        return SBlock(data['addrfrom'], encode_to_bytes(data['block']))

class VoteBlock:
    def __init__(self, addrfrom: str, block: bytes, signature: bytes, numbervotes: int, uservotes: dict, addressleader: str) -> None:
        self.addrfrom = addrfrom
        self.block = block
        self.signature = signature
        self.numbervotes = numbervotes
        self.uservotes = uservotes          # {pubkey str: votevalue str}
        self.addressleader = addressleader
    
    def to_dict(self):
        return {
            'addrfrom': self.addrfrom,
            'block': decode_from_bytes(self.block), 
            'signature': self.signature.hex(),
            'numbervotes': str(self.numbervotes),
            'uservotes': self.uservotes,
            'addressleader': self.addressleader
        }
    
    def serialize(self):
        return encode_to_bytes(self.to_dict())
    
    @staticmethod
    def deserialize(data: bytes):
        data = decode_from_bytes(data)
        return VoteBlock(data['addrfrom'], encode_to_bytes(data['block']), bytes.fromhex(data['signature']), int(data['numbervotes']), data['uservotes'], data['addressleader'])

class Tx:
    def __init__(self, addrfrom: str, tx: bytes) -> None:
        self.addrfrom = addrfrom
        self.tx = tx
    
    def to_dict(self):
        return {
            'addrfrom': self.addrfrom,
            'tx': decode_from_bytes(self.tx) 
        }
    
    def serialize(self):
        return encode_to_bytes(self.to_dict())
    
    @staticmethod
    def deserialize(data: bytes):
        data = decode_from_bytes(data)
        return Tx(data['addrfrom'], encode_to_bytes(data['tx']))

# start_server at this node
def start_server(thisNode: str, minerAddress: str):
    global nodeAddress
    global miningAddress
    global knownNodes

    nodeAddress = thisNode
    miningAddress = minerAddress
    # get Port of node
    nodeHost = nodeAddress.split(':')[0]
    nodePort = int(nodeAddress.split(':')[1])
    # Create a stream based socket operating on IPv4 addressing scheme
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Bind and listen
    s.bind((nodeHost, nodePort))
    s.listen()
    print('Server started at', thisNode)
   
    bc = Blockchain.new_blockchain()
    for node in knownNodes:
        if nodeAddress != node:
            send_version(node, bc)
            send_repulist(node, bc)
            

    while True:
        ## For Listenning
        print('Waiting for connecting....')
        conn, addr = s.accept()
        print('Connected by ', addr)
        while True:
            handle_connection(conn, bc)
            print('Closed connect with ', addr)
            break 

# SUPPORT FUNCTION 
# convert command to bytes
def get_ip():
    name = socket.gethostname()
    return socket.gethostbyname(name)

def cmd_to_bytes(cmd: str):
    global commandLength
    
    if len(cmd) < commandLength:
        tmp = commandLength - len(cmd)
        cmd = cmd + tmp*'0'
    b_cmd = cmd.encode('utf-8')
    return b_cmd

# convert bytes to command
def bytes_to_cmd(b_cmd: bytes):
    global commandLength

    b_cmd = b_cmd[0:commandLength]
    final_cmd = ''
    for i in b_cmd.decode():
        if i != '0':
            final_cmd += i
    return final_cmd

# send_data from thisNode to centralNode
def send_data(addr: str, data: bytes):
    global knownNodes

    nodeHost = addr.split(':')[0]
    nodePort = int(addr.split(':')[1])
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        s.connect((nodeHost, nodePort))
        s.sendall(data)
        s.close()
    except:
        # update knownNodes
        updateNodes = [knownNodes[0]]
        for node in knownNodes:
            if addr != node and addr != '':
                updateNodes.append(node)
        knownNodes = updateNodes
        print(f'Can not connect with server at {addr}')
        s.close()
        return

def is_knownnode(addr: str):
    global knownNodes
    if addr == '': return True
    for node in knownNodes:
        if node == addr:
            return True
    return False

# END SUPPORT FUNCTION

##### VERSION 
# send version node
def send_version(addr: str, bc: Blockchain):
    global nodeAddress

    bestHeight = bc.get_height()
    data = NodeVersion(nodeAddress, nodeVersion, bestHeight)
    payload = data.serialize()
    request = cmd_to_bytes('version') + payload
    send_data(addr, request)

# handle version node
def handle_version(request: bytes, bc: Blockchain):
    global knownNodes

    request = request[commandLength:]
    payload = NodeVersion.deserialize(request)
    # get best height
    mybestheight = bc.get_height()
    foreignerbestheight = payload.bestheight
    
    if mybestheight < foreignerbestheight:
        send_getblocks(payload.addrfrom)
    elif mybestheight > foreignerbestheight:
        send_version(payload.addrfrom, bc)
    
    if not is_knownnode(payload.addrfrom):
        knownNodes.append(payload.addrfrom)
        print(f'There are {len(knownNodes)} known nodes now!')

##### REPUTATION LIST 
# send repulist 
def send_repulist(addr: str, bc: Blockchain):
    global nodeAddress
    global knownNodes

    # get blockindex repulist
    repufile = open(settings.BASE_DIR_BC + '/repulist.json', 'r+')
    data_json = json.load(repufile)
    repufile.close()
    if data_json['blockindex'][-1] > bc.get_height():
        for node in knownNodes:
            send_version(node, bc)
        return

    data = ReputationList(nodeAddress, data_json['blockindex'][-1], data_json)
    payload = data.serialize()
    request = cmd_to_bytes('repulist') + payload
    send_data(addr, request)

# handle repulist 
def handle_repulist(request: bytes, bc: Blockchain):
    global knownNodes
    global miningAddress
    global mempool

    request = request[commandLength:]
    payload = ReputationList.deserialize(request)

    repufile = open(settings.BASE_DIR_BC + '/repulist.json', 'r+')
    data = json.load(repufile)
    myblockindex_repulist = data['blockindex'][-1]
    repufile.close()
    
    if myblockindex_repulist < payload.blockindex:
        # verify file

        # write file
        repufile = open(settings.BASE_DIR_BC + '/repulist.json', 'w')
        repufile.write(json.dumps(payload.data, indent = 4))
        repufile.close()
    elif myblockindex_repulist > payload.blockindex:
        send_repulist(payload.addrfrom, bc)
    else:
        print('Checking leader...')

        # check longest chain
        if bc.get_height() != payload.data['blockindex'][-1]:
            for node in knownNodes:
                send_version(node, bc)
        
        # compare pubkeyhash
        # Check int(len(mempool)/(settings.number_txs_tomine+1)) = X
        leader_ith = int(len(mempool)/(settings.number_txs_tomine + 5))

        if bc.get_height() == 1 or bc.get_height() == 2:
            leaders = payload.data['leaders']['index1']
            if Wallet.hash_publickey(leaders[leader_ith].encode()) == Wallet.get_pubkeyhash_from_address(miningAddress):
                cur_height = payload.data['blockindex'][-1]
                print(f'You are leader of round {cur_height + 1}')
                mining_block_por(bc)
                # if len mempool > 10 => chọn leader khác
        else:
            leaders = payload.data['leaders']['index' + str(payload.data['blockindex'][-1])]
            if Wallet.hash_publickey(leaders[leader_ith].encode()) == Wallet.get_pubkeyhash_from_address(miningAddress):
                cur_height = payload.data['blockindex'][-1]
                print(f'You are leader of round {cur_height + 1}')
                mining_block_por(bc)
                # if len mempool > 10 => chọn leader khác

        # for node in knownNodes:
        #     send_repulist(node)
    
    if not is_knownnode(payload.addrfrom):
        knownNodes.append(payload.addrfrom)
        print(f'There are {len(knownNodes)} known nodes now!')

##### GET BLOCKS
# send get blocks
def send_getblocks(addr: str):
    global nodeAddress

    data = GetBlocks(nodeAddress)
    payload = data.serialize()
    request = cmd_to_bytes('getblocks') + payload
    send_data(addr, request)

# handle getblocks
def handle_getblocks(request: bytes, bc: Blockchain):
    global knownNodes

    request = request[commandLength:]
    payload = GetBlocks.deserialize(request)
    blocks = bc.get_blockhashes()
    send_inventory(payload.addrfrom, 'block', blocks)

    if not is_knownnode(payload.addrfrom):
        knownNodes.append(payload.addrfrom)
        print(f'There are {len(knownNodes)} known nodes now!')

# INVENTORY contains blocks or transactions, type == block or tx
def send_inventory(addr: str, type: str, items: list):
    global nodeAddress

    data = Inventory(nodeAddress, type, items)
    payload = data.serialize()
    request = cmd_to_bytes('inv') + payload
    send_data(addr, request)
    
def handle_inventory(request: bytes, bc: Blockchain):
    global blocksInTransit
    global mempool
    global knownNodes

    request = request[commandLength:]
    payload = Inventory.deserialize(request)
    print(f'Recevied inventory with {len(payload.items)} {payload.type}')


    if payload.type == 'block':
        newInTransit = []
        
        for bhash in payload.items:
            if not bc.is_blockexist(bhash):
                newInTransit.append(bhash)
        
        blockhash = newInTransit[-1]
        send_getdata(payload.addrfrom, 'block', blockhash)
        blocksInTransit = newInTransit[:-1]
    
    if payload.type == 'tx':
        txid = payload.items[0]
        if mempool.get(txid.hex()) == None:
            send_getdata(payload.addrfrom, 'tx', txid)
    
    
    if not is_knownnode(payload.addrfrom):
        knownNodes.append(payload.addrfrom)
        print(f'There are {len(knownNodes)} known nodes now!')

##### GET DATA
def send_getdata(addr: str, type: str, id: bytes):
    global nodeAddress

    data = GetData(nodeAddress, type, id)
    payload = data.serialize()
    request = cmd_to_bytes('getdata') + payload
    send_data(addr, request)

def handle_getdata(request: bytes, bc: Blockchain):
    global mempool
    global knownNodes

    request = request[commandLength:]
    payload = GetData.deserialize(request)

    if payload.type == 'block':
        try:
            block = bc.get_block(payload.id)
            send_block(payload.addrfrom, block)
        except:
            return
    if payload.type == 'tx':
        try:
            txid = payload.id.hex()
            tx = mempool[txid]
            send_tx(payload.addrfrom, tx)
        except:
            return

    if not is_knownnode(payload.addrfrom):
        knownNodes.append(payload.addrfrom)
        print(f'There are {len(knownNodes)} known nodes now!')

##### SBLOCK
def send_block(addr: str, block: Block):
    global nodeAddress
    global blocksInTransit

    data = SBlock(nodeAddress, block.serialize_block())
    payload = data.serialize()
    request = cmd_to_bytes('block') + payload
    send_data(addr, request)

def handle_block(request: bytes, bc: Blockchain):
    global knownNodes
    global nodeAddress
    global blocksInTransit

    request = request[commandLength:]
    payload = SBlock.deserialize(request)

    blockdata = payload.block
    block = Block.deserialize_block(blockdata)
    
    if bc.is_blockexist(block.hash()):
        print(("Recevied a block! But it's existed"))
        return
    
    for tx in block.transactions:
        try:
            mempool.pop(tx.txid.hex())
        except:
            pass
    print('Received a new block')
    # check block if is valid
    if bc.is_valid_block(block) == False:
        print('Invalid Block')
        return
    bc.add_block(block)
    # update chainstate db & ftx db
    utxoset = UTXOSet(bc)
    utxoset.reindex()
    ftxset = FTXSet(bc)
    ftxset.reindex()
    
    print(f'Added block {block.hash().hex()}')

    if len(blocksInTransit) > 0:
        blockhash = blocksInTransit[-1]
        send_getdata(payload.addrfrom, 'block', blockhash)
        blocksInTransit = blocksInTransit[:-1]

    for node in knownNodes:
        if node != nodeAddress and node != payload.addrfrom:
            send_block(node, block)
            print(f"This block is broadcasted to {node}")
            # update repulist
            send_repulist(node, bc)

    if not is_knownnode(payload.addrfrom):
        knownNodes.append(payload.addrfrom)
        print(f'There are {len(knownNodes)} known nodes now!')

##### Tx
def send_tx(addr: str, tx: Transaction):
    global nodeAddress

    data = Tx(nodeAddress,  tx.serialize_tx())
    payload = data.serialize()
    request = cmd_to_bytes('tx') + payload
    send_data(addr, request)

def handle_tx(request: bytes, bc: Blockchain):
    global mempool
    global knownNodes
    global nodeAddress

    request = request[commandLength:]
    payload = Tx.deserialize(request)

    txdata = payload.tx
    tx = Transaction.deserialize_tx(txdata)
    mempool[tx.txid.hex()] = tx
    
    print(len(mempool))
    print(mempool)

    for node in knownNodes:
        if node != nodeAddress and node != payload.addrfrom:
            print(f"This transaction will be broadcasted to {node}")
            send_inventory(node, 'tx', [tx.txid])
            send_repulist(node, bc)

    if not is_knownnode(payload.addrfrom):
        knownNodes.append(payload.addrfrom)
        print(payload.addrfrom)
        print(f'There are {len(knownNodes)} known nodes now!')

##### MINING BLOCK
def mining_block(bc: Blockchain):
    global mempool
    global miningAddress
    global knownNodes
    global timeWait
    
    success = False

    while not success:
        print('Waiting for mining...')
        if len(mempool) < settings.number_txs_tomine:
            print('Lack of Txs for mining... Waiting a few mins...')
            break
        if len(mempool) >= settings.number_txs_tomine and len(miningAddress) > 0:
            txs = []
            m_txs = []
            for _, tx in mempool.items():
                if bc.verify_tx(tx):
                    txs.append(tx)
                    m_txs.append(tx)
    
            if len(txs) == 0:
                print('All transactions are invalid! Waiting for new ones...')
                time.sleep(timeWait)
                continue
                
            cbtx = Transaction.new_coinbase(miningAddress, '')
            m_txs.append(cbtx)
            new_block = bc.create_newblock(m_txs)
            utxoset = UTXOSet(bc)
            utxoset.update(new_block)
            ftxset = FTXSet(bc)
            ftxset.update(new_block)
            ftxset.update_repulist()
            print('New Block is mined')

            for tx in txs:
                mempool.pop(tx.txid.hex())
            
            # send new_block to other nodes 
            for node in knownNodes:
                if node != nodeAddress:
                    send_inventory(node, 'block', [new_block.hash()])
               
            break

##### VOTEBLOCK 
def send_voteblock(addr: str, block: Block, signature: bytes, numbervotes: int, uservotes: dict, addressleader: str):
    global nodeAddress

    data = VoteBlock(nodeAddress, block.serialize_block(), signature, numbervotes, uservotes, addressleader)
    payload = data.serialize()
    request = cmd_to_bytes('voteblock') + payload
    send_data(addr, request)

def handle_voteblock(request, bc: Blockchain):
    global knownNodes
    global nodeAddress

    request = request[commandLength:]
    payload = VoteBlock.deserialize(request)

    blockdata = payload.block
    block = Block.deserialize_block(blockdata)
    
    uservotes = payload.uservotes
    repufile = open(settings.BASE_DIR_BC + '/repulist.json', 'r+')
    data = json.load(repufile)
    repufile.close()
    try:
        cur_leaders = data['leaders']['index' + str(block.index - 1)]
    except:
        for node in knownNodes:
            if node != nodeAddress:
                send_repulist(node, bc)

    # Check int(len(mempool)/(settings.number_txs_tomine+1)) = X
    leader_ith = int(len(mempool)/(settings.number_txs_tomine + 5))
    pubkeyleader = Wallet.decode_key(cur_leaders[leader_ith].encode())

    count_yes = 0
    for _, v in payload.uservotes.items():
        if v == 'yes':
            count_yes += 1
        
    # Check this addr is vote or not vote
    if uservotes.get(nodeAddress) == None and payload.numbervotes > count_yes:
        print('Received a block to vote')
        messagevote = 'yes'
        # check hash
        if bc.is_valid_block(block) == False:
            print('Block hash invalid')
            messagevote = 'no'
        
        # check leader
        # if leader sub
        verifier = DSS.new(pubkeyleader, 'fips-186-3')
        try: 
            verifier.verify(SHA256.new(block.hash()), payload.signature)
        except:
            print('Signature invalid')
            messagevote = 'no'
        
        # check txs
        for tx in block.transactions:
            if not bc.verify_tx(tx):
                print('Transactions invalid')
                messagevote = 'no'
                break
        print(f'Vote block is => {messagevote}')     
        
        # update uservotes 
        uservotes[nodeAddress] = messagevote
        if messagevote == 'yes':
            count_yes += 1
  
    # Check result
    if payload.numbervotes <= count_yes: 
        addressleader = payload.addressleader
        if nodeAddress != addressleader:
            # send result to leader
            send_voteblock(addressleader, block, payload.signature, payload.numbervotes, uservotes, addressleader)
        else:
            if bc.is_blockexist(block.hash()):
                return
            print('Vote block finish => This block will be add blockchain!')
            bc.add_block(block)
            utxoset = UTXOSet(bc)
            utxoset.update(block)
            ftxset = FTXSet(bc)
            ftxset.update(block)
            ftxset.update_repulist()
            print('New block added to Blockchain!')
            # broadcast to knownnodes
            for node in knownNodes:
                if node != nodeAddress:
                    send_inventory(node, 'block', [block.hash()]) 
    else:
        addrs = []
        for k, _ in uservotes.items():
            addrs.append(k)

        for node in knownNodes:
            if node != nodeAddress:
                for k in addrs:
                    if node != k:
                        send_voteblock(node, block, payload.signature, payload.numbervotes, uservotes, payload.addressleader)
    
def mining_block_por(bc: Blockchain):
    global mempool
    global miningAddress
    global knownNodes
    global timeWait
    
    success = False

    while not success:
        print('Waiting for mining...')
        if len(mempool) < settings.number_txs_tomine:
            print('Lack of Txs for mining... Waiting a few mins...')
            break
        if len(mempool) >= settings.number_txs_tomine and len(miningAddress) > 0:
            txs = []
            m_txs = []
            for _, tx in mempool.items():
                if bc.verify_tx(tx):
                    txs.append(tx)
                    m_txs.append(tx)
    
            if len(txs) == 0:
                print('All transactions are invalid! Waiting for new ones...')
                time.sleep(timeWait)
                continue
                
            cbtx = Transaction.new_coinbase(miningAddress, '')
            m_txs.append(cbtx)
            new_block = bc.create_newblock_por(m_txs)
            print('New Block is mined by Proof of Reputation!')

            for tx in txs:
                mempool.pop(tx.txid.hex())

            # create signature
            myw = open(settings.BASE_DIR_BC + '/wallet.json', 'r+')
            mywdata = json.load(myw)
            myw.close()
            privatekey = mywdata['privatekey'].encode()
            prikey = Wallet.decode_key(privatekey)
            signer = DSS.new(prikey, 'fips-186-3')
            signature = signer.sign(SHA256.new(new_block.hash()))
            # number votes
            repufile = open(settings.BASE_DIR_BC + '/repulist.json', 'r+')
            repudata = json.load(repufile)
            repufile.close()
            count_users = len(repudata['users'])

            ## ==== only for test: config curr fullnode
            count_users = settings.fullnode_numbers
            
            numbers = int(count_users*settings.percentnodes) + 1
            
            # send new_block to other nodes ===> vote block 
            for node in knownNodes:
                if node != nodeAddress:
                    send_voteblock(node, new_block, signature, numbers, {nodeAddress: 'yes'}, nodeAddress)
            break

##### HANDLE CONNECTION TO HANDLE ALL COMMAND
def handle_connection(conn, bc: Blockchain):
    request = conn.recv(4096)
    cmd = bytes_to_cmd(request[:commandLength])
    print(f'Received {cmd} command.\n')

    if cmd == 'version': 
        handle_version(request, bc)
    elif cmd == 'getblocks':
        handle_getblocks(request, bc)
    elif cmd == 'inv':
        handle_inventory(request, bc)
    elif cmd == 'getdata':
        handle_getdata(request, bc)
    elif cmd == 'block':
        handle_block(request, bc)
    elif cmd == 'tx':
        handle_tx(request, bc)
    elif cmd == 'repulist':
        handle_repulist(request, bc)
    elif cmd == 'voteblock':
        handle_voteblock(request, bc)
    else:
        print('Unknown Command')

    # lstrm = ipfs_remove_expire(bc)
    # if len(lstrm) > 0:
    #     print('Remove expired ipfs files success!')
    #     for rm in lstrm:
    #         print('List expired files: ', rm)

    conn.close()

##### START NODE
def start_node(typenode: str = settings.fullnode, mineraddress: str = ''):
    # check
    myip = get_ip() + ':3333'
    start_server(myip, mineraddress)
