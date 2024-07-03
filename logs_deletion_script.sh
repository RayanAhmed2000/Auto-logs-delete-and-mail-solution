#Use cron to run this script monthly

find /var/log/httpd -type f -mtime +30 -exec rm {} \;
