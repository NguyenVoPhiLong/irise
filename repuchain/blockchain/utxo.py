from collections import defaultdict
from decimal import Decimal

try:
    import settings
    from . import transaction as clssTX
    from . import blockchain as clssBC
except:
    from repuchain import settings
    from repuchain.blockchain import blockchain as clssBC
    from repuchain.blockchain import transaction as clssTX 

class UTXOSet:
    def __init__(self, blockchain):
        self.bc = blockchain
    
    # del chainstate_db
    @staticmethod
    def del_chainstate(db):
        for key, _ in db.iterator():
            db.delete(key)

    # Update UTXOSet on chainstate_db
    def reindex(self):
        # Find UTXO
        utxo = self.bc.find_utxo()
        # Get chainstate
        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        chainstate_db = db.prefixed_db(settings._prefixchainstate_)
        UTXOSet.del_chainstate(chainstate_db)
        # Update chainstate db
        for txid, outs in utxo.items():
            key = bytes.fromhex(txid) 
            value = clssTX.Transaction.serialize_outputs(outs)
            chainstate_db.put(key, value)
        
        db.close()

    # Find UTXO and accumulated of UTXO with amount -> tuple of accumulated & (dict) TXoutputs
    def find_spendable_outputs(self, pubkeyhash: bytes, amount):
        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        chainstate_db = db.prefixed_db(settings._prefixchainstate_)
        unspent_ops = defaultdict(list) # value: store list of spent outputIndex - key: txid
        accumulated = 0
        
        for key, value in chainstate_db.iterator():
            txid = key.hex()
            outs = clssTX.Transaction.deserialize_outputs(value)

            count_op = 0
            for out in outs:
                if out.is_locked_with_key(pubkeyhash) and accumulated < amount:
                    accumulated += Decimal(str(out.value)) 
                    unspent_ops[txid].append(count_op)
                count_op += 1

        db.close()
        return accumulated, unspent_ops

    # Find all UTXO and accumulated of UTXO -> tuple of accumulated & (dict) TXoutputs
    def find_allspendable_outputs(self, pubkeyhash: bytes):
        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        chainstate_db = db.prefixed_db(settings._prefixchainstate_)
        unspent_ops = defaultdict(list) # value: store list of spent outputIndex - key: txid
        accumulated = 0
        
        for key, value in chainstate_db.iterator():
            txid = key.hex()
            outs = clssTX.Transaction.deserialize_outputs(value)

            count_op = 0
            for out in outs:
                if out.is_locked_with_key(pubkeyhash):
                    accumulated += Decimal(str(out.value)) 
                    unspent_ops[txid].append(count_op)
                count_op += 1

        db.close()
        return accumulated, unspent_ops


    # Find utxos by pubkeyhash
    def find_utxo(self, pubkeyhash: bytes):
        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        chainstate_db = db.prefixed_db(settings._prefixchainstate_)
        utxos = []
        for _ , value in chainstate_db.iterator():
            outs = clssTX.Transaction.deserialize_outputs(value)
            for out in outs:
                if out.is_locked_with_key(pubkeyhash):
                    utxos.append(out)

        db.close()
        return utxos

    # Update utxoset 
    def update(self, block):
        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        chainstate_db = db.prefixed_db(settings._prefixchainstate_)
     
        for tx in block.transactions:
            if not tx.is_coinbase():
                for ip in tx.inputs:
                    updated_outs = []
                    bytes_outs = chainstate_db.get(ip.txid)
                    outs = clssTX.Transaction.deserialize_outputs(bytes_outs)
                    count_op = 0
                    for out in outs:
                        if ip.outputIndex != count_op:
                            updated_outs.append(out)
                        count_op += 1

                    if len(updated_outs) == 0:
                        chainstate_db.delete(ip.txid)
                    else:
                        chainstate_db.put(ip.txid, clssTX.Transaction.serialize_outputs(updated_outs))

            new_outputs = []
            for out in tx.outputs:
                new_outputs.append(out)
            chainstate_db.put(tx.txid, clssTX.Transaction.serialize_outputs(new_outputs))
        
        db.close()
        print('Updated chainstate_db!')
