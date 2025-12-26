#!/bin/bash
if [ `docker ps | grep boring_shockley | wc -l`  = 1 ]
then
        docker stop flask-web
        docker rm  flask-web
fi
