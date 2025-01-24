#!/bin/bash

set -e

if [ "$#" -gt 1 ]; then
    echo "Illegal number of parameters!"
    echo "Usage: $0 [release_assertions|release|debug]"
    exit 1
fi

BUILD_TYPE=${1:-release_assertions}
CCACHE=${CCACHE:-0}
PREPATCHED=${PREPATCHED:-0}

# LLVM_REF="llvmorg-19.1.7"
LLVM_REF="llvmorg-19.1.6"

export PYTHONPATH=$(pwd)/seal5/
source seal5/venv/bin/activate
DEST=/tmp/seal5_llvm_mnn BUILD_CONFIG=$BUILD_TYPE VERBOSE=0 LLVM_REF=$LLVM_REF INSTALL=1 DEPLOY=0 EXPORT=0 CCACHE=$CCACHE PREPATCHED=$PREPATCHED python3 scripts/seal5_flow.py
deactivate
