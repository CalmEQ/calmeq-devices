#!/bin/bash

SITE="http://localhost:3000/pies"

# MAC=$( cat /sys/class/net/eth0/address )
MAC=$[RANDOM % 100]:$[RANDOM %100]:$[RANDOM % 100]:$[RANDOM %100]:$[RANDOM % 100]:$[RANDOM %100]
LAT=$[RANDOM % 100].$[RANDOM %100]
LON=-$[RANDOM % 100].$[RANDOM %100]
DBLVL=$[RANDOM % 100]
NOW="date"

# curl error handling
# --fail returns numerical error code instead of an HTML document with an error. Need that
# --silent supresses crap like progress bar

# Leave ID unset.  Script will fetch it from server
ID=

for i in `seq 1 2` ;
do

  if [ -z "$ID" ]; then
    resp_json=$(curl --silent --fail -X POST $SITE \
      -d '{"py": {"identifier":"'$MAC'", "devicetime":"'$NOW'", "notes":"Hello from Pi"}}' \
      -H "Accept: application/json" -H "Content-Type: application/json")

      if [ ! -z "$resp_json" ]; then
        tmp=$(echo $resp_json | jq '.id')
      	if [ ! -z "$tmp" ]; then
	  ID=$tmp
          echo "Device ID: " $ID
	fi
      fi
  fi

  for j in `seq 1 20` ;
    do
      if [ ! -z "$ID" ]; then
	resp_json=$(curl --silent --fail -X POST $SITE/$ID/readings \
	-d '{"reading": {"lat":"'$LAT'", "identifier":"'$MAC'", "lon":"'$LON'", "dblvl":"'$DBLVL'", "devicetime":"'$NOW'" }}' \
	-H "Accept: application/json" -H "Content-Type: application/json")
	echo $resp_json
      fi
    done
done
