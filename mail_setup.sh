#!/bin/bash

echo "Enter sender mail"
read SENDER
echo "Enter sender mail password"
read PASS
echo "Enter Reciver mail"
read RECIVER
HOST=$(hostname)

sudo yum install postfix -y
sudo yum install mailx -y
cd /etc/postfix
cp main.cf main.cf_backup

echo "relayhost = [smtp.gmail.com]:587" >> main.cf
echo "myhostname = $HOST" >> main.cf
echo "smtp_sasl_password_maps = hash:/etc/postfix/sasl/sasl_passwd" >> main.cf
echo "smtp_sasl_auth_enable = yes" >> main.cf
echo "smtp_tls_security_level = encrypt" >> main.cf
echo "smtp_sasl_security_options = noanonymous" >> main.cf

cd /etc/postfix
mkdir sasl
cd sasl
touch sasl_passwd
echo "[smtp.gmail.com]:587 $SENDER:$PASS" >> sasl_passwd
postmap /etc/postfix/sasl/sasl_passwd
chmod 600 *
systemctl start postfix.service
#systemctl status postfix.service
echo "Mailing setup on machine is complete" | mail -s "Test Mail" $RECIVER
