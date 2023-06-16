#!/bin/bash

cd /opt/
# Variables
INSTALL_DIR="/opt/splunkforwarder"
ADMIN_USERNAME="admin"
ADMIN_PASSWORD="Wati@1234"


DOWNLOAD_URL="https://download.splunk.com/products/universalforwarder/releases/9.0.5/linux/splunkforwarder-9.0.5-e9494146ae5c-Linux-x86_64.tgz"


echo "Downloading Splunk Universal Forwarder..."
wget -O splunkforwarder-9.0.5-e9494146ae5c-Linux-x86_64.tgz "${DOWNLOAD_URL}"

sleep 90
tar zvxf splunkforwarder-9.0.5-e9494146ae5c-Linux-x86_64.tgz
sleep 60
# Install Splunk Universal Forwarder
echo "Installing Splunk Universal Forwarder..."
"${INSTALL_DIR}"/bin/splunk start --accept-license --answer-yes --seed-passwd "${ADMIN_PASSWORD}" --seed-username "${ADMIN_USERNAME}" --gen-and-print-passwd

# Start Splunk Universal Forwarder
echo "Starting Splunk Universal Forwarder..."

"${INSTALL_DIR}"/bin/splunk add forward-server 10.83.0.226:7779 -auth  "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
echo "Starting Splunk Universal Forwarder Done..."
sleep 15
echo "Starting deploy poll"
"${INSTALL_DIR}"/bin/splunk set deploy-poll 10.83.0.228:8089 -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
echo "deploy poll done"

sleep 30

"${INSTALL_DIR}"/bin/splunk add monitor /var/log -index linux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
sleep 4

"${INSTALL_DIR}"/bin/splunk restart

echo "Splunk Universal Forwarder installation completed."

