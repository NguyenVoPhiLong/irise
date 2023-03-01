import sys, os, shutil
import plyvel
from collections import defaultdict, OrderedDict


try:
    import settings
    from .block import *
    from .transaction import *
    from .utxo import *
    from .wallet import *
    from .utils import *
    from .ftx import *
except:
    from repuchain import settings
    from repuchain.blockchain.block import *
    from repuchain.blockchain.transaction import *
    from repuchain.blockchain.utxo import *
    from repuchain.blockchain.wallet import *
    from repuchain.blockchain.utils import *
    from repuchain.blockchain.ftx import *


# Define Blockchain
class Blockchain:
    # Init the Blockchain
    def __init__(self):
        self.difficulty = settings._difficulty_
        self.pathdb = settings._pathtobc_
        
    @staticmethod
    def open_db(pathdb: str, created = False):
        try:
            db = plyvel.DB(settings.BASE_DIR_BC + pathdb, create_if_missing = created)
            return db
        except:
            return None
        
    
    # New Blockchain
    @staticmethod
    def new_blockchain():
        bc = Blockchain()
        if not Blockchain.exist_db(bc.pathdb):
            # create folder db and copy all file from dbgenesis to db 
            print('Copy genesis database')
            shutil.copytree(settings.BASE_DIR_BC +'/dbgenesis', settings.BASE_DIR_BC +'/db')
            print('Success')
        
        return bc

    # Create or get Blockchain
    def create_blockchain(self, address: str):
        if self.exist_db(self.pathdb):
            print('Blockchain already exist.')
            db = Blockchain.open_db(self.pathdb)
            db.close()
            return
        else:
            print('Blockchain is not found. Create one first.')
            os.makedirs(settings._pathtobc_)
            db = Blockchain.open_db(self.pathdb, created=True)
            db.close()

        self.create_genesisblock(address)
        # Update UTXOSet & FTXSet
        utxoset = UTXOSet(self)
        utxoset.reindex()
        ftxset = FTXSet(self)
        ftxset.reindex()
        print('New Blockchain. Success!')
        return self

    # Check if DB exist -> Bool
    @staticmethod
    def exist_db(pathdb: str):
        return os.path.isdir(settings.BASE_DIR_BC + pathdb)

    # Genesis Block
    def create_genesisblock(self, address: str):
        if self.get_lasthash() != b"":
            return
        cbtx = Transaction.new_genesiscoinbase(address, settings._genesiscoinbasedata_)
        transactions = []
        transactions.append(cbtx)
        self.create_newblock(transactions)
        

    # Delete DB
    def delete_db(self):
        db = Blockchain.open_db(self.pathdb)
        if db == None:
            return
        for key, _ in db.iterator():
            db.delete(key)
        db.close()
        shutil.rmtree(settings.BASE_DIR_BC + self.pathdb)
        print('Deleted done!')
        if os.path.isfile(settings.BASE_DIR_BC + '/repulist.json'):
            os.remove(settings.BASE_DIR_BC + '/repulist.json')
        print('Deleted repulist done!')

    # Add new Block
    def add_block(self, block: Block):
        db = Blockchain.open_db(self.pathdb)
        if db == None:
            return
        blocks_db = db.prefixed_db(settings._prefixblock_)
        b_key = block.hash()
        b_value = block.serialize_block()
        blocks_db.put(b_key, b_value)
        # update last block hash
        blocks_db.put('l'.encode('utf-8'), b_key)
        db.close()

    # Proof Of Work -> Block
    def mine_block(self, block: Block):
        maxNonce = sys.maxsize
        # Loop with maxNonce
        while block.nonce < maxNonce:
            blockhash = block.hash()
            blockhash = blockhash.hex()
            if blockhash[:self.difficulty] == "0"*self.difficulty:
                return block
            else:
                block.nonce += 1
        # return None

    # create new block -> Block
    def create_newblock(self, transactions: list):
        # Verify Txs
        for tx in transactions:
            if not self.verify_tx(tx):
                print('ERROR: Invalid Transaction')
                return
        new_block = Block(self.get_height() + 1, self.get_lasthash(), 0, transactions)
        mine_new_block = self.mine_block(new_block)
        self.add_block(mine_new_block)
        print('New block added to Blockchain!')
        return mine_new_block
    
    # create new block by POR -> Block
    def create_newblock_por(self, transactions: list):
        # Verify Txs
        for tx in transactions:
            if not self.verify_tx(tx):
                print('ERROR: Invalid Transaction')
                return
        new_block = Block(self.get_height() + 1, self.get_lasthash(), 0, transactions)
        mine_new_block = self.mine_block(new_block)
        print('New block is mined!')
        return mine_new_block

    # Get the block by block hash -> Block
    def get_block(self, blockhash: bytes):
        db = Blockchain.open_db(self.pathdb)
        if db == None:
            return
        blocks_db = db.prefixed_db(settings._prefixblock_)
        bytes_block = blocks_db.get(blockhash)
        db.close()
        if bytes_block == None:
            return None
        return Block.deserialize_block(bytes_block)
    
    # Get hash of last block -> hex string
    def get_lasthash(self): 
        db = Blockchain.open_db(self.pathdb)
        if db == None:
            return
        blocks_db = db.prefixed_db(settings._prefixblock_)
        last_hash = blocks_db.get('l'.encode('utf-8'))
        db.close()
        if last_hash == None:
            return b""
        return last_hash

    # Get height blockchain -> int
    def get_height(self):
        try:
            last_hash = self.get_lasthash()
            last_block = self.get_block(last_hash)
            return last_block.index
        except:
            return 0
    
    # Get list of hashes block -> list
    def get_blockhashes(self):
        blockhashes = []
        for _, block in self.iterator().items():
            blockhashes.append(block.hash())
        return blockhashes


    # Check block if valid -> bool
    def is_valid_block(self, block: Block):
        blockhash = block.hash()
        blockhash = blockhash.hex()
        # Check previous hash
        index = block.index
        if index == 1:
            return True
        previous_block = self.iterator().get(index-1)
        if previous_block.hash() != block.previous_hash:
            return False
        # Check hash
        if blockhash[0:self.difficulty] != "0"*self.difficulty:
            return False
        return True

    # Check chain if valid
    def is_valid_chain(self):
        pass

    # Find UTXO -> dict txid & list of TXOutputs
    def find_utxo(self):
        utxo = defaultdict(list) # value: store list of TXOuputs - key: txid
        spent_txos = defaultdict(list) # value: store list of spent outputIndex - key: txid
        for _ , block in self.iterator().items():
            for tx in block.transactions:
                txid = tx.txid.hex()

                for outIndex in range(0, len(tx.outputs)):
                    flag = False
                    if spent_txos.get(txid) != None:
                        for spentoutIndex in spent_txos[txid]:
                            if spentoutIndex == outIndex:
                                flag = True
                                break
                        if flag:
                            continue
                    
                    utxo[txid].append(tx.get_output(outIndex))

                if not tx.is_coinbase():
                    for ip in tx.inputs:                       
                        ipid = ip.txid.hex()
                        spent_txos[ipid].append(ip.outputIndex)
     
        return utxo

    # Find IPFS TX => FTX
    def find_ftx(self):
        ftx = defaultdict(list) # key: txid - value: ipfs
        
        for _ , block in self.iterator().items():
            for tx in block.transactions:
                txid = tx.txid.hex()
                for ipfs in tx.ipfs:
                    if ipfs.expire > time.time() or ipfs.expire == -1:
                        ftx[txid].append(ipfs)
        
        return ftx 

    # convert blockchain -> orderdict
    # use: for i, b in bc.iterator().items() 
    # index: ... 5 4 3 2 1 
    def iterator(self):
        bc = dict()
        blockhash = self.get_lasthash()
        loop = self.get_height()
       
        while loop > 0:
            block = self.get_block(blockhash)
            bc[loop] = block
            blockhash = block.previous_hash
            loop -= 1
        # bc = OrderedDict(sorted(bc.items()))
        return bc

        
    # Find Tx -> Transaction
    def find_tx(self, txid: bytes):
        bc = self.iterator()
        for order, block in bc.items():
            for tx in block.transactions:
                if tx.txid == txid:               
                    return tx
        return None

    # Sign Tx -> None
    def sign_tx(self, tx: Transaction, prikey: bytes):
        # sign ipfs
        if len(tx.ipfs) > 0:
            tx.ipfs[0].sign(prikey)
        # sign inp
        prevTxs = dict()
        for ip in tx.inputs:
            prevTx = self.find_tx(ip.txid)
            if prevTx != None:
                prevTxs[ip.txid.hex()] = prevTx
        tx.sign(prikey, prevTxs)   

    
    # Verify Tx -> None
    def verify_tx(self, tx: Transaction):
        # verify ipfs
        if len(tx.ipfs) > 0:
            flag = tx.ipfs[0].verify()
            if flag == False: 
                return False
            else:
                return True
        # verify inp
        prevTxs = dict()
        for ip in tx.inputs:
            prevTx = self.find_tx(ip.txid)
            if prevTx != None:
                prevTxs[ip.txid.hex()] = prevTx
        return tx.verify(prevTxs)

    # Check Block if is exist -> bool
    def is_blockexist(self, blockhash: bytes):
        if self.get_block(blockhash) == None:
            return False
        return True

    # Get balance
    def get_balance(self, address: str):
        utxoset = UTXOSet(self)
        ftxset = FTXSet(self)
        pubkeyhash = Wallet.get_pubkeyhash_from_address(address)
        accumulated, _ = utxoset.find_allspendable_outputs(pubkeyhash)
        ftxlst = ftxset.find_ftx(pubkeyhash)

        return accumulated, ftxlst

    # Print Blockchain
    def __str__(self):
        blockchain = ''
        bc = Blockchain()
        if not Blockchain.exist_db(bc.pathdb):
            return 'Blockchain does not exist'
        bc = self.iterator()
        for _ , block in bc.items():
            list_tx = []
            for tx in block.transactions:
                list_tx.append(decode_from_bytes(tx.serialize_tx()))
            if block.previous_hash == b'0'*64:
                blockchain += str("Block#: %s\nTimestamp: %s\nHash: %s\nPrevious_Hash: %s\nNonce: %s\nTransactions: %s\nSignature: %s\n" %(block.index, block.timestamp, block.hash().hex(), block.previous_hash.decode(), block.nonce, list_tx, block.signature.decode()))
            else:
                blockchain += str("Block#: %s\nTimestamp: %s\nHash: %s\nPrevious_Hash: %s\nNonce: %s\nTransactions: %s\nSignature: %s\n" %(block.index, block.timestamp, block.hash().hex(), block.previous_hash.hex(), block.nonce, list_tx, block.signature.decode()))
            # blockchain += 'Is Valid Block: ' + str(self.is_valid_block(block)) + '\n\n'
        
        if blockchain == '':
            return 'Empty Blockchain'
        return blockchain