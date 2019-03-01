#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "$0: usage: create-docker.sh container_name"
    echo "$0: usage e.g.: create-docker.sh camunda"
    exit 1
fi

CONTAINER_NAME=$1

docker rm -f ${CONTAINER_NAME}

# prepare container's logging properties:
cat conf/logback/logback.xml | sed "s/{docker_container_name}/${CONTAINER_NAME}/g"> conf/logback/logback-container.xml

docker build -t sl/camunda-bpm-platform:0.1.0 .

# remove tmp logging properties file
rm conf/logback/logback-container.xml

docker run -d --name="${CONTAINER_NAME}" -p "8080:8080" sl/camunda-bpm-platform:0.1.0