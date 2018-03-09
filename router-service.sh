#!/bin/bash

sudo mkdir -p /data/db

nohup /usr/bin/mongos --configdb rsconfig1/10.0.0.9:27019,10.0.0.8:27019 --bind_ip 0.0.0.0  >> /var/log/mongodb/mongod.log &