#!/bin/bash
cd /root/NostalgiaForInfinity

GITRESPONSE=`git pull`
UPDATED='Already up to date.'
GITMESSAGE=`git log -1 --pretty=%B`

if [[ $GITRESPONSE != $UPDATED ]]; then
        cp NostalgiaForInfinityNext.py /root/freqtrade/user_data/strategies/NostalgiaForInfinityNext.py
        python3 /root/nfi-auto-update/notify.py $GITMESSAGE
fi