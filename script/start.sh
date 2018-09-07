#!/usr/bin/env bash

# environment values 
export LOG_PATH=$PROJECT_HOME/logs
export SERVICE_NAME=$1
export SERVICE_URL=$2
export SERVICE_PID_FILE=$PROJECT_HOME/$SERVICE_NAME.pid
export SERVICE_LOG_FILE=$LOG_PATH/$SERVICE_NAME.log
export SERVICE_HEALTH_CHECK_URL=$SERVICE_URL/actuator/health

# checking parameters
if [ -z $SERVICE_NAME ] || [ -z $SERVICE_URL ]; then
   echo 'Usage : run.sh service_name service_url' 
   exit 1
fi

# log path create
if [ ! -d $LOG_PATH ]; then
   mkdir $LOG_PATH;
fi

# checking service
if [ -f $SERVICE_PID_FILE ]; then
   echo $SERVICE_NAME 'server already started...' 
   exit 1	
fi
   	
# start server
nohup mvn -f $PROJECT_HOME/pom.xml -pl $SERVICE_NAME -am spring-boot:run >> $SERVICE_LOG_FILE &
echo $! > $SERVICE_PID_FILE

while [ -z ${SERVER_READY} ]; do
  echo "Waiting for" $SERVICE_NANE "server."
  if [ "$(curl --silent $SERVICE_HEALTH_CHECK_URL 2>&1 | grep -q '\"status\":\"UP\"'; echo $?)" = 0 ]; then
      SERVER_READY=true;
  fi
  sleep 2
done

echo -e $SERVICE_NAME "server started..."

exit 0
