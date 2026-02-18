#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]
then 
    echo "ERROR: Please run the user with root access"
    exit 1 #give other than 0 upto 127 
else 
    echo "You are running with root access"
fi

dnf list installed mysql
# check already installed or not. if Installed $? is 0, then 
# If not installed $? is not 0. expression is true

if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed..... going to install"
    dnf install mysql -y 
    if [ $? -eq 0 ]
    then
       echo "Install MYSQL is ...SUCESS"
    else
       echo "Install MYSQL is ...FAILURE"
        exit 1
    fi
else 
    echo "MySQL is already installed and nothing to do"
fi


# if [ $? -eq 0 ]
# then
#     echo "Install MYSQL is ...SUCESS"
# else
#     echo "Install MYSQL is ...FAILURE"
#     exit 1
# fi
