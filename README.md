# Prequisites
- Go to manage Google account
- Search for Apps
- Generate a password
- This password will be provided to the mail setup script


# Procedure
- Run mail Setup script on your machine (test mail will be sent to reciver mail via sender mail id)
- Edit "Calculate_size_and_mail_script.sh" and enter the file location of log files and recipent mail id
- Setup montghly cron to run the above script
- Note the above script will only notify and send the details of log files that are older than 30 days it will NOT delete the log files
- To delete the log files use the logs_deletion_script.sh, use cron to run the script monthly.
