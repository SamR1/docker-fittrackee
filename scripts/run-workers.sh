#!/bin/bash
set -e
cd /usr/src/app

source .env

fittrackee_worker --processes $WORKERS_PROCESSES
