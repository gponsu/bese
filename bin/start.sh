#!/bin/bash

docker run -it \
  --publish 8080:4567 \
  --mount source=bese_database,target=/usr/local/databases \
  --env-file ./app/.env \
  bese:2.0.0
