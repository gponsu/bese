#!/bin/bash

docker run -it \
  --publish 8080:4567 \
  --mount source=bese_database,target=/usr/local/databases \
  bese:1.0.0