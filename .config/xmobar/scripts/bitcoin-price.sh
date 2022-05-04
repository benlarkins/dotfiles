#!/usr/bin/bash
curl -s https://api.coinbase.com/v2/prices/BTC-USD/spot | python -c "import json, sys; print(\"BTC: \${amount}\".format(amount=json.load(sys.stdin)['data']['amount']))"
