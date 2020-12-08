#!/bin/bash

FILENAME=$(basename "$1")

docker run --rm --network host -v $PWD/src/:/script/src/ -a stdout -a stderr pregel-using-mariadb stdbuf -oL python3.8 /script/src/$FILENAME
