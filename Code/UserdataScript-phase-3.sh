#!/bin/bash -xe
apt update -y
apt install nodejs unzip wget npm mysql-client jq -y
#wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-200-ACCAP1-1-DEV/code.zip -P /home/ubuntu
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-200-ACCAP1-1-91571/1-lab-capstone-project-1/code.zip -P /home/ubuntu
cd /home/ubuntu
unzip code.zip -x "resources/codebase_partner/node_modules/*"
cd resources/codebase_partner
npm install aws aws-sdk

# Obtiene el secreto de AWS
SECRET_JSON=$(aws secretsmanager get-secret-value --secret-id Mydbsecret --query SecretString --output text)

# Exporta las variables de entorno usando jq para extraer los valores del JSON
export APP_DB_USER=$(echo $SECRET_JSON | jq -r '.user')
export APP_DB_PASSWORD=$(echo $SECRET_JSON | jq -r '.password')
export APP_DB_HOST=$(echo $SECRET_JSON | jq -r '.host')
export APP_DB_NAME=$(echo $SECRET_JSON | jq -r '.db')

export APP_PORT=80
npm start &
echo '#!/bin/bash -xe
cd /home/ubuntu/resources/codebase_partner
export APP_PORT=80
npm start' > /etc/rc.local
chmod +x /etc/rc.local