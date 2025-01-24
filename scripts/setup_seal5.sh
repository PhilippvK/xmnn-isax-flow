#!/bin/bash

set -e

if [ "$#" -ne 0 ]; then
    echo "Illegal number of parameters!"
    echo "Usage: $0"
    exit 1
fi

cd seal5
test -d venv || virtualenv -p python3 venv  # Alternative (requires `apt install python3-venv`): python3.10 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cd -
