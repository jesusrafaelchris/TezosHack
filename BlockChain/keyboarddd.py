import keyboard
import time
import json

public_key = "tz1gTeXmoEk43yxtiyGdmhQ2FPWHo5o285zR"
metadata_ipfs_link = "ipfs://bafkreic34fbftfhnphv3ri2iwh7hafqpzjj4u4x6hitnmlnartdu5hpnuq"
token_ID = 10

time.sleep(3)

def mint(public_key, metadata_ipfs_link, token_ID):
    mint = {
            "handler": "nft",
            "name": "create_and_mint",
            "args": {
            "token_id": 1,
            "to_address" : public_key,
            "metadata_ipfs": metadata_ipfs_link,
            "amount" : 1,
            }
        }


    keyboard.write(f"insert into peppermint.operations (originator, command) values ('tz1gTeXmoEk43yxtiyGdmhQ2FPWHo5o285zR', '#{json.dumps(mint)}')")
    token_ID += 1


#UPON SERVER request
mint(public_key, metadata_ipfs_link, token_ID)
