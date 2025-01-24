#!/bin/bash

set -e

if [ "$#" -gt 0 ]; then
    echo "Illegal number of parameters!"
    echo "Usage: $0"
    exit 1
fi

export PYTHONPATH=$(pwd)/seal5/
source seal5/venv/bin/activate
DEST=/tmp/seal5_llvm_mnn BUILD_CONFIG=release_assertions VERBOSE=0 LLVM_REF="llvmorg-19.1.6" INSTALL=0 python3 scripts/seal5_flow.py
deactivate
