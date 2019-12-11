#!/bin/bash
#

docker start db-laravel laravel-admin app-laravel

sensible-browser http://localhost:7001
sensible-browser http://localhost:7002


# Run CMD from docker
exec "$@"
