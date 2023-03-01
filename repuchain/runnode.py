import json

try:
    from server import start_node
    import settings
except:
    from repuchain.server import start_node
    from repuchain import settings

def run_bc():
    walletfile = open(settings.BASE_DIR_BC + '/wallet.json', 'r+')
    data_json = json.load(walletfile)
    walletfile.close()
    start_node(mineraddress=data_json['address'])

# Now run blockchain
run_bc()