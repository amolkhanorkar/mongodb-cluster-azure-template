#!/bin/bash

sudo mkdir -p /data/db

nohup /usr/bin/mongod  --configsvr --replSet rsconfig1 --dbpath /data/db --bind_ip 0.0.0.0 >> /var/log/mongodb/mongod.log &