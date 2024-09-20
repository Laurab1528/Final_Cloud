#!/bin/bash

####################################################################################################
# SCRIPT TO CONFIGURE DATABASE (MANUALLY ONLY ONCE)
# # TODO: ADD AUTOMATION SCRIPT AT DEPLOYMENT
####################################################################################################

# 1. Connect to the jump-box instance (via SSH or SSM)
# Example: ssh -i "KEY.pem" ec2-user@JUMP_BOX_PUBLIC_IP - devuelve el bastion

# 2. Connect to the database instance (via mysql client)
# Example: mysql -h ENDPOINT -P 3306 -u USER -p"${DB_PASSWORD}"

# 3. Run the initial SQL scripts (see them in the infrastructure/database folder)


# # 3. Create the initial tables
# CREATE TABLE IF NOT EXISTS publications (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     name VARCHAR(250) NOT NULL,
#     avatar VARCHAR(250)
#   
# );

# CREATE TABLE IF NOT EXISTS reviewers (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     name VARCHAR(255) NOT NULL,
#     publication VARCHAR(250) NOT NULL,
#     avatar VARCHAR(250) UNIQUE NOT NULL
# );

# CREATE TABLE IF NOT EXISTS movies (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     title VARCHAR(255) NOT NULL,
#     release VARCHAR (250)
#     score INT(11),
#     publication VARCHAR(250),
    # reviewers VARCHAR(250),
# );

# ENDSQL

# ENDSSH

