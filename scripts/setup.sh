#!/bin/sh
set -e

# init screeps if not already installed
if [ ! -f /data/.screepsrc ]; then

  # init screeps
  echo $STEAM_WEB_API_KEY | screeps init /data

fi

# run screeps
cd /data
/bin/sh /root/scripts/run.sh