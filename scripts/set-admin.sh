#!/bin/bash
set -e
cd /usr/src/app

source .env

.venv/bin/ftcli users update $1 --set-admin true
