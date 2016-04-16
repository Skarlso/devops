#!/bin/bash

machine_state=$(docker-machine status)
if [[ $machine_state != "Running" ]]; then
    docker-machine start
else
    echo "Machine is already running."
fi

eval $(docker-machine env)
container_status=$(docker ps -a --filter name=mc_server)
if [[ -n $container_status ]]; then
    echo "Server already running. Nothing to do here."
    exit 0
fi

docker start mc_server
state=$(docker ps -q --filter name=mc_server)
if [[ -n "$state" ]]; then
    docker exec -it mc_server bash
else
    echo "Container did not start!"
    exit 1
fi
