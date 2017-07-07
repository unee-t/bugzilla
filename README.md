Requires docker & docker-compose. Linux is definitely a plus!

# Run

	make up

	make down

You might need to do a `make ${up,down,up}` to make it all work due to the
setup phases of {bugzilla,db}

Login info, see [bugzilla_admin](bugzilla_admin)

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
