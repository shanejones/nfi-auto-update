#!/bin/bash

cd /root/freqtrade/
. ./.env/bin/activate
/usr/bin/screen -dmS freqtrade_nfi_bot freqtrade trade -c /root/freqtrade/user_data/config.json -s NostalgiaForInfinityNext