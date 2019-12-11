#!/bin/bash
#

docker stop app-laravel laravel-admin db-laravel

# Run CMD from docker
exec "$@"
