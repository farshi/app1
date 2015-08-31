#!/bin/bash

if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi

sudo docker push localhost:5000/reza/nodejs_app:"${version}"
