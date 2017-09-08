#!/bin/bash
curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
chmod +x /usr/local/bin/ecs-cli
/usr/local/bin/ecs-cli configure -c master -p lmb
test -f aws-env && source aws-env
aws --profile lmb ecr describe-images --repository-name bugzilla
envsubst < docker-compose.yml.AWS-ECS > docker-compose.yml
cat docker-compose.yml
/usr/local/bin/ecs-cli compose -p master service up
