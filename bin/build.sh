#!/bin/bash

docker volume create bese_database
docker build -t bese:1.0.0 .