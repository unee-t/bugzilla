Requires docker & docker-compose

# Build

	make build

# Run

	make run

Login info, see [bugzilla_admin](bugzilla_admin)

# Debug

	docker exec -it docker_bugzilla_1 /bin/bash

The prefix `docker_` might be different on your system.

# Database explorer

http://localhost:8080/ see [environment](.env) for credentials

# Local store of database

	docker volume inspect docker_mysql

Of try `docker volume ls | grep mysql`

# JSON API

<http://bugzilla.readthedocs.io/en/latest/api/>

After creating a bug:

	curl http://localhost:8081/rest/bug/1 | jq
