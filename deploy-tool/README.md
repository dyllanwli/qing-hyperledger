# Biglock-netowrk
This project is based on [Hyperledger fabric sample project](https://github.com/hyperledger/fabric-samples), which are used for testing and developing hyperledger fabric from scratch in a easy way.


## Environment Prerequisites
1. Install Node.js version 8.9.0 or higher, up to 9.0 ( Node v9.0+ is not supported ). (Using 8.9.4 in this project)
2. Npm tool version 5.5.1 or higher, up to 6.4.0
3. Using docker 1.13.1 in this project

## Package Prerequisites
```
yum install -y jq python-pip gcc gcc-c++ make unzip zip
pip install trash-cli
npm install -g pm2
```

## File Structure
1. `./artifacts-restore`: Stored 3 standard version of fabric network, including 1.2.0, 1.1.0, 1.0.6. And two sample yaml file for creating mongodb or mysql db with docker
2. `./networklauncher`: a integrated tool for using one command line to customize your desired network, including create crypto-config file and docker-compose file. 
3. `./tool`: a RESTful app modified from *balance-transfer* for create and join channel; install and instantiate chaincode. If you want to check more detail for network status information, please using `docker logs -f <CONTAINER ID>`.
4. `version.sh`: a script for changing artifacts version in artifacts.
5. `get_imag.sh`: a scripts for download fabric sample repositories, binaries, and docker images. Please specific the target version that you want to download.
6. `installChaincode.sh` and `invoke.sh`: use tool to handel hyperledger fabric
7. `invoke.sh`: sample invoke function for initialize createProduct
8. `binaries-restore`: restored fabric artifacts generate tools

## Notify
- run `npm install` in this project first
- put your chaincode into `./chaincodes`
- use `localhost:4000` by default for deploy tool

## Usage of `version.sh`
- `bash version.sh 1.0.6` move 1.0.6 network and tool from artifacts-resotre to artifacts and change node sdk package
- `bash version.sh 1.1.0` move 1.1.0 network and tool from artifacts-resotre to artifacts and change node sdk package
- `bash version.sh 1.2.0` move 1.2.0 network and tool from artifacts-resotre to artifacts and change node sdk package
- `bash version.sh check` check the fabric version
- `bash version.sh restart` bring down network with docker-compose and clear useless chaincode dev images, then restart network again
- `bash version.sh up` bring up network
- `bash version.sh down` bring down network

## Usage of Tool
- using curl to post request for manipulating hyperledger fabric
- example chaincode operation scripts located at `./installChaincode.sh` and `invoke.sh`, only adapted for over 1.1.0 version.
    - to use tool-1.0.6, please check `tool-1.0.6/testAPIs.sh`
    - to create channel and join channel, use `bash installChaincode.sh init`
    - to bypass the create channel and join channel, ignore the `init` parameter, use `bash installChaincode.sh`
    - for more information of tool, check the API scripts in tool folder.
- for presistence usage of tool, you can use `pm2 start` to start up `tool/app.js` as a daemon. Then use Postman or other http request tool for simplify your chaincode invoke.

## Happy Path
```
# Step1. install prerequisties and
npm install
# Step2. define your version 
bash version.sh 1.2.0
# Step3. up you network 
bash version.sh up
# Step4. run tool
bash runTool.sh
# Step5. open another terminal windows and handle your hyperledger fabric network
# Do remember to put your chaincodes into ./chaincodes folder
bash installChaincode.sh init
bash invoke.sh
```