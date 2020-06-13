#!/bin/bash
cp ./binary_win/* .
export FABRIC_CFG_PATH=$PWD
sh ./generate-certs.sh
sh ./docker-images.sh
docker-compose up -d
