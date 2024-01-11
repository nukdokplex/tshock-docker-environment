#!/bin/bash
set -euo pipefail
CMD="./TShock.Server -configpath /home/tshock/tshock_data/config -worldpath /home/tshock/tshock_data/world -worldselectpath /home/tshock/tshock_data/world -logpath /home/tshock/tshock_data/log"

# Pass in world if set
if [ "${world:-null}" != null ]; then
    if [ ! -f "/home/tshock/tshock_data/world/$world" ]; then
        echo "World file does not exist! Quitting..."
        exit 1
    fi
    CMD="$CMD -world /home/tshock/tshock_data/world/$world"
fi

echo "Starting container, CMD: $CMD $@"
exec $CMD $@
