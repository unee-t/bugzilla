Requires [docker](https://www.docker.com/) &
[docker-compose](https://docs.docker.com/compose/). Linux is definitely a plus!

# Run

	make up
	make down

You might need to do a `make ${up,down,up}` to make it all work due to the
setup phases of {bugzilla,db}

# Login info

If you are using the default primed sql/demo state username;password are:

	administrator@example.com;administrator
	anabelle@example.com;anabelle
	celeste@example.com;celeste
	jocelyn@example.com;jocelyn
	lawrence@example.com;lawrence
	leonel@example.com;leonel
	marina@example.com;marina
	marley@example.com;marley
	marvin@example.com;marvin
	michael@example.com;michael
	regina@example.com;regina
	sabrina@example.com;sabrina

Else if not sql/demo see [bugzilla_admin](bugzilla_admin)

# Debug

	docker exec -it docker_bugzilla_1 /bin/bash

The prefix `docker_` might be different on your system.

# Database explorer

http://localhost:8082/ see [environment](.env) for credentials

# JSON API

<http://bugzilla.readthedocs.io/en/latest/api/>

After creating a bug:

	curl http://localhost:8081/rest/bug/1 | jq

# Build

You shouldn't need to do this since normally we should use out gitlab hosted Bugzilla image.

	make build

# Environment

Some values defined in [the environment file](.env)  need to be managed by
yourself as we can't have them in a public repo!

* SES_SMTP_USERNAME
* SES_SMTP_PASSWORD
* SES_VERIFIED_SENDER

`SES*` is required for email notifications.

# State snapshots

Save:

	mysqldump -h 127.0.0.1 -P 3306 -u root --password=uniti bugzilla > demo.sql

Restore:

	mysql -h 127.0.0.1 -P 3306 -u root --password=uniti bugzilla < fresh.sql

# How to check for mail when in test mode

	docker exec -it bugzilla_bugzilla_1 /bin/bash
	cat data/mailer.testfile

# Setting up AWS ECS

Cluster name is named after branch name.

	ecs-cli configure -c $BRANCH -r ap-southeast-1 -p $PROFILE
	ecs-cli up --keypair $KEYPAIR --capability-iam
