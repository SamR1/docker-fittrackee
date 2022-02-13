#!/bin/bash
set -e
cd /usr/src/app

source .env

.venv/bin/fittrackee_set_admin $1
