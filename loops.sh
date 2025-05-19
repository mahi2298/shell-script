#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
echo "Script started executing at: $(date)" | tee -a $LOG_FILE
mkdir -p $LOGS_FOLDER
PACKAGES=("mysql" "nginx" "python")


if [ $USERID -ne 0 ]
then 
   echo -e "$R ERROR:: Please run the script with root access $N" | tee -a $LOG_FILE
   exit 1
else 
   echo "You are running the script with root access" | tee -a $LOG_FILE

VALIDATE () {
    if [ $1 -eq 0 ]
    then 
       echo -e "Installing $2 is $G SUCCESS ... $N " | tee -a $LOG_FILE
    else
       echo -e "Installing $2 is $R FAILURE ... $N " | tee -a $LOG_FILE
}

for package in ${PACKAGES[@]}
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
       echo "$package is not Installed already ... going to install it "
    dnf install $packagel -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "Nothing to do .... $Y $package is already Installed $N" | tee -a $LOG_FILE
fi
done