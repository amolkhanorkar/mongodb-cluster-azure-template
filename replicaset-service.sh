#!/bin/bash

sudo mkdir -p /data/db

nohup /usr/bin/mongod --shardsvr --replSet shard1rs1 --dbpath /data/db --bind_ip 0.0.0.0  >> /var/log/mongodb/mongod.log &