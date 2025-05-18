#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
   echo "ERROR:: Please run script with root user"
   exit 1
else
   echo "You are running the script with root user"
fi
VALIDATE (){
    if [ $1 -eq 0 ]
   then 
      echo "Installing $2 is SUCCESS..."
   else
      echo "Installing $2 is FAILURE..."
      exit 1
   fi
}

dnf installed mysql #checking wheather mysql is installed or not
if [ $? -ne 0 ]
then
   echo "MYSQL is not installed... now going to install it"
   dnf install mysql -y # if mysql is not installed then installing the mysql here
   VALIDATE $? "MySQL"
else
   echo "MySQL is already installed no need to install it"
fi

dnf installed python3 #checking wheather python is installed or not
if [ $? -ne 0 ]
then
   echo "Python3 is not installed... now going to install it"
   dnf install python3 -y # if python is not installed then installing the python here
   VALIDATE $? "Python3"
else
   echo "Python3 is already installed no need to install it"
fi

dnf installed nginx
if [ $? -ne 0 ]
then
   echo "Nginx is not installed... now going to install it"
   dnf install nginx -y # if Nginx is not installed then installing the nginx here
   VALIDATE $? "Nginx"
else
   echo "NGINX is already installed no need to install it"
fi