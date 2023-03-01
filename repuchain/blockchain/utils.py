import json
import decimal
import random
import secrets
import subprocess
from Crypto.Cipher import AES
from Crypto.Hash import SHA256
from Crypto.PublicKey import ECC


# encode dict to bytes 
def encode_to_bytes(value) -> bytes:
    # str_value = str(value)
    encode_value = json.dumps(value).encode('utf-8')
    return encode_value
    
# decode bytes to dict
def decode_from_bytes(encode_value) -> dict:
    decode_value = json.loads(encode_value.decode('utf-8'))
    return decode_value

# int to bytes
def int_to_bytes(number: int) -> bytes:
    return bytes(str(number), encoding="utf-8")

# decimal to bytes
def decimal_to_bytes(x: decimal.Decimal) -> bytes:
    # Format decimal consistently, for hashing.
    # This ensures a == b <=> decimal_to_bytes(a) == decimal_to_bytes(b)
    sign, digits, exp = x.normalize().as_tuple()
    sign = ["", "-"][sign]
    digits = "".join(map(str, digits))
    return bytes(f"{sign}{digits}E{exp}", encoding="utf-8")

# Encrypt and Decrypt Message 
# def encrypt_AES_GCM(msg, secretKey):
#     aesCipher = AES.new(secretKey, AES.MODE_GCM)
#     ciphertext, authTag = aesCipher.encrypt_and_digest(msg)
#     return (ciphertext, aesCipher.nonce, authTag)

# def decrypt_AES_GCM(ciphertext, nonce, authTag, secretKey):
#     aesCipher = AES.new(secretKey, AES.MODE_GCM, nonce)
#     plaintext = aesCipher.decrypt_and_verify(ciphertext, authTag)
#     return plaintext

# def ecc_point_to_256_bit_key(point):
#     sha = SHA256.new(int_to_bytes(point.x))
#     sha.update(int_to_bytes(point.y))
#     return sha.digest()

# def ecc_encrypt(msg: bytes, pubKey) -> bytes: 
#     max_num = '0xffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551'
#     Gx = '0x6b17d1f2e12c4247f8bce6e563a440f277037d812deb33a0f4a13945d898c296'
#     Gy = '0x4fe342e2fe1a7f9b8ee7eb4a7c0f9e162bce33576b315ececbb6406837bf51f5'

#     pointG = ECC.EccPoint(int(Gx,0), int(Gy, 0), curve='P-256')
#     ciphertextPrivKey = secrets.randbelow(int(max_num,0))
#     pubKey = Wallet.decode_key(pubKey)

#     sharedECCKey = ciphertextPrivKey * pubKey.pointQ
#     secretKey = ecc_point_to_256_bit_key(sharedECCKey)
#     ciphertext, nonce, authTag = encrypt_AES_GCM(msg, secretKey)
#     ciphertextPubKey = ciphertextPrivKey * pointG
#     encryptedMsgObj = {
#         'ciphertext': ciphertext.hex(),
#         'nonce': nonce.hex(),
#         'authTag': authTag.hex(),
#         'ciphertextPubKey': hex(ciphertextPubKey.x) + '_' + hex(ciphertextPubKey.y)
#     }
#     return encode_to_bytes(encryptedMsgObj) 

# def ecc_decrypt(encryptedMsg, privKey) -> bytes:
#     privKey = Wallet.decode_key(privKey)
#     encryptedMsg = decode_from_bytes(encryptedMsg) 

#     ciphertext = bytes.fromhex(encryptedMsg['ciphertext']) 
#     nonce = bytes.fromhex(encryptedMsg['nonce']) 
#     authTag = bytes.fromhex(encryptedMsg['authTag'])
#     xy = encryptedMsg['ciphertextPubKey'].split('_')
#     ciphertextPubKey = ECC.EccPoint(int(xy[0],0), int(xy[1], 0), curve='P-256')

#     sharedECCKey = privKey.d * ciphertextPubKey
#     secretKey = ecc_point_to_256_bit_key(sharedECCKey)
#     plaintext = decrypt_AES_GCM(ciphertext, nonce, authTag, secretKey)
#     return plaintext

# Random Election by weight
# Example data: data = {'user1': 5000, 'user2': 2345, 'user3': 1345, 'user4':500}
def min_max_norm(data: list):
    norm_list = []
    min_value = min(data)
    max_value = max(data)

    if min_value == max_value:
        return data

    for value in data:
        if value != min_value:
            tmp = (value - min_value) / (max_value - min_value)
            norm_list.append(tmp)
        else:
            tmp = (value - min_value*0.9) / (max_value - min_value)
            norm_list.append(tmp)

    return norm_list

def random_election(data: dict):
    """
    Should give more data than needed data. 
    Example: Needed data[0:20] => data[0:21]
    """
    test_list = []
    numbers = []
    for k, v in data.items():
        numbers.append(v)
        test_list.append(k)

    if len(test_list) == 1:
        return test_list
    
    norm_numbers = min_max_norm(numbers)
    
    probs = []
    for number in norm_numbers:
        probs.append(number/sum(norm_numbers))
    
    list_choices = []
    results = random.choices(numbers, weights=probs, k=30)
    for i in range(0, len(results)):
        result_user = list(data.keys())[list(data.values()).index(results[i])]
        list_choices.append(result_user)
    
    uniques = list(set(list_choices))
    orders = []
    for unique in uniques:
        orders.append(list_choices.index(unique))
    orders.sort()
    
    finals = []
    for order in orders:
        finals.append(list_choices[order])
    return finals

