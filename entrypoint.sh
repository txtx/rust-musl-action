#!/bin/bash
set -Eeuxo pipefail
# cp -rf /.cargo $GITHUB_WORKSPACE/
# chmod -R 777 $GITHUB_WORKSPACE/.cargo
cd $GITHUB_WORKSPACE
rustup target add x86_64-unknown-linux-musl --toolchain stable-x86_64-unknown-linux-gnu
bash -c "$*"
