#!/bin/bash
set -e
cd /usr/src/app

source .env

.venv/bin/fittrackee_worker --processes $WORKERS_PROCESSES
