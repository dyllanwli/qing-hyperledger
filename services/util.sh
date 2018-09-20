#!/usr/bin/env bash
# /**
#  * @author [lidiya]
#  * @email [lidiya@veredholdings.com]
#  * @create date 2018-09-19 14:24:42
#  * @modify date 2018-09-19 14:24:42
#  * @desc [description]
# */


INIT_DIR=${PWD}
DEPLOY_DIR=/root/qing-hyperledger/deploy-tool
EXPLORER_DIR=/root/blockchain-explorer
SERVERS_DIR=/root/qing-hyperledger/services
export PATH=$PATH:/root/.nvm/versions/node/v8.9.4/bin/
# start docker.server and redis database
# systemctl start docker 
# systemctl start redis

. ./profile.sh

function restart() {
    cd $SERVERS_DIR
    bash browser_start.sh
}

function getWorkNodeIP() {
    echo "Getting work node" 
    curl http://metadata/self/hosts/work_node
    WORK_NODE_IP=$(curl http://metadata/self/hosts/work_node | grep /ip | awk '{print $2}')
    echo "Getting work node ip: $WORK_NODE_IP" 
}

function getEnv() {
    echo "Getting self env"
    curl http://metadata/self/env
}