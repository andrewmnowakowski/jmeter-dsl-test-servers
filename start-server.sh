#!/bin/bash

DSERVER_RMI_LOCALPORT="2020"
DSERVER_RMI_SSL_DISABLE="true"
DSERVER_RMI_PORT="1099"

echo "Starting server..."

if [ ! -z "$1" ]
then
    echo "Changing server.rmi.port from ${DSERVER_RMI_PORT} to $1"
    DSERVER_RMI_PORT=$1
fi

./server/bin/jmeter-server \
    -Dserver.rmi.localport=${DSERVER_RMI_LOCALPORT} \
    -Dserver.rmi.ssl.disable=${DSERVER_RMI_SSL_DISABLE} \
    -Dserver.rmi.port=${DSERVER_RMI_PORT}

exit 0