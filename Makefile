validate:
	docker-compose -f docker-compose.yml config

build:
	docker-compose build

run:
	docker-compose up
