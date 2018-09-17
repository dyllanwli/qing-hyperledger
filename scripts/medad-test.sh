# !/bin/bash

# This scripts is use for test the whole running flow
CURRENT_DIR=${PWD}

# start metad
cd $CURRENT_DIR/bin
./metad -backend etcd -nodes http://127.0.0.1:2379 -log_level debug -listen :8080