#!/bin/bash

cfg="{
    _id: 'set',
    members: [
        {_id: 0, host: '10.0.0.9:27019'},
        {_id: 1, host: '10.0.0.8:27019'}
    ]
}"
/usr/bin/mongo 10.0.0.8:27019 --eval "JSON.stringify(db.adminCommand({'replSetInitiate' : $cfg}))"