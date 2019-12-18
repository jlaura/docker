#!/bin/bash

# Run the entrypoint scripts
for file in $(ls /docker-entrypoint.d); do
    file="/docker-entrypoint.d/$file"
    printf "Running %s..." $file
    bash $file
    printf "\n"
done

# Run the docker CMD
exec "$@"
