#!/bin/bash
cd /opt

echo "Starting"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo wget -q -O /etc/yum.repos.d/microsoft-prod.repo https://packages.microsoft.com/config/rhel/9.0/prod.repo

sleep 5

sudo dnf install sysmonforlinux -y

echo "Sysmon installed"

wget -O config.xml https://raw.githubusercontent.com/Wati-R/SplunkUF/main/config.xml

sysmon -accepteula -i /opt/config.xml

echo "sysmon Downloaded"
