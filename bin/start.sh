#!/bin/bash

docker run -itd --rm \
  --name storage \
  --network skynet \
  --mount source=bese_database,target=/usr/local/databases \
  storage:1.0.0

docker run -it --rm \
  --network skynet \
  --publish 8080:4567 \
  --env-file ./app/.env \
  bese:2.0.0
