#!/bin/bash
DIRECTORY="/var/log/httpd"
RECEPENT_MAIL="rayanahmed4334@gmail.com"
DIRECTORY_STORAGE=$(du -s $DIRECTORY | awk '{print $1 / (1024 * 1024), "GB"}')
LOGS_STORAGE=$(find $DIRECTORY -maxdepth 1 -type f -mtime +30 -exec stat --format='%s %n' {} + | awk 'BEGIN {printf "%-50s %-15s\n", "File Name", "File Size (GB)"; print "------------------------------------------------------------"} {total += $1; size_gb = $1 / 1024 / 1024 / 1024; printf "%-50s %-15.2f\n", $2, size_gb} END {print "------------------------------------------------------------"; printf "Total Size (GB): %.2f\n", total / 1024 / 1024 / 1024}'
)

echo "Target Directory - $DIRECTORY: $DIRECTORY_STORAGE

Log files older than 30 days and their storage consumption

$LOGS_STORAGE

NOTE - The above file(s) will be deleted by the monthly cron tomorrow
" | mail -s "Log files Deletion | Monthly Cron" $RECEPENT_MAIL
