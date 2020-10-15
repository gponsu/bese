#!/bin/bash

docker network create --driver bridge skynet
docker volume create bese_database

docker build -t bese:2.0.0 ./app
docker build -t storage:1.0.0 ./storage
