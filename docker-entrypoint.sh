#!/bin/bash
set -e
cd /usr/src/app

source .env

supervisord -n
