# xmnn-isax-flow
Demo scripts for XMNN Instruction Set Extension for muRISCV-NN

## Usage

Either clone this repository recursively via

```sh
git clone https://github.com/PhilippvK/xmnn-isax-flow.git --recursive
```

or fetch the submodules in a two-step fashion:

```sh
git clone https://github.com/PhilippvK/xmnn-isax-flow.git
git submodule update --init --recursive
```

Download toolchains

```sh
./scripts/download_helper.sh install/rv32im_ilp32/ gnu 2024.09.03 rv32im_zicsr_zifencei_ilp32
./scripts/download_helper.sh install/llvm/ llvm 19.1.6_xcvmem_heuristic
```

Setup venv for M2-ISA-R

```sh
./scripts/setup_m2isar.sh
```

Setup another venv for Seal5
```sh
./scripts/setup_seal5.sh
```

Generate and apply ETISS patches
```sh
# ./scripts/patch_etiss.sh [ETISS_ARCH]
./scripts/patch_etiss.sh RV32IMACFDXCoreV
```

Build patched ETISS simulator
```sh
# ./scripts/setup_etiss.sh [Release|Debug]
./scripts/setup_etiss.sh Release
```

Generate & build patched LLVM
```sh
./scripts/patch_llvm.sh
```

Compile target SW
```sh
# ./scripts/compile_example.sh [PROG] [gcc|llvm|seal5_llvm] [ARCH] [ABI]
./scripts/compile_example.sh seal5_llvm rv32im_xcvmem_xcvmac_xcvalu_xcvbitmanip_xmnn_zicsr_zifencei ilp32
```

Run program on patched architecture ETISS
```sh
# ./scripts/run_example.sh [PROG] [CPU_ARCH]
./scripts/run_example.sh hello_world RV32IMACFDXCoreVXMNN
```
