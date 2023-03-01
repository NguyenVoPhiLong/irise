import os, time, json
import base58

try:
    from blockchain.wallet import Wallet
    import settings
    from . import transaction as clssTX
    from . import blockchain as clssBC
    from blockchain.ipfs import *
    from .utils import random_election
except:
    from repuchain import settings
    from repuchain.blockchain import blockchain as clssBC
    from repuchain.blockchain import transaction as clssTX
    from repuchain.blockchain.ipfs import *
    from repuchain.blockchain.wallet import Wallet
    from repuchain.blockchain.utils import random_election

version = b'0'

class InfoIPFS:
    def __init__(self, author: bool, expire) -> None:
        self.author = author
        self.expire = expire

class FTXSet:
    def __init__(self, blockchain) -> None:
        self.bc = blockchain

    # del ftx_db
    @staticmethod
    def del_ftxdb(db):
        for key, _ in db.iterator():
            db.delete(key)
    
    def reindex(self):
        # Find FTX
        ftx = self.bc.find_ftx()
        # Get ftx_db
        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        ftx_db = db.prefixed_db(settings._prefixftx_)
        FTXSet.del_ftxdb(ftx_db)
        # Update ftx db
        for txid, lstipfs in ftx.items():
            key = bytes.fromhex(txid) 
            value = clssTX.Transaction.serialize_ipfs(lstipfs)
            ftx_db.put(key, value)

        db.close()



    # Find ftx by pubkeyhash, and check author of file is true or false
    def find_ftx(self, pubkeyhash: bytes):
        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        ftx_db = db.prefixed_db(settings._prefixftx_)
        ipfslst = dict()
        for _ , value in ftx_db.iterator():
            lstipfs = clssTX.Transaction.deserialize_ipfs(value)
            for ipfs in lstipfs:
                if ipfs.is_locked_with_key(pubkeyhash) and (ipfs.expire == -1 or ipfs.expire > time.time()):
                    ipfshashenc = ipfs.ipfsHashENC.decode('utf-8')
                    if ipfs.is_owner(pubkeyhash):
                        info = InfoIPFS(True, ipfs.expire)
                        ipfslst[ipfshashenc] = info
                    else:
                        info = InfoIPFS(False, ipfs.expire)
                        ipfslst[ipfshashenc] = info
        db.close()
        return ipfslst
    
    # find users can access file
    def find_users_by_ipfshash(self, ipfshash: bytes):
        users = dict()
        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        ftx_db = db.prefixed_db(settings._prefixftx_)
        for _ , value in ftx_db.iterator():
            lstipfs = clssTX.Transaction.deserialize_ipfs(value)
            for ipfs in lstipfs:
                if ipfs.ipfsHashENC == ipfshash and (ipfs.expire == -1 or ipfs.expire > time.time()):
                    versionedPayload = version + ipfs.pubkeyhash
                    checksum = Wallet.checksum(versionedPayload)
                    fullPayload = versionedPayload + checksum
                    address = base58.b58encode(fullPayload)
                    users[address.decode('utf-8')] = False

                    pukeyhashowner = Wallet.hash_publickey(ipfs.pubkey)
                    versionedPayload = version + pukeyhashowner
                    checksum = Wallet.checksum(versionedPayload)
                    fullPayload = versionedPayload + checksum
                    address = base58.b58encode(fullPayload)
                    users[address.decode('utf-8')] = True

        db.close()
        return users

    # update FTX
    def update(self, block):
        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        ftx_db = db.prefixed_db(settings._prefixftx_)

        for tx in block.transactions:
            key = tx.txid
            value = clssTX.Transaction.serialize_ipfs(tx.ipfs)
            ftx_db.put(key, value)
        db.close()
        print('Updated ftx_db!')

    # create reputation list from FTX 
    def update_repulist(self):
        repulist = dict()
        list_hashENC = []

        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        ftx_db = db.prefixed_db(settings._prefixftx_)
        for _ , value in ftx_db.iterator():
            lstipfs = clssTX.Transaction.deserialize_ipfs(value)
            for ipfs in lstipfs:
                list_hashENC.append(ipfs.ipfsHashENC.decode())
        db.close()
        
        for i in list_hashENC:
            # data = IPFS__cat(settings.BASE_DIR_BC, i)
            data = IPFS_api_cat(i)
            json_data = json.loads(data)
            # get data
            sol_hash = json_data['hash_solution'][0]
            # data_sol = IPFS__cat(settings.BASE_DIR_BC, sol_hash)
            data_sol = IPFS_api_cat(sol_hash)
            json_data_sol = json.loads(data_sol)
            level = json_data_sol['levelcompetence']
            sol_pubkey = json_data['hash_solution'][1]
            sol_score = json_data['score_solution']
            r_pubkey = []
            for p, _ in json_data['hash_rates'].items():
                r_pubkey.append(p)
            r_score = json_data['score_rates']
            sol_type = json_data['type_solution']
            try:
                black_rates = json_data['black_rates']
            except:
                black_rates = []
            # update dict
            # talent
            level_competence = 'level' + str(level)
            if repulist.get(sol_pubkey) == None:
                repulist[sol_pubkey] = {
                    level_competence : {
                        'pro': [],
                        'pot': [],
                        'bonous': []
                    }   
                }
            repulist[sol_pubkey][level_competence][sol_type].append(sol_score)
            # mentor
            for rp in r_pubkey:
                if repulist.get(rp) == None:
                    repulist[rp] = {
                        level_competence : {
                            'pro': [],
                            'pot': [],
                            'bonous': []
                        }   
                    }
                if rp in black_rates:
                    repulist[rp][level_competence]['bonous'].append(int(-r_score/2))
                else:
                    repulist[rp][level_competence]['bonous'].append(r_score)

        # create repulist
        # create users
        users = []
        
        record = dict()
        for pubk, values in repulist.items():
            s = 0
            record[pubk] = dict()
            for repulv, scores in values.items():
                if repulv == 'level1':
                    num_ques = settings.num_ques_lv1
                elif repulv == 'level2':
                    pass
                print(scores)
                s_pro = scores['pro']
                s_pot = scores['pot']
                b_score = scores['bonous']
                if len(s_pro) == 0:
                    avg_pro = 0
                else:
                    avg_pro = sum(s_pro)/num_ques
                if len(s_pot) == 0:
                    avg_pot = 0
                else:
                    avg_pot = sum(s_pot)/num_ques
                
                s = round(avg_pro + avg_pot + sum(b_score), 6)
                 
                record[pubk][repulv] = s
    
        for pubk, values in record.items():
            score = 0
            if values.get('level1') != None:
                score += values['level1']
            if values.get('level2') != None:
                score += values['level2']
            if values.get('level3') != None:
                score += values['level3']
            if values.get('level4') != None:
                score += values['level4']
            if values.get('level5') != None:
                score += values['level5']

            data = {
                'pubkey': pubk,
                'score': score
            }
            users.append(data)
       
        count_users = len(users)
        ## ==== only for test: config curr fullnode
        count_users = settings.fullnode_numbers
        
        # create leaders
        numbers_chance_leader = int(count_users*settings.percentnodes) + 1
        sorted_users = sorted(users, key=lambda k: k['score'], reverse=True)
        j_result = dict()
        try:
            for i in range(0, numbers_chance_leader):
                j_result[sorted_users[i]['pubkey']] = sorted_users[i]['score']
        except:
            for i in range(0, len(users)):
                j_result[sorted_users[i]['pubkey']] = sorted_users[i]['score']
        
        ## ==== only for test: config curr fullnode
        pubkeys = settings.fullnode_pubkeys
        j_result_test = dict()
        for k, v in j_result.items():
            for pubk in pubkeys:
                if k == pubk:
                    j_result_test[pubk] = v

        print(j_result)
        print(j_result_test)
        
        pubkleaders = random_election(j_result_test)

        print(pubkleaders)
        # create file json repulist
        bc_newheight = self.bc.get_height()
        repufile = open(settings.BASE_DIR_BC + '/repulist.json', 'r+')
        data = json.load(repufile)
        repufile.close()
        # init reputation list
        lst_index = []
        for i in range(1, bc_newheight + 1):
            lst_index.append(i)
        data['blockindex'] = lst_index
        data['leaders']['index'+ str(bc_newheight)] = pubkleaders
        data['users'] = users

        # write file
        repufile = open(settings.BASE_DIR_BC + '/repulist.json', 'w')
        repufile.write(json.dumps(data, indent = 4))
        repufile.close()
        print('Updated repulist!')

        return repulist

    def get_repulist(self):
        repulist = dict()
        list_hashENC = []

        db = clssBC.Blockchain.open_db(self.bc.pathdb)
        if db == None:
            return
        ftx_db = db.prefixed_db(settings._prefixftx_)
        for _ , value in ftx_db.iterator():
            lstipfs = clssTX.Transaction.deserialize_ipfs(value)
            for ipfs in lstipfs:
                list_hashENC.append(ipfs.ipfsHashENC.decode())
        db.close()
        
        for i in list_hashENC:
            # data = IPFS__cat(settings.BASE_DIR_BC, i)
            data = IPFS_api_cat(i)
            json_data = json.loads(data)
            # get data
            sol_hash = json_data['hash_solution'][0]
            # data_sol = IPFS__cat(settings.BASE_DIR_BC, sol_hash)
            data_sol = IPFS_api_cat(sol_hash)
            json_data_sol = json.loads(data_sol)
            level = json_data_sol['levelcompetence']
            sol_pubkey = json_data['hash_solution'][1]
            sol_score = json_data['score_solution']
            r_pubkey = []
            for p, _ in json_data['hash_rates'].items():
                r_pubkey.append(p)
            r_score = json_data['score_rates']
            sol_type = json_data['type_solution']
            try:
                black_rates = json_data['black_rates']
            except:
                black_rates = []
            # update dict
            # talent
            level_competence = 'level' + str(level)
            if repulist.get(sol_pubkey) == None:
                repulist[sol_pubkey] = {
                    level_competence : {
                        'pro': [],
                        'pot': [],
                        'bonous': []
                    }   
                }
            repulist[sol_pubkey][level_competence][sol_type].append(sol_score)
            # mentor
            for rp in r_pubkey:
                if repulist.get(rp) == None:
                    repulist[rp] = {
                        level_competence : {
                            'pro': [],
                            'pot': [],
                            'bonous': []
                        }   
                    }
                if rp in black_rates:
                    repulist[rp][level_competence]['bonous'].append(int(-r_score/2))
                else:
                    repulist[rp][level_competence]['bonous'].append(r_score)

        # create repulist
        record = dict()
        for pubk, values in repulist.items():
            record[pubk] = dict()
            for repulv, scores in values.items():
                if repulv == 'level1':
                    num_ques = settings.num_ques_lv1
                elif repulv == 'level2':
                    pass
                print(scores)
                s_pro = scores['pro']
                s_pot = scores['pot']
                b_score = scores['bonous']
                if len(s_pro) == 0:
                    avg_pro = 0
                else:
                    avg_pro = sum(s_pro)/num_ques
                if len(s_pot) == 0:
                    avg_pot = 0
                else:
                    avg_pot = sum(s_pot)/num_ques
                 
                record[pubk] = {
                    'pro': avg_pro,
                    'pot': avg_pot
                }
                
        return record

    