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

# cd $DEPLOY_DIR
# terminate the fabric network
# bash version.sh down

docker stop -f $(docker ps -a | grep hyperledger | awk '{print $1}')