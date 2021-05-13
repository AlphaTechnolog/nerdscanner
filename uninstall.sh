#!/bin/bash

printf "Checking for existent installation... "

error() {
    echo $1
    exit 1
}

if [ ! -d /opt/nerdscanner ]; then
    error "FAIL. Please install nerdscanner (missing folder /opt/nerdscanner)"
fi

if [ ! -L /usr/bin/nerdscanner ]; then
    error "FAIL. Please install nerdscanner (missing file /usr/bin/nerdscanner)"
fi

printf "OK\nRemoving source code... "
sudo rm -rf /opt/nerdscanner
printf "OK\nRemoving binary... "
sudo rm /usr/bin/nerdscanner
echo "OK, nerdscanner removed successfully"
