# Welcome to your Docker development environment.

## Pre-requisites:

* Docker
* Docker Compose
* Internet connection (used to download docker images - the first time)
* The helper script is designed to run on a unix based system.

## Setup:

Your app will go in the directory src

### PHP 8 and Apache in app container 

* Apache default config file in docker/app/apache/000-default.conf
* PHP config file to overwrite php.ini docker/app/php/Z-custom.ini
* the web port on your host = 8080 (access at http://localhost:8080)
* PHP pdo mysql and mysqli are enabled
* PHP redis is enabled
* example php db connect: mysqli_connect("db", "test", "p1ssw0rd");
* To access this container from one of the other containers use "app" as the ip address

### Redis in cache container

* Redis config in docker/cache/config/redis.conf
* Redis persistent storage docker/cache/data
* redis password = p1ssw0rd
* redis port = 6379
* To access this container from one of the other containers use "cache" as the ip address

### MariaDB in db container

* MariaDB persistent data docker/db/data
* MariaDB connection credentials: root user password = p1ssw0rd
* MariaDB port = 3306
* test database = test
* test user = test
* test user password = p1ssw0rd
* To access this container from one of the other containers use "db" as the ip address
* by default test database is empty - to populate it with a test table run: server.sh -r

## Helper script:

A helper script has been supplied it has the following features

* bring up the containers: server.sh -u
* bring down the containers: server -d
* reset the db with test table: server -r

it is recommended if you change config files to down then up the containers.

## some usefull docker commands:

* list running docker containers: docker ps
* enter running container with shell: docker exec -it <container name> bash
* if you need to follow a containers logs: docker logs -f <container name>
---
# Question1 and Question2
Open the index.html file with a browser from the directory Question1 / Question2

* [Question 1](Question1/index.html)
* [Question 2](Question2/index.html)
