#!/bin/bash
set -Eeuxo pipefail
cp -rf /.cargo $GITHUB_WORKSPACE/
chmod -R 777 $GITHUB_WORKSPACE/.cargo
cd $GITHUB_WORKSPACE
bash -c "$*"
