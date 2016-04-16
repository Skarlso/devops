#!/bin/bash

state=$(docker stop mc_server)
if [[ $state =~ "No such container" ]]; then
    echo "Failed to stop container!"
    exit 1
fi

docker-machine stop
