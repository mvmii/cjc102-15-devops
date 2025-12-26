#!/bin/bash

aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 706004250357.dkr.ecr.ap-northeast-1.amazonaws.com

if [ `docker images | grep 706004250357.dkr.ecr.ap-northeast-1.amazonaws.com/cjc102-15-ecr-repo | wc -l`  = 1 ]
then
        docker rmi 706004250357.dkr.ecr.ap-northeast-1.amazonaws.com/cjc102-15-ecr-repo
        docker pull 706004250357.dkr.ecr.ap-northeast-1.amazonaws.com/cjc102-15-ecr-repo:latest
else
        docker pull 706004250357.dkr.ecr.ap-northeast-1.amazonaws.com/cjc102-15-ecr-repo:latest
fi
