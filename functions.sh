#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
   echo "ERROR:: Please run script with root user"
   exit 1
else
   echo "You are running the script with root user"
fi
dnf installed mysql
if [ $? -ne 0 ]
then
   echo "MYSQL is not installed... now going to install it"
   dnf install mysql -y
   if [ $? -eq 0 ]
   then 
      echo "Installing MYSQL is SUCCESS..."
   else
      echo "Installing MYSQL is FAILURE..."
      exit 1
   fi
else
   echo "MySQL is already installed no need to install it"
fi
dnf installed python3
if [ $? -ne 0 ]
then
   echo "Python3 is not installed... now going to install it"
   dnf install python3 -y
   if [ $? -eq 0 ]
   then 
      echo "Installing Python3 is SUCCESS..."
   else
      echo "Installing Python3 is FAILURE..."
      exit 1
   fi
else
   echo "Python3 is already installed no need to install it"
fi
dnf installed nginx
if [ $? -ne 0 ]
then
   echo "Nginx is not installed... now going to install it"
   dnf install nginx -y
   if [ $? -eq 0 ]
   then 
      echo "Installing NGINX is SUCCESS..."
   else
      echo "Installing NGINX is FAILURE..."
      exit 1
   fi
else
   echo "NGINX is already installed no need to install it"
fi