-include .env
.SILENT:

build:
	docker-compose build

init: up migrate run

logs:
	docker-compose logs --follow

migrate:
	docker-compose exec fittrackee scripts/migrate.sh

rebuild:
	docker-compose build --no-cache

redis:
	docker-compose up -d redis

restart:
	docker-compose exec fittrackee supervisorctl restart fittrackee

run-all:
	# start fittrackee web application and fittrackee workers
	docker-compose exec fittrackee supervisorctl start all

run: up
	# start fittrackee web application
	docker-compose exec fittrackee supervisorctl start fittrackee

run-workers: up redis
	# start fittrackee workers
	docker-compose exec fittrackee supervisorctl start fittrackee-workers

shell:
	docker-compose exec fittrackee scripts/shell.sh

set-admin:
	docker-compose exec fittrackee scripts/set-admin.sh $(USERNAME)

stop:
	docker-compose stop fittrackee fittrackee-db
	docker-compose stop redis

stop-all:
	docker-compose exec fittrackee supervisorctl stop all

up:
	docker-compose up -d

update:
	docker-compose exec fittrackee scripts/update-fittrackee.sh
