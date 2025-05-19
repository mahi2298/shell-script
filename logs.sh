#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.logs"
mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" | tee -a $LOG_FILE
if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: Please Login with Root user $N" | tee -a $LOG_FILE
   exit 1
else
   echo "You are running the script with root user" | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
      echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
      echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE
      exit 1
    fi
}
dnf list installed mysql &>>LOG_FILE
if [ $? -ne 0 ]
then
   echo "Mysql is not installed... going to install it" | tee -a $LOG_FILE
   dnf install mysql -y &>>LOG_FILE
   VALIDATE $? "MYSQL"
else
   echo -e "Nothing to do MYSQL... $Y already installed $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>LOG_FILE
if [ $? -ne 0 ]
then
   echo "Python is not installed trying to ins2Wtall it" | tee -a $LOG_FILE
   dnf install python3 -y &>>LOG_FILE
   VALIDATE $? "PYTHON"
else
   echo -e "Nothing to do Python... $Y already installed $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>LOG_FILE
if [ $? -ne 0 ]
then
   echo "Nginx is not installed trying to install it" | tee -a $LOG_FILE
   dnf install nginx -y &>>LOG_FILE
   VALIDATE $? "NGINX"
else
   echo -e "Nothing to do nginx... $Y already installed $N" | tee -a $LOG_FILE
fi