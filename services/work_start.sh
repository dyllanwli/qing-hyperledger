#!/usr/bin/env bash
# /**
#  * @author [lidiya]
#  * @email [lidiya@veredholdings.com]
#  * @create date 2018-09-19 14:23:47
#  * @modify date 2018-09-19 14:23:47
#  * @desc [description]
# */

INIT_DIR=${PWD}
DEPLOY_DIR=/root/qing-hyperledger/deploy-tool
EXPLORER_DIR=/root/blockchain-explorer
SERVERS_DIR=/root/qing-hyperledger/services
cd $DEPLOY_DIR
bash version.sh up
cd $DEPLOY_DIR
sleep 6
echo "Running deploy tool to deploy fabric"
export PATH=$PATH:/root/.nvm/versions/node/v8.9.4/bin/
pm2 delete all
bash runTool.sh
sleep 2
bash installChaincode.sh init

sleep 5
# sample invoke test
# bash invoke.sh   
# quit the screen session
# screen -XS tool quit