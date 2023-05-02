#! /bin/bash

JMETER_VERSION="5.5"
JMETER_HOME="server"
JMETER_TGZ_PATH="jmeter.tgz"

DSERVER_RMI_LOCALPORT="2020"
DSERVER_RMI_SSL_DISABLE="true"
DSERVER_RMI_PORT="1099"

if [ ! -z "$1" ]
then
    echo "Changing server.rmi.port from ${DSERVER_RMI_PORT} to $1"
    DSERVER_RMI_PORT=$1
fi

echo "Downloading Jmeter..."
curl -L -s -o ${JMETER_TGZ_PATH} https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz \
    && tar -xzf ${JMETER_TGZ_PATH} \
    && mkdir ${JMETER_HOME} \
    && mv apache-jmeter-${JMETER_VERSION}/* ${JMETER_HOME} \
    && rm -r apache-jmeter-${JMETER_VERSION} \
    && rm ${JMETER_TGZ_PATH}
echo "Download complete."

echo "Moving to /server/bin"
cd server/bin

echo "starting server"
./jmeter-server \
    -Dserver.rmi.localport=${DSERVER_RMI_LOCALPORT} \
    -Dserver.rmi.ssl.disable=${DSERVER_RMI_SSL_DISABLE} \
    -Dserver.rmi.port=${DSERVER_RMI_PORT}

exit 0