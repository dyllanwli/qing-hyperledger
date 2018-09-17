# !/bin/bash

# use to test the etcd request 

curl -X PUT -H "Content-Type: application/json" http://127.0.0.1:9611/v1/data -d '
{
	"nodes": {
		"1": {
			"ip": "192.168.1.1",
			"name": "node1"
		},
		"2": {
			"ip": "192.168.1.2",
			"name": "node2"
		},
		"3": {
			"ip": "192.168.1.3",
			"name": "node3"
		},
		"4": {
			"ip": "192.168.1.4",
			"name": "node4"
		},
		"5": {
			"ip": "192.168.1.5",
			"name": "node5"
		}
	}
}'

curl -H "Accept: application/json" http://127.0.0.1:9611/v1/data/?pretty=true

echo "PUT and GET has done.."





echo "running MAPPING"
curl -H "Content-Type: application/json" -X PUT http://127.0.0.1:9611/v1/mapping -d '
{
    "192.168.1.1": {
        "node": "/nodes/1"
    },
    "192.168.1.2": {
        "node": "/nodes/2"
    },
    "192.168.1.3": {
        "node": "/nodes/3"
    }
}'

curl -H "Accept: application/json" http://127.0.0.1:9611/v1/mapping/?pretty=true
echo "MAPPING has done.."
