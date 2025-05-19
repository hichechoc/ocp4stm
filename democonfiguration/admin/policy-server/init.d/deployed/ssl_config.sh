#!/bin/bash
echo "[POLICY_SERVER_CONTAINER] SSL Configuration Information"
sslentryfile=/opt/CA/siteminder/ssl_info.ini
cat $sslentryfile
echo "[POLICY_SERVER_CONTAINER] Native Driver- MySQL Datbase inforamtion"
cat /opt/CA/siteminder/native/odbc/etc/system_odbc.ini
sed -i "/OPTION=2/r $sslentryfile" /opt/CA/siteminder/native/odbc/etc/system_odbc.ini
echo "[POLICY_SERVER_CONTAINER] Native Driver- MySQL Datbase inforamtion with SSL enabled"
echo "**********"
cat /opt/CA/siteminder/native/odbc/etc/system_odbc.ini
echo "***********"
echo "[POLICY_SERVER_CONTAINER] SSL is enabled  successfully for MySQL Datase"
