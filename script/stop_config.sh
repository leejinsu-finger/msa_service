#!/usr/bin/env bash
$PROJECT_HOME/script/stop.sh config
sudo docker-compose -f $PROJECT_HOME/docker-compose.yml stop rabbitmq
