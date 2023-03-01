import os
# difficult
_difficulty_ = 3

# genesis data
_genesiscoinbasedata_ = "The Times October 2, 2022. Blockchain for Individual Reputation"

# reward
_coinbase_ = 1000
_genesiscoinbase_ = 3000

# path to contain bc
_pathtobc_ = '/db'

# blocks contain blocks
_prefixblock_ = b'blocks'

# chainstate contain utxo
_prefixchainstate_ = b'chainstate'

# ftx contain ipfs tx
_prefixftx_ = b'ftx'

# known nodes
KNOWNNODES = '172.17.2.200:3333_172.17.2.228:3333'
# KNOWNNODES = '192.168.1.10:3333_192.168.1.5:3333'

# Base dir
BASE_DIR_BC = os.path.dirname(os.path.abspath(__file__))
BASE_DIR_BC = BASE_DIR_BC.replace('\\', '/')
# Node Type
fullnode = 'fullnode' # include IPFS
minenode = 'minenode' # not include IPFS

# init reputation list: pubkey and score --> order by score
reputationjson = {
    "blockindex": [
        1
    ],
    "leaders": {
        "index1": [
            "2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq36Pw12iSujtNmEuX867YQL6TWHnD6D9CHHiSiexX2pQ94"
        ]
    },
    "users": [
        {
            "pubkey": "2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq36Pw12iSujtNmEuX867YQL6TWHnD6D9CHHiSiexX2pQ94",
            "score": 0
        },
        {
            "pubkey": "2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq3NKeXbFMf7ztRRtxPvu9A8AaC5hTtwpov1JqPKKqnsWSt",
            "score": 0
        },
    ]
}

# current full node
# fullnode_numbers = 3
# fullnode_pubkeys = [
#     "2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq36Pw12iSujtNmEuX867YQL6TWHnD6D9CHHiSiexX2pQ94",
#     "2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq3NKeXbFMf7ztRRtxPvu9A8AaC5hTtwpov1JqPKKqnsWSt",
#     "2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq37sTkVCdn8GVhc6WXxHCtqwQD4C9RHpxYMbWHfZJk4Tq6",
#     ]

fullnode_numbers = 2
fullnode_pubkeys = [
    "2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq36Pw12iSujtNmEuX867YQL6TWHnD6D9CHHiSiexX2pQ94",
    "2wJAhNzhJjBB7o5pnHEu3gbr8hNWS3SvCyBq3NKeXbFMf7ztRRtxPvu9A8AaC5hTtwpov1JqPKKqnsWSt",
    ]

# 50% all users chance become to leader
percentnodes =  0.5

# Num question for LV1: 25 pro and 25 pot
num_ques_lv1 = 25

# Score to level up
score_lv1 = 5000

# number Tx to Mine
number_txs_tomine = 2