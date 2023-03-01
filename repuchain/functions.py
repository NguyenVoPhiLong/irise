try:
    from blockchain.blockchain import *
    from server import send_tx
except:
    from repuchain.blockchain.blockchain import *
    from repuchain.server import *



def send(priksender: bytes, to: str, amount, default = True):
    if amount == 0:
        print('Amount must be other than 0.')
        return
    bc = Blockchain.new_blockchain()
    utxoset = UTXOSet(bc)
    ftxset = FTXSet(bc)
    wallet = Wallet.get_wallet(priksender)
    tx = Transaction.new_utxo_transaction(wallet, to, amount, b'', b'', utxoset)
    if tx == None:
        print('EROR: Not enough funds')
        return
    if default:
    # coinbase
        cbtx = Transaction.new_coinbase(wallet.get_address(), '')
        transactions = []
        transactions.append(cbtx)
        transactions.append(tx)
        new_block = bc.create_newblock(transactions)
        utxoset.update(new_block)
        ftxset.update(new_block)
    else:
        nodes = settings.KNOWNNODES
        knownnodes = nodes.split('_')
        for node in knownnodes:
            send_tx(node, tx)

    print(f'Send {amount} to {to} successfully!')

def send_txipfs(ipfshash: str, default = False):
    bc = Blockchain.new_blockchain()
    utxoset = UTXOSet(bc)
    ftxset = FTXSet(bc)
    ipfshash = ipfshash.encode()
    tx = Transaction.new_utxo_transaction(b'', '', 0, b'', ipfshash, utxoset)
    if tx == None:
        print('EROR: Can not create Tx IPFS')
        return
    print(tx.txid.hex())
    if default:
        transactions = []
        transactions.append(tx)
        new_block = bc.create_newblock(transactions)
        utxoset.update(new_block)
        ftxset.update(new_block)
        ftxset.update_repulist()
    else:
        nodes = settings.KNOWNNODES
        knownnodes = nodes.split('_')
        for node in knownnodes:
            send_tx(node, tx)

    print(f'Send Tx IPFS successfully!')