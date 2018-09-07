#!/usr/bin/env bash

# environment values
export SERVICE_NAME=$1
export SERVICE_PID_FILE=$PROJECT_HOME/$SERVICE_NAME.pid

# checking parameters
if [ -z $SERVICE_NAME ]; then
   echo 'Usage : stop.sh service_name'
   exit 1
fi

# checking pid file
if [ ! -f $SERVICE_PID_FILE ]; then
   echo '.pid file not found...'
   exit 1
fi

# kill service
kill -9 `cat $SERVICE_PID_FILE`
rm $SERVICE_PID_FILE

echo $SERVICE_NAME 'server stoped...'

exit 0
