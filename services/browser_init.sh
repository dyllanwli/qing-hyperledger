#!/bin/bash
# /**
#  * @author [lidiya]
#  * @email [lidiya@veredholdings.com]
#  * @create date 2018-09-19 14:24:42
#  * @modify date 2018-09-19 14:24:42
#  * @desc [description]
# */


INIT_DIR=${PWD}
DEPLOY_DIR=/root/qing-hyperledger/deploy-tool

# start docker.server and redis database
systemctl start docker 
systemctl start redis

cd ~
sed -i "s/localhost/$WORK_NODE_IP/g" network-config-tls.json