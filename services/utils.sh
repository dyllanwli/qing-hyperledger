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
ROLE=NULL
# start docker.server and redis database
# systemctl start docker
# systemctl start redis

. ./profile.sh

function getWorkNodeIP() {
	echo "Getting work node"
	curl http://metadata/self/hosts/work_node
	WORK_NODE_IP=$(curl http://metadata/self/hosts/work_node | grep /ip | awk '{print $2}')
	echo "Getting work node ip: $WORK_NODE_IP"
}

function getEnv() {
	cd $EXPLORER_DIR
	# modified explorer port
	# s/default parameter/target parameter/g
	echo "changing port to $BROWSER_PORT"
	# sed -i "s/8888/$BROWSER_PORT/g" ./config/dev/server.json
	node config.js ./config/dev/server.json port $BROWSER_PORT
	echo "change admin user to $ADMIN_USER_NAME"
	# sed -i "s/admin@bigtree.com/$ADMIN_USER_NAME/g" ./config/dev/server.json
	node config.js ./config/dev/server.json superAccount.username $ADMIN_USER_NAME
	# sed -i "s/admin@666666/$ADMIN_USER_PASSWORD/g" ./config/dev/server.json
	node config.js ./config/dev/server.json superAccount.secret $ADMIN_USER_PASSWORD

	# echo "Getting env"
	# curl http://metadata/self/env
}

function restart() {
	# cd $SERVERS_DIR
	# getEnv
	cd $SERVERS_DIR
	echo "Restarting Blockchain Explorer"
	bash browser_start.sh
}

function getRole() {
	ROLE=$(curl http://metadata/self/host/role)
	if [ "$ROLE" = "browser_node" ]; then
		echo "This is Role"
	fi
}

if [ "$1" = "restart" ]; then
	restart
fi
