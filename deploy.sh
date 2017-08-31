#!/bin/bash
sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
sudo chmod +x /usr/local/bin/ecs-cli
/usr/local/bin/ecs-cli configure -c $TRAVIS_BRANCH
envsubst < docker-compose.yml.template > docker-compose.yml
cat docker-compose.yml
/usr/local/bin/ecs-cli compose -p $TRAVIS_BRANCH service up
