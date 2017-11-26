#!/bin/bash

docker volume create bese_database
docker build -t bese:2.0.0 ./app