#!/bin/bash
cd /opt/
INSTALL_DIR="/opt/splunkforwarder"
ADMIN_USERNAME="admin"
ADMIN_PASSWORD="Wati@1234"

echo "Starting"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo wget -q -O /etc/yum.repos.d/microsoft-prod.repo https://packages.microsoft.com/config/rhel/9.0/prod.repo

sleep 5

sudo dnf install sysmonforlinux -y

echo "Sysmon installed"

wget -O config.xml https://raw.githubusercontent.com/Wati-R/SplunkUF/main/config.xml

sysmon -accepteula -i /opt/config.xml

echo "sysmon Downloaded"

echo '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
echo 'Started log Forwarded'
echo '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'



#myArray=("ait" "gg-celeste" "webGOMS" "webapp01" "GGCT" "ggehs" "GG-GQAP" "ggmis" "gg-hisqlbl" "ggetdprod" "ggdev02" "ggdev01")

var=$(hostname)
if [ $var == 'ait' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /home/webadmin/apache-tomcat-8.0.36/bin/logs/geps-prod.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart
elif [ $var == 'gg-celeste' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/gamv.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart
elif [ $var == 'webGOMS' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /root/tomcat/latest/bin/logs/goms-prod.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart
elif [ $var == 'webapp01' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/gcart-prod.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart
elif [ $var == 'webapp01' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/gcart-prod.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart
elif [ $var == 'GGCT' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/courier-prod.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart

elif [ $var == 'ggehs' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/ehs-prod.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart

elif [ $var == 'GG-GQAP' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/gqap-prod.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart
elif [ $var == 'ggmis' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/dwbi-dgr-prod.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart
elif [ $var == 'gg-hisqlbl' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/goep-prod.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart
elif [ $var == 'ggetdprod' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/etd-prod.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart
elif [ $var == 'ggdev02' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/appname.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}"
  "${INSTALL_DIR}"/bin/splunk restart
elif [ $var == 'ggdev01' ]
then
  echo "Identifing Server"
  echo "Host Name detected"$str
  "${INSTALL_DIR}"/bin/splunk add monitor /logs/appname.log -index greenkolinux -auth "${ADMIN_USERNAME}":"${ADMIN_PASSWORD}" 
  "${INSTALL_DIR}"/bin/splunk restart
else
echo "Unable to Find The Host"
fi



















