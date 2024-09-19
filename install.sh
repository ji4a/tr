
sudo timedatectl set-timezone Europe/Amsterdam
timedatectl





apt update && apt -y install unzip mysql-server -y

mysql -u root --execute="ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'; GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION; FLUSH PRIVILEGES; CREATE DATABASE traccar;"

wget https://www.traccar.org/download/traccar-linux-64-latest.zip

unzip traccar-linux-*.zip && ./traccar.run

cat > /opt/traccar/conf/traccar.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE properties SYSTEM 'http://java.sun.com/dtd/properties.dtd'>

<properties>
	
    <entry key='database.driver'>com.mysql.cj.jdbc.Driver</entry>
    <entry key='database.url'>jdbc:mysql://localhost/traccar?zeroDateTimeBehavior=round&amp;serverTimezone=UTC&amp;allowPublicKeyRetrieval=true&amp;useSSL=false&amp;allowMultiQueries=true&amp;autoReconnect=true&amp;useUnicode=yes&amp;characterEncoding=UTF-8&amp;sessionVariables=sql_mode=''</entry>
    <entry key='database.user'>root</entry>
    <entry key='database.password'>root</entry>

</properties>
EOF

service traccar start


sudo ufw allow 8082/tcp
sudo ufw status verbose


--
AT+EGMR=1,7,"111000000004477"
AT+CGSN
--
