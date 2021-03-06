#!/usr/bin/env bash
# /**
#  * @author [lidiya]
#  * @email [lidiya@veredholdings.com]
#  * @create date 2018-09-19 14:24:42
#  * @modify date 2018-09-19 14:24:42
#  * @desc [description]
# */
echo "Running Browser_start"
INIT_DIR=${PWD}
DEPLOY_DIR=/root/qing-hyperledger/deploy-tool
EXPLORER_DIR=/root/blockchain-explorer
SERVERS_DIR=/root/qing-hyperledger/services
export PATH=$PATH:/root/.nvm/versions/node/v8.9.4/bin/
# start docker.server and redis database
# systemctl start docker
# systemctl start redis
pm2 delete all
kill 9 $(ps -ef |grep node | awk '{print $2}')

systemctl restart redis

. $SERVERS_DIR/profile.sh
. $SERVERS_DIR/utils.sh

# default work node ip
WORK_NODE_IP=0.0.0.0

getWorkNodeIP
# using metadata to get the workNodeIP
if [ "$WORK_NODE_IP" != "" ]; then
   cd $EXPLORER_DIR/config
# modified work node port
   sed -i "s/localhost/$WORK_NODE_IP/g" ./dev/network-config-tls.json
   sed -i "s/localhost/$WORK_NODE_IP/g" ./dev/docker.json
fi
getEnv
# get user defined environment parameters

cd $EXPLORER_DIR
pm2 start ecosystem.config.js --env dev
