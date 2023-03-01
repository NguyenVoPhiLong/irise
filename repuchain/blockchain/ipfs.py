import subprocess
import ipfshttpclient



def cmd_sbp(cmd: list, base_dir: str = '', name: str = 'kubo'):
    path = base_dir + '/ipfs/' + name
    command =  cmd
    try:
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stdin=subprocess.PIPE, cwd=path, shell=True)
    except:
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stdin=subprocess.PIPE, cwd= 'PATHHERE', shell=True)
        
    out, _ = process.communicate()
    return out.decode(), process.returncode

### Start fAPI IPFS ###
# Check ipfs running
def IPFS_is_running(base_dir: str):
    _, success = cmd_sbp(cmd=['ipfs', 'swarm', 'peers'], base_dir=base_dir)
    if success == 0:
        return True
    return False

# Ipfs add (share only)
# def IPFS_add():
#     if IPFS_is_running():
#         print('Not Implement')
#         pass
#     else:
#         print('IPFS is not running')
#         return

# Ipfs get
# def IPFS_get(base_dir: str = '', ipfshash: str = ''):
#     if IPFS_is_running(base_dir):
#         pathstore = base_dir + '/ipfs/media'
#         res, _ = cmd_sbp(cmd=['ipfs', 'get', '-o', pathstore, ipfshash], base_dir=base_dir)
#         return res
#     else:
#         print('IPFS is not running')


# Ipfs cat
def IPFS_cat(base_dir:str, ipfshash: str):
    if IPFS_is_running(base_dir):
        res, _ = cmd_sbp(cmd=['ipfs', 'cat', ipfshash], base_dir=base_dir)
        # json.loads(value)
        return res
    else:
        print('IPFS is not running')

def IPFS_api_cat(ipfshash: str, muladdr='/ip4/127.0.0.1/tcp/5001'):
    try:
        client = ipfshttpclient.connect(muladdr)
    except:
        client = ipfshttpclient.connect('/ip4/0.0.0.0/tcp/5001')
    res = client.cat(ipfshash)
    return res   


# Check ipfs cluster running
def IPFSCluster_is_running(base_dir: str):
    _, success = cmd_sbp(cmd=['ipfs-cluster-ctl', 'id'], base_dir=base_dir, name='ipfs-cluster-ctl')
    if success == 0:
        return True
    return False

# Ipfs cluster add
def IPFSCluster_add(base_dir:str, filepath: str):
    if IPFSCluster_is_running(base_dir):
        res, _ = cmd_sbp(cmd=['ipfs-cluster-ctl', 'add', filepath], base_dir=base_dir, name='ipfs-cluster-ctl')
        return res.split(' ')[1]
    else:
        print('IPFSCluster is not running')

def IPFSCluster_api_add(filepath: str, muladdr='/ip4/127.0.0.1/tcp/9095'):
    try:
        client = ipfshttpclient.connect(muladdr)
    except:
        client = ipfshttpclient.connect('/ip4/0.0.0.0/tcp/5001')
        
    res = client.add(filepath)
    return res['Hash']

# Ipfs cluster pin rm
# def IPFSCluster_pin_rm(base_dir: str, ipfshash: str):
#     if IPFSCluster_is_running(base_dir):
#         res, _ = cmd_sbp(cmd=['ipfs-cluster-ctl', 'pin', 'rm', ipfshash], base_dir=base_dir, sname='ipfs-cluster-ctl')
#     else:
#         print('IPFSCluster is not running')

### End fAPI IPFS ###


# from blockchain.blockchain import Blockchain 
# from .ftx import *
# # Remove IPFS expired
# rmat = time.time()

# def ipfs_remove_expire(bc: Blockchain) -> list:
#     global rmat
    
#     lstrm = []
#     if time.time() - rmat > 28800: # 8 hour
#         rmat = time.time()
#         db = Blockchain.open_db(bc.pathdb)
#         if db == None:
#             return
#         ftx_db = db.prefixed_db(settings._prefixftx_)
#         for _ , value in ftx_db.iterator():
#             lstipfs = clssTX.Transaction.deserialize_ipfs(value)
#             for ipfs in lstipfs:
#                 if ipfs.expire != -1 and ipfs.expire < time.time():
#                     # remove ipfs
#                     try:
#                         IPFSCluster_pin_rm(ipfs.ipfsHashENC)
#                     except:
#                         print('ERROR: Cant remove file')
#                         return
#                     lstrm.append(ipfs.ipfsHashENC)
#         db.close()
#     return lstrm


# def ipfs_ecc_encrypt(pubk, ipfshash: str) -> bytes:
#     try:
#         ipfshashENC = ecc_encrypt(ipfshash.encode('utf-8'), pubk)
#         return ipfshashENC
#     except:
#         print('Public key invalid or wrong IPFS hash')
#         return

# def ipfs_ecc_decrypt(prik, ipfshashENC: bytes) -> str:
#     try:
#         ipfshash = ecc_decrypt(ipfshashENC, prik) 
#         return ipfshash.decode('utf-8')
#     except:
#         print('Private key invalid or wrong IPFS hash Encrypt')
#         return     

# def ipfs_share(prik: bytes, to: str, amount, pubkeyallowuser: bytes, ipfshashENC: bytes):
#     if not Wallet.validate_address(to):
#         print('ERROR: Recipient address is not valid')

#     pubkey = Wallet.decode_key(pubkeyallowuser)

#     bc = Blockchain.new_blockchain()
#     utxoset = UTXOSet(bc)
    
#     # Decrypt to get hash file
#     ipfshash = ipfs_ecc_decrypt(prik, ipfshashENC)
#     if ipfshash == None:
#         return
    




