#!/usr/bin/env bash

# RabbitMQ start
sudo docker-compose -f $PROJECT_HOME/docker-compose.yml up -d rabbitmq

# config server start
$PROJECT_HOME/script/start.sh config http://localhost:8888
