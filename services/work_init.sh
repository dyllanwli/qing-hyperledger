#!/bin/bash
# /**
#  * @author [lidiya]
#  * @email [lidiya@veredholdings.com]
#  * @create date 2018-09-19 14:23:47
#  * @modify date 2018-09-19 14:23:47
#  * @desc [description]
# */

INIT_DIR=${PWD}
DEPLOY_DIR=/root/qing-hyperledger/deploy-tool

# start docker.server and redis database
systemctl start docker 
systemctl start redis

# using deploy-tool to build the hyperledger fabric network
cd $DEPLOY_DIR
bash version.sh up
# start a screen to run a fabric api daemon
# bash runTool.sh
