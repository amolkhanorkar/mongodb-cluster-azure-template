#!/bin/bash

# Configure mongodb.list file with the correct location
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list

# Disable THP
sudo echo never > /sys/kernel/mm/transparent_hugepage/enabled
sudo echo never > /sys/kernel/mm/transparent_hugepage/defrag
sudo grep -q -F 'transparent_hugepage=never' /etc/default/grub || echo 'transparent_hugepage=never' >> /etc/default/grub

# Install updates
sudo apt-get -y update

# Modified tcp keepalive according to https://docs.mongodb.org/ecosystem/platforms/windows-azure/
sudo bash -c "sudo echo net.ipv4.tcp_keepalive_time = 120 >> /etc/sysctl.conf"

#Install Mongo DB
sudo apt-get install -y mongodb-org

# Uncomment this to bind to all ip addresses
# sudo sed -i -e 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g' /etc/mongod.conf
sudo service mongod restart

sudo mkdir -p /data/db

nohup /usr/bin/mongod  --configsvr --replSet rsconfig1 --dbpath /data/db --journal --bind_ip 0.0.0.0 >> /var/log/mongodb/mongod.log &

#cfg="{
#    _id: 'rsconfig1',
#    configsvr: true,
#    members: [
#        {_id: 0, host: '10.0.0.9:27019'},
#        {_id: 1, host: '10.0.0.8:27019'}
#    ]
#}"

#/usr/bin/mongo 10.0.0.8:27019 --eval "JSON.stringify(db.adminCommand({'replSetInitiate' : $cfg}))"

#/usr/bin/mongo 10.0.0.8:27019 << !
#rs.initiate({_id: "rs0", configsvr: true, members: [{_id: 0, host: "10.0.0.9:27019"}, {_id: 1, host: "10.0.0.8:27019"}]});

#//rs.initiate({_id: "rs0", members: [{_id: 0, host: "${local_ip}:27020"}, {_id: 1, host: "${local_ip}:27021"}]});
#!
