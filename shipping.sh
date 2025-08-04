compont_name =shipping
source common.sh
java
systemd_setup
dnf install mysql -y
mysql -h mysql-dev.rdevopsb84.online -uroot -pRoboShop@1 < /app/db/schema.sql
mysql -h mysql-dev.rdevopsb84.online -uroot -pRoboShop@1 < /app/db/app-user.sql
mysql -h mysql-dev.rdevopsb84.online -uroot -pRoboShop@1 < /app/db/master-data.sql
systemctl restart shipping