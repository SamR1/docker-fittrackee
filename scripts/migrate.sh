#!/bin/bash
set -e
cd /usr/src/app

source .env

.venv/bin/ftcli db upgrade