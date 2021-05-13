#!/bin/bash
printf "Checking for existent installation... "

error() {
    echo $1
    exit 1
}

if [ -d /opt/nerdscanner ]; then
    error "FAIL. Remove the folder /opt/nerdscanner"
fi

if [ -L /usr/bin/nerdscanner ]; then
    error "FAIL. Remove the file /usr/bin/nerdscanner"
fi

cd $(dirname $0)

printf "OK\nCopying source code to /opt/nerdscanner... "
sudo mkdir -p /opt/nerdscanner
sudo cp -r ./* /opt/nerdscanner
sudo chmod -R 777 /opt/nerdscanner
printf "OK\nCreating symlink to /usr/bin/nerdscanner... "
sudo ln -s /opt/nerdscanner/nerdscanner /usr/bin/nerdscanner
sudo chmod -R 777 /usr/bin/nerdscanner
echo "OK, nerdscanner is installed"
