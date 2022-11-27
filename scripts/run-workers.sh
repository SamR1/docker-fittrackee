#!/bin/bash
set -e
cd /usr/src/app

source .env

.venv/bin/flask worker --processes $WORKERS_PROCESSES
