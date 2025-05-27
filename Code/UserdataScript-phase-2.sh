#!/bin/bash -xe

# Update and install packages
apt update -y
apt install nodejs unzip wget npm mysql-server -y

# Download and extract code
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-200-ACCAP1-1-91571/1-lab-capstone-project-1/code.zip -P /home/ubuntu
cd /home/ubuntu
unzip code.zip -x "resources/codebase_partner/node_modules/*"
cd resources/codebase_partner
npm install aws aws-sdk

# Configure MySQL
mysql -u root -e "CREATE USER 'nodeapp' IDENTIFIED WITH mysql_native_password BY 'student12';"
mysql -u root -e "GRANT all privileges on *.* to 'nodeapp'@'%';"
mysql -u root -e "CREATE DATABASE STUDENTS;"
mysql -u root -e "USE STUDENTS; CREATE TABLE students(
            id INT NOT NULL AUTO_INCREMENT,
            name VARCHAR(255) NOT NULL,
            address VARCHAR(255) NOT NULL,
            city VARCHAR(255) NOT NULL,
            state VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            phone VARCHAR(100) NOT NULL,
            PRIMARY KEY ( id ));"

# Configure MySQL to accept connections from any IP
sed -i 's/.*bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl enable mysql
service mysql restart

# Create systemd service file
cat > /etc/systemd/system/nodeapp.service << EOF
[Unit]
Description=Node.js Student Application
After=network.target mysql.service

[Service]
Type=simple
User=root
WorkingDirectory=/home/ubuntu/resources/codebase_partner

Environment=APP_DB_USER=nodeapp
Environment=APP_DB_PASSWORD=student12
Environment=APP_DB_NAME=STUDENTS
Environment=APP_PORT=80

ExecStart=/bin/bash -c "APP_DB_HOST=\$(TOKEN=\$(curl -X PUT \"http://169.254.169.254/latest/api/token\" -H \"X-aws-ec2-metadata-token-ttl-seconds: 21600\") && curl -s -H \"X-aws-ec2-metadata-token: \$TOKEN\" http://169.254.169.254/latest/meta-data/local-ipv4) npm start"

Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Set correct permissions
chown -R ubuntu:ubuntu /home/ubuntu/resources/codebase_partner

# Enable and start the service
systemctl enable nodeapp
systemctl start nodeapp

# Verify the service is running
systemctl status nodeapp
