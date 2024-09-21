#!/bin/bash

# Obtener los outputs de Terraform
BASTION_IP=$(terraform output -raw bastion_public_ip)
DB_ENDPOINT=$(terraform output -raw db_endpoint)
DB_USERNAME=$(terraform output -raw db_username)
DB_PASSWORD=$(terraform output -raw db_password)

# Conectarse al bastion
ssh -i "~/.ssh/id_rsa" ec2-user@"$BASTION_IP" << EOF

# Conectarse a la base de datos
mysql -h "$DB_ENDPOINT" -P 3306 -u "$DB_USERNAME" -p"$DB_PASSWORD" << 'ENDSQL'
CREATE TABLE IF NOT EXISTS publications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    avatar VARCHAR(250)
);

CREATE TABLE IF NOT EXISTS reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    publication VARCHAR(250) NOT NULL,
    avatar VARCHAR(250) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    score INT(11),
    publication VARCHAR(250),
    reviewers VARCHAR(250)
);
ENDSQL

EOF
