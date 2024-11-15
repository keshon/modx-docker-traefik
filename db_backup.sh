#!/bin/bash

# Load environment variables from .env file
if [[ -f .env ]]; then
  export $(cat .env | grep -v '^#' | xargs)
fi

docker exec ${ALIAS}-db /db_dump.sh