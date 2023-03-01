from Crypto.PublicKey import ECC
from Crypto.Hash import SHA256, RIPEMD160
import base58


version = b'0'
addressChecksumLen = 4

class Wallet:
    def __init__(self, privatekey: bytes = None, publickey: bytes = None) -> None:
        self.privatekey = privatekey
        self.publickey = publickey

    # Create wallet has private & public key
    def create_wallet(self):
        privatekey = ECC.generate(curve='P-256')
        publickey = privatekey.public_key()
        self.privatekey = privatekey.export_key(format='DER', compress=True)
        self.publickey = publickey.export_key(format="DER", compress=True)
        self.encode_key()

    # Hash public key -> bytes
    @staticmethod
    def hash_publickey(publickey) -> bytes:
        publicSHA256 = SHA256.new(publickey)
        publicRIPEMD160 = RIPEMD160.new(publicSHA256.digest())
        return publicRIPEMD160.digest()

    # Hash pubkeyhash two times by SHA256 -> bytes
    @staticmethod
    def checksum(payload):
        firstSHA256  = SHA256.new(payload)
        secondSHA256 = SHA256.new(firstSHA256.digest())
        return secondSHA256.digest()[:addressChecksumLen]

    # Create address from publickey -> str
    def get_address(self):
        pubkey = self.publickey
        pubkeyhash = self.hash_publickey(pubkey)
        versionedPayload = version + pubkeyhash
        checksum = self.checksum(versionedPayload)
        fullPayload = versionedPayload + checksum
        address = base58.b58encode(fullPayload)

        return address.decode('utf-8')

    # ValidateAddress check if address if valid -> bool
    @staticmethod
    def validate_address(address: str):
        pubkeyhash = base58.b58decode(address)
        actualChecksum = pubkeyhash[len(pubkeyhash)-addressChecksumLen:]
        version = pubkeyhash[0:1]
        pubkeyhash = pubkeyhash[1:len(pubkeyhash)-addressChecksumLen]
        targetChecksum = Wallet.checksum(version + pubkeyhash)

        return actualChecksum == targetChecksum

    # Get pubkeyhash from address -> bytes
    @staticmethod
    def get_pubkeyhash_from_address(address: str):
        pubkeyhash = base58.b58decode(address)
        pubkeyhash = pubkeyhash[1:len(pubkeyhash) - 4]
        return pubkeyhash

    # Encode Privatekey & Publickey -> None
    def encode_key(self):
        self.privatekey = base58.b58encode(self.privatekey)               
        self.publickey = base58.b58encode(self.publickey)

    # Decode key -> EccKey class
    @staticmethod
    def decode_key(encoded: bytes):
        key = base58.b58decode(encoded)
        return ECC.import_key(key)
         

    # Get Wallet from private key -> wallet
    @staticmethod
    def get_wallet(encoded: bytes):
        prikey = Wallet.decode_key(encoded)
        pubkey = prikey.public_key()
        wallet = Wallet()
        wallet.privatekey = prikey.export_key(format='DER', compress=True)
        wallet.publickey = pubkey.export_key(format='DER', compress=True)
        wallet.encode_key()
        return wallet
        