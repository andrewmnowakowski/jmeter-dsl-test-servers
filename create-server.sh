#!/bin/bash

JMETER_VERSION="5.5"
JMETER_HOME="server"
JMETER_TGZ_PATH="jmeter.tgz"





echo "Creating server..."

echo "Downloading Jmeter..."
curl -L -s -o ${JMETER_TGZ_PATH} https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz \
    && tar -xzf ${JMETER_TGZ_PATH} \
    && mkdir ${JMETER_HOME} \
    && mv apache-jmeter-${JMETER_VERSION}/* ${JMETER_HOME} \
    && rm -r apache-jmeter-${JMETER_VERSION} \
    && rm ${JMETER_TGZ_PATH}
echo "Download complete."

if [ -f "rmi_keystore.jks" ]
then
    cp "./rmi_keystore.jks" "./server/bin"
fi

echo "Server Created."

exit 0
