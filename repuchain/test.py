from blockchain.blockchain import *
from blockchain.merkletree import MerkleNode
from functions import send, send_txipfs
from blockchain.ipfs import *

from server import start_node, VoteBlock


# Test
def test_block():
    cb = Transaction.new_coinbase('LongBC', 'Success2')
    b = Block(index=2,nonce=20, transactions=[cb])
    c = b.serialize_block()
    print(c)
    d = b.deserialize_block(c)
    print(d, type(d))

def test_bc():
    pass

def test_tx():

    pass

def test_utxo():


    pass

def test_wallet():
    w = Wallet()
    w.create_wallet()
    address = w.get_address()
    b = w.validate_address(address)
    print(w.privatekey, w.publickey)
    print(b, address)
    pass

def test_send(pri1, pri2, add1, add2):
    
    pass

def test_utxo():
    pass

def test_newmerkle():
    data = [b'node1', b'node2', b'node3']
    # Level 1
    n1 = MerkleNode.new_merklenode(None, None, data[0])
    n2 = MerkleNode.new_merklenode(None, None, data[1])
    n3 = MerkleNode.new_merklenode(None, None, data[2])
    n4 = MerkleNode.new_merklenode(None, None, data[2])
    # Level 2
    n5 = MerkleNode.new_merklenode(n1, n2, None)
    n6 = MerkleNode.new_merklenode(n3, n4, None)
    # Level 3
    n7 = MerkleNode.new_merklenode(n5, n6, None)

    print('Test Merkle Node: ')

    if n5.data.hex() == '64b04b718d8b7c5b6fd17f7ec221945c034cfce3be4118da33244966150c4bd4':
        print('Level 1 hash 1 is correct')
    if n6.data.hex() == '08bd0d1426f87a78bfc2f0b13eccdf6f5b58dac6b37a7b9441c1a2fab415d76c':
        print('Level 1 hash 2 is correct')
    if n7.data.hex() == '4e3e44e55926330ab6c31892f980f8bfd1a6e910ff1ebc3f778211377f35227e':
        print('Root hash is correct')

    print('Test Merkle Tree: ')
    roothash = n7.data
    mtree = MerkleTree.new_merkletree(data)
    if roothash == mtree.rootnode.data:
        print('Merkle tree root hash is correct')


def main_01():
    pri1 = b'2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG5CexZEZwvDhF7nHJWfyKnXhAAbdhWkAWLGeXceE42fsCDLoCWevEoXx7DBeQqVy5rbKQoHWBZd98yFvFyZXEvyz5WcDtezmxcEx8VAn8PsGitSsn6vooKZnGdPPf365zegjLyUD1WEud'
    pub1 = b'2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq36Pw12iSujtNmEuX867YQL6TWHnD6D9CHHiSiexX2pQ94'
    add1 = 'LbNYQLhWKNemwCvVe144zcq5f5HvP8g7EP'

    pri2 = b'2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG3B246Nh6w5sCfr78XTEwyfMMPv52YtqGdtf1wGiN6PGJMtMmvvm19P7FnT52D1HEmD2jup8Y4t8vG7C2njak9pbsqcXuwpU8YfADiBRwtXKjuyhk2p9CfBNSizsLvP5Lg9xtvzDxhWwn'
    pub2 = b'2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq3NKeXbFMf7ztRRtxPvu9A8AaC5hTtwpov1JqPKKqnsWSt'
    add2 = 'LUzMdnH7BeuXtSTTfPggqFYPUks5P4xeqp'

    # bc = Blockchain()
    # bc.create_blockchain(add1)

    # bc = Blockchain.new_blockchain()
    # bc.delete_db()


    # Blockchain.send(pri1, add2, 3000)
    # Blockchain.send(pri2, add1, 1500)

    # bc = Blockchain.new_blockchain()
    # utxo = UTXOSet(bc)

    # print(f'Money: {add1}: ', utxo.find_allspendable_outputs(Wallet.get_pubkeyhash_from_address(add1)))
    # print(f'Money: {add2}: ', utxo.find_allspendable_outputs(Wallet.get_pubkeyhash_from_address(add2)))

    # print('Height: ', bc.get_height())

    # print(bc)

    pass

def test_txipfs():
    pri1 = b'2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG5CexZEZwvDhF7nHJWfyKnXhAAbdhWkAWLGeXceE42fsCDLoCWevEoXx7DBeQqVy5rbKQoHWBZd98yFvFyZXEvyz5WcDtezmxcEx8VAn8PsGitSsn6vooKZnGdPPf365zegjLyUD1WEud'
    add2 = 'LUzMdnH7BeuXtSTTfPggqFYPUks5P4xeqp'
    bc = Blockchain.new_blockchain()
    utxoset = UTXOSet(bc)
    w = Wallet.get_wallet(pri1)
    tx = Transaction().new_utxo_transaction(w, add2, 10, b'', b'QmRbyrx6SheSPC8rCqeAB7eu5kUcAEizNFfjDcmPndrcT7', utxoset) 
    
    return tx
    
    pass

def main():
    pri1 = b'2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG5CexZEZwvDhF7nHJWfyKnXhAAbdhWkAWLGeXceE42fsCDLoCWevEoXx7DBeQqVy5rbKQoHWBZd98yFvFyZXEvyz5WcDtezmxcEx8VAn8PsGitSsn6vooKZnGdPPf365zegjLyUD1WEud'
    pub1 = b'2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq36Pw12iSujtNmEuX867YQL6TWHnD6D9CHHiSiexX2pQ94'
    add1 = 'LbNYQLhWKNemwCvVe144zcq5f5HvP8g7EP'

    pri2 = b'2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG3B246Nh6w5sCfr78XTEwyfMMPv52YtqGdtf1wGiN6PGJMtMmvvm19P7FnT52D1HEmD2jup8Y4t8vG7C2njak9pbsqcXuwpU8YfADiBRwtXKjuyhk2p9CfBNSizsLvP5Lg9xtvzDxhWwn'
    pub2 = b'2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq3NKeXbFMf7ztRRtxPvu9A8AaC5hTtwpov1JqPKKqnsWSt'
    add2 = 'LUzMdnH7BeuXtSTTfPggqFYPUks5P4xeqp'

    # mes = b'QmRywd3bQy5ok3QXnxJiVELnWfTNHYnywbKuRwXGzLzWRQ'
    # enc_mes = ecc_encrypt(mes, pub1)
    # print(enc_mes)
    cid1 = 'QmVBqg6nTJP3Du1b38yab7FWmoTAnmC75EgGw6mUqU7AaZ'
    cid2 = 'QmTr9vW7hnb1qTCxET6gps8vmQC8Hv8U9VGovHydqxkmV4'
    # send(pri1, add2, 10)
    # print(bc.get_height())
    # start_node(mineraddress='LbNYQLhWKNemwCvVe144zcq5f5HvP8g7EP')
    
    
    # p = settings.BASE_DIR_BC + '/ipfs/media/result/baseresult.json'
    # print(p)
    # start_node(mineraddress=add1)

    

    # send_txipfs(ipfshash=cid2, default=False)

    # IPFSCluster__add(settings.BASE_DIR_BC, settings.BASE_DIR_BC + '/ipfs/media/result/baseresult.json')

    # start_node(mineraddress=add1)
    # send_txipfs(ipfshash=cid1, default=True)
    # bc = Blockchain.new_blockchain()
    # print(bc)
    # ftx = FTXSet(bc)
    # ftx.update_repulist()
    # print(bc.delete_db())

    # a = IPFS__cat(settings.BASE_DIR_BC, cid1)
    # print(a)

    # for k, v in bc.iterator().items():
    #     if bc.is_valid_block(v):
    #         print('block', k, 'yes')
    #     else:
    #         print('block', k, 'no')
    # ftx = FTXSet(bc)
    # ftx.update_repulist()
    # bc.delete_db()

    # '/ip4/127.0.0.1/tcp/9095'
    # client = ipfshttpclient.connect('/ip4/127.0.0.1/tcp/9095')
    # result = client.add('D:/2.CAOHOC/__LuanVan/CodeDemo/irise/repuchain/runnode.py')
    # r = result['Hash']

    # m = IPFSCluster_api_add()

    # r = IPFS_api_cat('QmVBqg6nTJP3Du1b38yab7FWmoTAnmC75EgGw6mUqU7AaZ')
    # print(r)
    # s = json.loads(r)
    # print(s['hash_solution'][0])
    # test_wallet()
    
if __name__ == '__main__':
    
    main()