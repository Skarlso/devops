#!/bin/bash
eval "$(docker-machine env)"
state=$(docker stop mc_server)
if [[ $state =~ "No such container" ]]; then
    echo "Failed to stop container!"
    exit 1
else
    printf "%s\n" "Docker container stopped."
fi

docker-machine stop
