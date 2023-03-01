from Crypto.Hash import SHA256

class MerkleNode:
    def __init__(self):
        self.left = None
        self.right = None
        self.data = None
    
    # New merkle node
    @staticmethod
    def new_merklenode(left, right, data: bytes):
        mnode = MerkleNode()
        if left == None and right == None:
            mnode.data = SHA256.new(data).digest()
        else:
            prevhashs = left.data + right.data
            mnode.data = SHA256.new(prevhashs).digest()
        
        mnode.left = left
        mnode.right = right

        return mnode

class MerkleTree:
    def __init__(self) -> None:
        self.rootnode = None
    
    # New merkle tree
    @staticmethod
    def new_merkletree(data: list):
        mtree = MerkleTree()
        nodes = []

        if len(data)%2 != 0:
            data.append(data[-1])
        
        for datum in data:
            node = MerkleNode.new_merklenode(None, None, datum)
            nodes.append(node)

        for i in range(0, int(len(nodes)/2)):
            newlevel = []

            for j in range(0, len(nodes), 2):
                node = MerkleNode.new_merklenode(nodes[j], nodes[j+1], None)
                newlevel.append(node)
        
            nodes = newlevel
            
        mtree.rootnode = nodes[0]
        
        return mtree