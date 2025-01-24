#!/bin/bash

set -e

test -d install/rv32im_ilp32 || ./scripts/download_helper.sh install/rv32im_ilp32/ gnu 2024.09.03 rv32im_zicsr_zifencei_ilp32

test -d install/llvm || ./scripts/download_helper.sh install/llvm/ llvm 19.1.6_xcvmem_heuristic

./scripts/setup_m2isar.sh

./scripts/setup_seal5.sh

./scripts/patch_etiss.sh RV32IMACFDXCoreVXMNN

./scripts/setup_etiss.sh Release

./scripts/patch_llvm.sh

./scripts/compile_example.sh mnn seal5_llvm rv32im_xcvmem_xcvmac_xcvalu_xcvbitmanip_xmnn_zicsr_zifencei ilp32

./scripts/run_example.sh mnn RV32IMACFDXCoreVXMNN
