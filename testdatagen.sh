#!/bin/bash

MAC=$( cat /sys/class/net/eth0/address )
LAT=37.330179
LON=-122.056250

SITE="http://localhost:3000/pies"

#NOW="$( date )"
NOW="date"
DBLVL=50


ID=
for i in `seq 1 1` ;
do
    if [ -z $ID ]; then
        # get a device id from the server
        DEVICE_JSON=$(curl -X  POST $SITE \
            -d '{"py": {"lat":"", "identifier":"'$MAC'", "devicetime":"'$NOW'", "notes":"Hello from Pi"}}' \
            -H "Accept: application/json" -H "Content-Type: application/json" )
        echo $DEVICE_JSON
        ID=$(echo $DEVICE_JSON | jq '.id')
    fi


    # upload readings
    for j in `seq 1 10` ; do
    
        READING_JSON=$(curl -X  POST $SITE/$ID/readings \
            -d '{"reading": {"lat":"'$LAT'", "identifier":"'$MAC'", "lon":"'$LON'", "dblvl":"'$DBLVL'", "devicetime":"'$NOW'" }}' \
            -H "Accept: application/json" -H "Content-Type: application/json")

        echo $READING_JSON
    done
done
