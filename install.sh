#!/bin/bash
show_help() {
cat << EOF
usage: $0 [-nr] [-h]

optional arguments:
    -nr, --no-install-requirements  Don't install the python requirements
EOF
exit 0
}

if [[ $1 == '-h' || $1 == '--help' ]]; then
    show_help
fi

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

if [[ $1 != "--no-install-requirements" && $1 != '-nr' ]]; then
    printf "OK\nInstalling requirements... "
    python3 -m pip install -r /opt/nerdscanner/requirements.txt
fi

echo "OK, now, nerdscanner is installed"
