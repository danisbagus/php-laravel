PHP LARAVEL APPLICATION

Application run using docker tool

Make databases container
docker run --network=laravel -e MYSQL_ROOT_PASSWORD=1234  --name db-laravel mysql:5.6

Inspect Laravel docker network
docker network inspect laravel 

Make phpmyadmin container
docker run --network=laravel --name laravel-admin -d --link db-laravel:db -p 7001:80 phpmyadmin/phpmyadmin

Make base image
docker build --tag danisbagus/base-php7:latest

Make app image
docker build --tag danisbagus/laravel:latest

Run Laravel app container
docker run --network=laravel -p 7002:80 -v $(pwd)/app:/app --name app-laravel danisbagus/laravel

Container port:
laravel-admin:7001
app-laravel:7002

Docker network:
db-laravel:172.19.0.2
laravel-admin:172.19.0.3
app-laravel:172.19.0.4

Start:
./run.sh

Stop
./stop.sh