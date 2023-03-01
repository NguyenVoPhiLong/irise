from Crypto.Hash import SHA256
from Crypto.Signature import DSS
from decimal import Decimal
import base58
import secrets

try:
    import settings
    from .utxo import *
    from .wallet import *
    from .utils import *
except:
    from repuchain import settings
    from repuchain.blockchain.utxo import *
    from repuchain.blockchain.wallet import *
    from repuchain.blockchain.utils import *

# Define transaction
class Transaction:
    # Init Tx
    def __init__(self):
        self.txid = b""   
        self.ipfs = []              
        self.inputs = []
        self.outputs = []
        
    # Inner class: Tx Input
    class TXInput:
        def __init__(self, txid: bytes, index: int, signature: bytes, pubkey: bytes):
            self.txid = txid                    
            self.outputIndex = index   
            self.signature = signature
            self.pubkey = pubkey

        # convert TX input -> dict
        def to_dict(self):
            dict_tx = {
                'txid': self.txid.hex(),
                'outputIndex': self.outputIndex,
                'signature': self.signature.hex(),
                'pubkey': self.pubkey.decode('utf-8')
            }
            return dict_tx

        # uses_key check whether the address initiated the transaction -> bool
        def uses_key(self, pubkeyhash: bytes):
            lockingHash = Wallet.hash_publickey(self.pubkey)
            return lockingHash == pubkeyhash

    # Inner class: Tx Output
    class TXOutput:
        def __init__(self, value, pubkeyhash: bytes):
            # use decimal to avoid 0.1 + 0.2 != 0.3 problem
            self.value = Decimal(str(value))
            self.pubkeyhash = pubkeyhash    
        
        # convert TX output -> dict
        def to_dict(self):
            dict_tx = {
                'value': str(self.value),
                'pubkeyhash': self.pubkeyhash.hex()
            }
            return dict_tx


        # is_locked_with_key checks if the output can be unlocked with the provided data -> bool
        def is_locked_with_key(self, pubkeyhash: bytes):
            return self.pubkeyhash == pubkeyhash 

        # Lock -> bytes
        def lock(self, address: str):
            pubkeyhash = base58.b58decode(address)
            pubkeyhash = pubkeyhash[1:len(pubkeyhash)-4]
            self.pubkeyhash = pubkeyhash

    # Inner class: Tx Ipfs
    class TXIpfs:
        def __init__(self, pubkey: bytes, signature: bytes, ipfsHashENC: bytes, pubkeyhash: bytes, expire: int = -1):
            # In
            self.pubkey = pubkey            # owner
            self.signature = signature      
            self.ipfsHashENC = ipfsHashENC  # encrypt ipfshash (share) or not (solution)
            # Out
            self.pubkeyhash = pubkeyhash    # share to
            # Expire  
            self.expire = expire            # <- time.time() + int number

        def is_owner(self, pubkeyhash: bytes):
            lockingHash = Wallet.hash_publickey(self.pubkey)
            return lockingHash == pubkeyhash

        def is_locked_with_key(self, pubkeyhash: bytes):
            return self.pubkeyhash == pubkeyhash

        def sign(self, prikey: bytes):
            if self.pubkey != b'':
                data = self.ipfsHashENC + self.pubkeyhash
                prikey = Wallet.decode_key(prikey)
                signer = DSS.new(prikey, 'fips-186-3')
                signature = signer.sign(SHA256.new(data))
                self.signature = signature
        
        def verify(self):
            if self.pubkey != b'':
                data = self.ipfsHashENC + self.pubkeyhash
                pubkey = Wallet.decode_key(self.pubkey)
                verifier = DSS.new(pubkey, 'fips-186-3')
                try:
                    verifier.verify(SHA256.new(data), self.signature)
                except:
                    return False
                return True
        
        def to_dict(self):
            dict_tx = {
                'pubkey': self.pubkey.decode('utf-8'),
                'signature': self.signature.hex(),
                'ipfsHashENC': self.ipfsHashENC.decode('utf-8'),
                'pubkeyhash': self.pubkeyhash.hex(),
                'expire': self.expire
            }
            return dict_tx

    # Serialize list IPFS -> bytes
    @staticmethod
    def serialize_ipfs(listipfs: list):
        dict_ipfs = []
        for ipfs in listipfs:
            dict_ipfs.append(ipfs.to_dict())
        return encode_to_bytes(dict_ipfs)
    
    # Deserialize IPFS -> list of IPFS
    def deserialize_ipfs(data: bytes):
        listipfs = []
        ipfslst = decode_from_bytes(data)
        for ipfs in ipfslst:
            tmp = Transaction.TXIpfs(ipfs['pubkey'].encode('utf-8'), bytes.fromhex(ipfs['signature']), ipfs['ipfsHashENC'].encode('utf-8'), bytes.fromhex(ipfs['pubkeyhash']), ipfs['expire'])
            listipfs.append(tmp)
        return listipfs

    # Serialize Outputs -> bytes
    @staticmethod
    def serialize_outputs(outputs: list):
        dict_ops = []
        for ops in outputs:
            dict_ops.append(ops.to_dict())
        return encode_to_bytes(dict_ops)

    # Deserialize Outputs -> list of TXOutput
    @staticmethod
    def deserialize_outputs(data: bytes):
        outputs = []
        ops = decode_from_bytes(data)
        for op in ops:
            op_tx = Transaction.TXOutput(op['value'], bytes.fromhex(op['pubkeyhash']))
            outputs.append(op_tx)
        return outputs

    # Serialize Tx -> bytes
    def serialize_tx(self):
        ips = []
        for ip in self.inputs:
            ips.append(ip.to_dict())
        ops = []
        for op in self.outputs:
            ops.append(op.to_dict())
        ipfs = []
        for fs in self.ipfs:
            ipfs.append(fs.to_dict())

        dict_tx = {
            'txid': self.txid.hex(),
            'ipfs': ipfs,
            'inputs': ips,
            'outputs': ops
        }

        return encode_to_bytes(dict_tx)

    # Deserialize Tx -> Transaction
    @staticmethod
    def deserialize_tx(data: bytes):
        tx = decode_from_bytes(data)   
        new_tx = Transaction()
        new_tx.txid = bytes.fromhex(tx['txid'])
        ips = tx['inputs']
        for ip in ips:
            new_tx.add_input((bytes.fromhex(ip['txid'])), ip['outputIndex'], bytes.fromhex(ip['signature']), ip['pubkey'].encode('utf-8'))
        ops = tx['outputs']
        for op in ops:
            op_tx = Transaction.TXOutput(op['value'], bytes.fromhex(op['pubkeyhash']))
            new_tx.outputs.append(op_tx)
        ipfs = tx['ipfs']
        for fs in ipfs:
            ipfs_tx = Transaction.TXIpfs(fs['pubkey'].encode('utf-8'), bytes.fromhex(fs['signature']), fs['ipfsHashENC'].encode('utf-8'), bytes.fromhex(fs['pubkeyhash']), fs['expire'])
            new_tx.ipfs.append(ipfs_tx)
        return new_tx

    # Hash of Tx -> bytes
    def hash(self):
        tx = self.serialize_tx()
        return SHA256.new(tx).digest()

    # add Tx input
    def add_input(self, txid: bytes, index: int, signature: bytes, pubkey: bytes):
        ip = Transaction.TXInput(txid, index, signature, pubkey)
        self.inputs.append(ip)

    # add Tx output
    def add_output(self, value, address: str):
        op = Transaction.TXOutput(value, None)
        op.lock(address)
        self.outputs.append(op)

    # get input by index -> Tx input
    def get_input(self, index: int):
        return self.inputs[index]

    # get output by index -> Tx output
    def get_output(self, index: int):
        return self.outputs[index]

    # check if tx is coinbase -> bool
    def is_coinbase(self):
        return len(self.inputs) == 1 and len(self.get_input(0).txid) == 0 and self.get_input(0).outputIndex == -1

    # New UTXO Transaction -> Transaction
    @staticmethod
    def new_utxo_transaction(wallet: Wallet, to: str, amount, pubkeyhashAllow: bytes, ipfshash: bytes,  utxoset: UTXOSet):
        tx = Transaction()
        if wallet != b'' and to != '':
            pubkeyhash = Wallet.hash_publickey(wallet.publickey)
            accumulated, validOutputs = utxoset.find_spendable_outputs(pubkeyhash, amount) 

            if accumulated < amount:
                # 'EROR: Not enough funds'
                return None
            
            # Build a list of inputs
            for txid, outs in validOutputs.items():
                txid = bytes.fromhex(txid)
                for out in outs:
                    tx.add_input(txid, out, b"", wallet.publickey)
            
            # Build a list of outputs
            tx.add_output(amount, to)
            if accumulated > amount:
                tx.add_output(accumulated - Decimal(str(amount)), wallet.get_address())

        # Build a list of ipfs
        if len(ipfshash) > 0:
            # lock
            if pubkeyhashAllow == b'':
                # pubkeyhashAllow = 
                pass
            ipfs = Transaction.TXIpfs(b'', b'', ipfshash, b'', -1)
            tx.ipfs.append(ipfs)

        tx.txid = tx.hash()
        # Sign Tx
        if wallet != b'' and to != '':
            utxoset.bc.sign_tx(tx, wallet.privatekey)
            
        return tx


    # Tx coinbase -> Transaction
    @staticmethod
    def new_coinbase(address: str, data: str):
        if data == '':
            # data = secrets.token_bytes(20)
            data = secrets.token_hex(20)
        tx = Transaction()
        tx.add_input(b"", -1, b"", data.encode('utf-8'))
        tx.add_output(settings._coinbase_, address)
        tx.txid = tx.hash()
        return tx
    
    @staticmethod
    def new_genesiscoinbase(address: str, data: str):
        if data == '':
            # data = secrets.token_bytes(20)
            data = secrets.token_hex(20)
        tx = Transaction()
        tx.add_input(b"", -1, b"", data.encode('utf-8'))
        tx.add_output(settings._genesiscoinbase_, address)
        tx.txid = tx.hash()
        return tx

    # TrimmedCopy copy Tx but signature, pubkey is None -> Tx
    def trimmed_copy(self):
        tx = Transaction()
        tx.txid = self.txid
        for ip in self.inputs:
            tx.add_input(ip.txid, ip.outputIndex, b"", b"")
        for op in self.outputs:
            new_op = tx.TXOutput(op.value, op.pubkeyhash)
            tx.outputs.append(new_op)
        return tx

    # Sign Tx
    def sign(self, prikey: bytes, prevTxs: dict):
        if self.is_coinbase():
            return
        tx_copy = self.trimmed_copy()
        prikey = Wallet.decode_key(prikey)
        for inID in range(0, len(tx_copy.inputs)):

            prevTx = prevTxs[tx_copy.get_input(inID).txid.hex()]
            tx_copy.get_input(inID).signature = b""
            # pubkey of ip := pukeyhash of op which outputIndex of it
            tx_copy.get_input(inID).pubkey = prevTx.get_output(tx_copy.get_input(inID).outputIndex).pubkeyhash.hex().encode('utf-8')
            tx_copy.txid = tx_copy.hash()
            # pubkey of ip := b''
            tx_copy.get_input(inID).pubkey = b""

            signer = DSS.new(prikey, 'fips-186-3')
            signature = signer.sign(SHA256.new(tx_copy.serialize_tx()))
            self.get_input(inID).signature = signature

    # Verify signature of Tx -> bool
    def verify(self, prevTxs: dict):
        if self.is_coinbase():
            return True

        tx_copy = self.trimmed_copy()

        for inID in range(0, len(self.inputs)):
            prevTx = prevTxs[self.get_input(inID).txid.hex()]
            tx_copy.get_input(inID).signature = b""
            tx_copy.get_input(inID).pubkey = prevTx.get_output(self.get_input(inID).outputIndex).pubkeyhash.hex().encode('utf-8')
            tx_copy.txid = tx_copy.hash()
            tx_copy.get_input(inID).pubkey = b""

            pubkey = self.get_input(inID).pubkey
            pubkey = Wallet.decode_key(pubkey)
            verifier = DSS.new(pubkey, 'fips-186-3')
            try:
                verifier.verify(SHA256.new(tx_copy.serialize_tx()), self.get_input(inID).signature)
            except:
                return False
        return True









    def __str__(self):
        txid = self.txid.hex()
        str_tx = f'Transaction ID: {txid}\n'
        count = 0
        for ip in self.inputs:
            count += 1
            str_tx += f'+ Input {count}:\n'
            ipid = ip.txid.hex()
            str_tx += f'-- TxID: {ipid}\n'
            str_tx += f'-- OutputIndex: {ip.outputIndex}\n'
            ipsi = ip.signature
            str_tx += f'-- Signature: {ipsi}\n' 
            ippu = ip.pubkey
            str_tx += f'-- Pubkey: {ippu}\n' 
        count = 0
        for op in self.outputs:
            count += 1
            str_tx += f'+ Output {count}:\n'

            str_tx += f'-- Value: {op.value}\n'
            oppu = op.pubkeyhash.hex()
            str_tx += f'-- Pubkeyhash: {oppu}\n'
        if len(self.ipfs) > 0:
            for fs in self.ipfs:
                str_tx += f'+ IPFS:\n'
                fspu = fs.pubkey
                str_tx += f'-- Pubkey: {fspu}\n' 
                fssi = fs.signature
                str_tx += f'-- Signature: {fssi}\n' 
                fsfh = fs.ipfsHashENC
                str_tx += f'-- IPFShash: {fsfh}\n' 
                fsph = fs.pubkeyhash
                str_tx += f'-- Pubkeyhash: {fsph}\n' 
                exp = fs.expire
                str_tx += f'-- Expire: {exp}\n'
        else:
            str_tx += f'+ IPFS: Empty\n'
        return str_tx

