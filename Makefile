-include .env
.SILENT:

build:
	docker-compose build

init: migrate restart

logs:
	docker-compose logs --follow

migrate:
	docker-compose exec fittrackee scripts/migrate.sh

rebuild:
	docker-compose build --no-cache

redis:
	docker-compose up -d redis

restart:
	docker-compose restart fittrackee

run-all: redis run run-workers

run:
	docker-compose up -d fittrackee

run-workers:
	docker-compose exec -d fittrackee scripts/run-workers.sh

shell:
	docker-compose exec fittrackee scripts/shell.sh

set-admin:
	docker-compose exec fittrackee scripts/set-admin.sh $(USERNAME)

stop:
	docker-compose stop fittrackee fittrackee-db
	docker-compose stop redis

up:
	docker-compose up

update:
	docker-compose exec fittrackee scripts/update-fittrackee.sh
