# camunda-graylog-logging
GrayLog logging for Camunda BPM in Docker container.

## Usage
1. Change settings of GrayLog appender in `conf/logback/logback.xml` according your needs.
Look at place holder `{docker_container_name}` in `conf/logback/logback.xml` - it will be replaced with 
the docker container's name in next step.
1. Run `create-docker.sh` which will remove-build-create new docker container with Camunda BPM 
and GrayLog logging enabled.


Originally forked from [camunda-json-logging](https://github.com/DigitalState/camunda-json-logging).