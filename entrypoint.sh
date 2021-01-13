#!/bin/bash
set -Eeuxo pipefail

chmod -R 777 $GITHUB_WORKSPACE/.cargo
cd $GITHUB_WORKSPACE
bash -c "$*"
