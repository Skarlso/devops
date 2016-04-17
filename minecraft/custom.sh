#!/bin/bash

function upload {
    echo "uploading"
    local result=0
    return $result
}

function delete {
    echo "deleting $1"
    local result=0
    return $result
}

function list {
    local arr=("file1" "file2" "file3")
    echo "${arr[@]}"
}
