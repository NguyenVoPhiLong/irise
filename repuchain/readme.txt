I/ IPFS

1/ Run IPFS
 - Download kubo (ver 0.16.0).
 - Run cmd: ipfs init --profile server
 - Run cmd: ipfs daemon
2/ IPFS Swarm -> tạo private network
 - Tạo key trong dir:          /.ipfs/swarm.key
 - Copy swarm.key cho các nút khác khi tham gia vào swarm
 - Xóa bootstrap mặc định:     ipfs bootstrap rm --all
 - Check list bootstrap:       ipfs bootstrap list
 - Tạo bootstrap mới:          ipfs bootstrap add /ip4/[node_IP]/tcp/4001/ipfs/[peer_id]  
	Ex: if node1: ip1 peerid1 => set bootstrap /ip4/ip2/tcp/4001/ipfs/peerid2 
		   node2: ip2 peerid2 => set bootstrap /ip4/ip1/tcp/4001/ipfs/peerid1

3/ IPFS Cluster -> nhân bản dữ liệu
 - Cài đặt IPFS cluster:
					          ipfs-cluster-service
					          ipfs-cluster-ctl
 - Tạo key và 
   tạo biến môi trường: 	  export/set CLUSTER_SECRET='XYZ'
   
 - Run trên root node:	      ipfs-cluster-service init 
 					          ipfs-cluster-service daemon
 
							  export/set CLUSTER_SECRET='XYZ'
 - Các node khác cài đặt 	  ipfs-cluster-service init
   tương tự:			      ipfs-cluster-service daemon --bootstrap /ip4/[first_node_IP]/tcp/9096/ipfs/[peer_id] # check peer_id by ipfs-cluster-ctl id (not ipfs peerID)


II/ Blockchain

Json:                                         RList2    RList3    RList4    RList5    RList6
Blockchain:                         Block1 <= Block2 <= Block3 <= Block4 <= Block5 <= Block6 <= ....
Leader:                             RList1    RList1    RList2    RList3    RList4    RList5
                                     

1/ Bầu cử Leader
- List of all nodes ReputaionList
- Define Group N% nodes with high score in ReputaionList
- Random election Leader with weight is reputation score in ReputaionList

2/ Check Leader and create new Block

3/ Leader broadcast new block to nodes in ReputaionList
- Nodes receive block and verify block
- Send message vote Block

4/ Leader receive result vote block 
- Add block to chain
- Update UTXO, FTX set
- Update ReputaionList
- broadcast new block to nodes


III/ Test

Node 1:
-pri1 = b'2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG5CexZEZwvDhF7nHJWfyKnXhAAbdhWkAWLGeXceE42fsCDLoCWevEoXx7DBeQqVy5rbKQoHWBZd98yFvFyZXEvyz5WcDtezmxcEx8VAn8PsGitSsn6vooKZnGdPPf365zegjLyUD1WEud'
-pub1 = b'2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq36Pw12iSujtNmEuX867YQL6TWHnD6D9CHHiSiexX2pQ94'
-add1 = 'LbNYQLhWKNemwCvVe144zcq5f5HvP8g7EP'

Node 2:
-pri2 = b'2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG3B246Nh6w5sCfr78XTEwyfMMPv52YtqGdtf1wGiN6PGJMtMmvvm19P7FnT52D1HEmD2jup8Y4t8vG7C2njak9pbsqcXuwpU8YfADiBRwtXKjuyhk2p9CfBNSizsLvP5Lg9xtvzDxhWwn'
-pub2 = b'2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq3NKeXbFMf7ztRRtxPvu9A8AaC5hTtwpov1JqPKKqnsWSt'
-add2 = 'LUzMdnH7BeuXtSTTfPggqFYPUks5P4xeqp'

Node 3:
-pri3 = b'2EPbyvKQKUaUPMF7Mm94FjEzvs5tsLWfesyc97W1dqYeeZFEG3ACjUx7keHBjC4r1WiBrUyS3LvNAqwt1Varmd2iVB9An6JJLmjqiUbmCdCyGixkYsy2Hahtm8oGTRhHNrWCG4b37URwP6WJXicHK4DK3CZr3e2Uco2nQcJT8Uj6bKXdTprEtCmKTf93F'
-pub3 = b'2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq37sTkVCdn8GVhc6WXxHCtqwQD4C9RHpxYMbWHfZJk4Tq6'
-add3 = 'LeuXEjViiB6rdJS321jEoh2XLw8pmALNSY'