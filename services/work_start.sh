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
# including create and join channel, install example chaincode and instantiate it
cd $DEPLOY_DIR
bash runTool.sh
sleep 3
bash installChaincode.sh init

sleep 5
# sample invoke test
bash invoke.sh   
# quit the screen session
# screen -XS tool quit