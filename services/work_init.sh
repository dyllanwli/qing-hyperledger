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
SERVERS_DIR=/root/qing-hyperledger/services
# prepare dir for persistent data
mkdir -p /data/peerdata/org1/peer0
mkdir -p /data/peerdata/org1/peer1
mkdir -p /data/peerdata/org2/peer0
mkdir -p /data/peerdata/org2/peer1
mkdir -p /data/ordererdata/orderer
mkdir -p /data/couchdbdata/org1/couchdb0
mkdir -p /data/couchdbdata/org1/couchdb1
mkdir -p /data/couchdbdata/org2/couchdb0
mkdir -p /data/couchdbdata/org2/couchdb1
# start docker.server and redis database
# using systemctl enable docker.service and systemctl enable redis for creating a auto-starting daemon when system startup
# systemctl start docker
# systemctl start redis
cd $SERVERS_DIR
git pull
# using git pull is as a matter of convenience to not frequently build kvm image, this command will be deprecated
chmod +x ./*

# using deploy-tool to build the hyperledger fabric network
# cd $DEPLOY_DIR
# bash version.sh up
# start a screen to run a fabric api daemon
# bash runTool.sh
