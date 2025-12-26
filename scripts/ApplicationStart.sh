#!/bin/bash
docker run -p 80:5000 --name flask-devops -d 706004250357.dkr.ecr.ap-northeast-1.amazonaws.com/cjc102-15-ecr-repo:latest

sleep 20s