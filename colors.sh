#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: Please Login with Root user $N"
   exit 1
else
   echo "You are running the script with root user"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
      echo -e "Installing $2 is ... $G SUCCESS $N"
    else
      echo -e "Installing $2 is ... $R FAILURE $N"
      exit 1
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then
   echo "Mysql is not installed... going to install it"
   dnf install mysql -y
   VALIDATE $? "MYSQL"
else
   echo -e "Nothing to do MYSQL... $Y already installed $N"
fi

dnf list installed python3 -y
if [ $? -ne 0 ]
then
   echo "Python is not installed trying to install it"
   dnf install python3 -y
   VALIDATE $? "PYTHON"
else
   echo -e "Nothing to do Python... $Y already installed $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
   echo "Nginx is not installed trying to install it"
   dnf install nginx -y
   VALIDATE $? "NGINX"
else
   echo -e "Nothing to do nginx... $Y already installed $N"
fi