-include .env
.SILENT:

build:
	docker-compose build

init: migrate init-db restart run-workers

init-db:
	docker-compose exec fittrackee scripts/init-database.sh

logs:
	docker-compose logs --follow

migrate:
	docker-compose exec fittrackee scripts/migrate.sh

rebuild:
	docker-compose build --no-cache

restart:
	# Restart fittrackee
	docker-compose restart fittrackee

run-all: run run-workers

run:
	docker-compose up -d

run-workers:
	docker-compose exec -d fittrackee scripts/run-workers.sh

shell:
	docker-compose exec fittrackee scripts/shell.sh

stop:
	docker-compose stop

up:
	docker-compose up

update:
	docker-compose exec fittrackee scripts/update-fittrackee.sh
