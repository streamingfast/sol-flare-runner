#!/usr/bin/bash -xe

export PATH=$PATH:~/app/bin
export DEBUG="github.com/streamingfast/sf-solana/mindreader*"
export RUST_LOG=solana=info,solana_metrics=error
export DEEPMIND_BATCH_FILES_PATH=/deepmind-ram-disk/
sfsol -c config.yaml start mindreader-node