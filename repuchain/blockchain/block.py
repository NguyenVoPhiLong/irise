import time
from Crypto.Hash import SHA256

try:
    from .transaction import *
    from .utils import *
    from .merkletree import MerkleTree
except:
    from repuchain.blockchain.transaction import *
    from repuchain.blockchain.utils import *
    from repuchain.blockchain.merkletree import MerkleTree

# Define the block
class Block:
    # Init the Block 
    def __init__(self, index: int = 1, previous_hash: bytes = b"0"*64, nonce: int = 0, transactions: list = [], signature: bytes = b""):
        self.index = index
        self.timestamp = time.time() 
        self.previous_hash = previous_hash
        self.nonce = nonce
        self.transactions = transactions
        self.signature = signature

    # Hash the Block -> bytes
    def hash(self):
        block = int_to_bytes(self.index) + int_to_bytes(self.timestamp) + self.previous_hash + int_to_bytes(self.nonce) + self.hash_transactions() + self.signature
        return SHA256.new(block).digest()
    
    # Hash transaction -> bytes
    def hash_transactions(self):
        txs = []
        for tx in self.transactions:
            txs.append(tx.serialize_tx())
        
        mtree = MerkleTree.new_merkletree(txs)
        return mtree.rootnode.data

    # Serialize block to store in db -> bytes
    def serialize_block(self):
        list_txs = []
        for tx in self.transactions:
            tx = tx.serialize_tx()
            list_txs.append(decode_from_bytes(tx))

        dict_block = {
            'index': self.index,
            'hash': (self.hash()).hex(),
            'previous_hash': self.previous_hash.hex(),
            'timestamp': self.timestamp,
            'nonce': self.nonce,
            'transactions': list_txs,
            'signature': (self.signature).decode('utf-8')
        }
        return encode_to_bytes(dict_block)

    # Deserialize bytes block -> block
    @staticmethod  
    def deserialize_block(data: bytes):
        block = decode_from_bytes(data)
        transactions = []
        for dict_tx in block['transactions']:
            tx = Transaction()
            b_tx = encode_to_bytes(dict_tx)
            tx_new = tx.deserialize_tx(b_tx)
            transactions.append(tx_new)

        b = Block()
        b.index = int(block['index'])
        b.previous_hash = bytes.fromhex(block['previous_hash'])
        b.timestamp = float(block['timestamp'])
        b.nonce = int(block['nonce'])
        b.transactions = transactions
        b.signature = block['signature'].encode('utf-8')

        return b


    # Print Block
    def __str__(self):
        list_txs = []
        for tx in self.transactions:
            tx = tx.serialize_tx()
            list_txs.append(decode_from_bytes(tx))
        if self.index == 1:
            return str("Block#: %s\nTimestamp: %s\nHash: %s\nPrevious_Hash: %s\nNonce: %s\nTransactions: %s\nSignature: %s\n" %(self.index, self.timestamp, self.hash().hex(), self.previous_hash, self.nonce, list_txs, self.signature.decode()))
        return str("Block#: %s\nTimestamp: %s\nHash: %s\nPrevious_Hash: %s\nNonce: %s\nTransactions: %s\nSignature: %s\n" %(self.index, self.timestamp, self.hash().hex(), self.previous_hash.hex(), self.nonce, list_txs, self.signature.decode()))

    



