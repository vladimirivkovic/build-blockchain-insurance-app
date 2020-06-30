#!/bin/bash
docker exec -it shop-peer bash -c 'mkdir /home/blocks' 
N=20

for i in $(seq 0 $N)
do
    docker exec -it shop-peer bash -c \
        "peer channel fetch -c default $i /home/blocks/$i.blk"
done

docker cp shop-peer:/home/blocks .

for i in $(seq 0 $N)
do
    ../configtxlator proto_decode --type=common.Block --input=blocks/$i.blk --output=blocks/$i.json
done