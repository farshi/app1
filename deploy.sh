#!/bin/bash
1
if [ -z "${1}" ]; then
   version="latest"
   marathon="localhost"
else
   version="${1}"
   marathon=${MARATHON_PORT_8080_TCP_ADDR}
fi

# destroy old application
curl -X DELETE -H "Content-Type: application/json" http://${marathon}:8080/v2/apps/app1 

# I know this one is ugly. But it works for now.
sleep 1

# these lines will create a copy of app_marathon.json and update the image version
cp -f app_marathon.json app_marathon.json.tmp
sed -i "s/latest/${version}/g" app_marathon.json.tmp

printf -v no_proxy '%s,' 172.17.0.{1..255};
export no_proxy_list="${no_proxy%,}";

# post the application to Marathon
curl --noproxy $no_proxy_list -X POST -H "Content-Type: application/json" http://${marathon}:8080/v2/apps -d@app_marathon.json.tmp
