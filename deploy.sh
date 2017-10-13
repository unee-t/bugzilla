#!/bin/bash
#curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && chmod +x /usr/local/bin/ecs-cli
/usr/local/bin/ecs-cli configure -c master -p lmb-dev
test -f aws-env && source aws-env

#ecs-cli compose -p meteoroar service create --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-1:812644853088:targetgroup/blah/1762cfc21222b179 --container-name meteor --container-port 80 --role ecsServiceRole

envsubst < AWS-docker-compose.yml > docker-compose-bugzilla.yml
envsubst < AWS-docker-compose-meteor.yml > docker-compose-meteor.yml

/usr/local/bin/ecs-cli compose -p bugzilla -f docker-compose-bugzilla.yml service up
/usr/local/bin/ecs-cli compose -p meteor -f docker-compose-meteor.yml service up
