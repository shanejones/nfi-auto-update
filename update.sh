#!/bin/bash
cd /root/freqtrade
FREQVERSION=`git describe --tags`

cd /root/NostalgiaForInfinity
GITRESPONSE=`git pull`
UPDATED='Already up to date.'
NFIVERSION=`git describe --tags`
NFICOMMENT=$(git show -s --format='%s')

if [[ $GITRESPONSE != $UPDATED ]]; then
  python3 /root/nfi-auto-update/notify.py "$FREQVERSION" "$NFIVERSION" "$NFICOMMENT"
  cp /root/NostalgiaForInfinity/NostalgiaForInfinityNext.py /root/freqtrade/user_data/strategies/NostalgiaForInfinityNext.py
  sleep 5
  /root/nfi-auto-update/restart.sh
fi
