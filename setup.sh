#!/bin/bash

DOCKER_NAME=pregel-using-mariadb
DB_PASS=my-secret-pw

cd docker
docker build -t "$DOCKER_NAME" .
docker run --network host --name mariadb-server -e MYSQL_ROOT_PASSWORD="$DB_PASS" -d pregel-using-mariadb
echo "Populating DB"
cat setup_db.sql | docker run --network host -i -a stdin -a stdout pregel-using-mariadb mariadb -v -uroot -h127.0.0.1 -Dmysql --password=my-secret-pw
