#!/bin/bash

set -e

if [ "$#" -gt 1 ]; then
    echo "Illegal number of parameters!"
    echo "Usage: $0 [ETISS_ARCH]"
    exit 1
fi

ETISS_ARCH=${1:-RV32IMACFDXCoreVXMNN}

export PYTHONPATH=$(pwd)/M2-ISA-R/
source M2-ISA-R/venv/bin/activate
python -m m2isar.frontends.coredsl2.parser cdsl/top.core_desc
python -m m2isar.backends.etiss.writer cdsl/gen_model/top.m2isarmodel --separate --static-scalars
deactivate

cp -r cdsl/gen_output/top/$ETISS_ARCH etiss/ArchImpl/
cd etiss
cp ArchImpl/RV32IMACFD/RV32IMACFDArchSpecificImp.cpp ArchImpl/$ETISS_ARCH/${ETISS_ARCH}ArchSpecificImp.cpp
sed -i "s/RV32IMACFD/$ETISS_ARCH/g" ArchImpl/$ETISS_ARCH/${ETISS_ARCH}ArchSpecificImp.cpp
git add --all
git commit -m "update $ETISS_ARCH etiss architecture"
cd -
