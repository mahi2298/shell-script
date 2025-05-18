#!/bin/bash
echo "To list all the variables passed in the script: $@"
echo "To list number of variables passed: $#"
echo "script name: $0"
echo "Current Working Directory: $PWD"
echo "Home Directory of the user: $HOME"
echo "PID of current script: $$"
sleep 10 &
echo "PID of last command used in background: $!"