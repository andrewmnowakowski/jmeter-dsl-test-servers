#!/bin/bash

DSERVER_RMI_LOCALPORT="2020"
DSERVER_RMI_SSL_DISABLE="false"
DSERVER_RMI_PORT="1099"

echo "Starting server..."

if [ ! -z "$1" ] && [ ! -z "$2" ]
then
    echo "Changing server.rmi.port and server_port from ${DSERVER_RMI_PORT} to $1..."
    echo "Changing server.rmi.localport from ${DSERVER_RMI_LOCALPORT} to $2..."
    DSERVER_RMI_PORT=$1
    DSERVER_RMI_LOCALPORT=$2
fi

./server/bin/jmeter-server \
    -Dserver.rmi.localport=${DSERVER_RMI_LOCALPORT} \
    -Dserver.rmi.ssl.disable=${DSERVER_RMI_SSL_DISABLE} \
    -Dserver.rmi.port=${DSERVER_RMI_PORT} \
    -Dserver_port=${DSERVER_RMI_PORT}

exit 0