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
# start docker.server and redis database
# systemctl start docker 
# systemctl start redis

WORK_NODE_IP=0.0.0.0
function getWorkNodeIP() {
    echo "Getting work node" 
    curl http://metadata/self/hosts/work_node
    WORK_NODE_IP=$(curl http://metadata/self/hosts/work_node | grep /ip | awk '{print $2}')
    echo "Getting work node ip: $WORK_NODE_IP" 
}
getWorkNodeIP

cd $EXPLORER_DIR/config
# modified work node port
sed -i "s/localhost/$WORK_NODE_IP/g" network-config-tls.json
sed -i "s/localhost/$WORK_NODE_IP/g" server.json

cd $EXPLORER_DIR
# modified explorer port
env
echo "changing port to $BROWSER_PORT"
sed -i "s/8888/$BROWSER_PORT/g" config.json
echo "change admin user to $ADMIN_USER_NAME"
sed -i "s/admin@bigtree.com/$ADMIN_USER_NAME/g" config.json
sed -i "s/admin@666666/$ADMIN_USER_PASSWORD/g" config.json



cd $EXPLORER_DIR
export PATH=$PATH:/root/.nvm/versions/node/v8.9.4/bin/
pm2 start server.js