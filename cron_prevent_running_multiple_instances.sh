#!/bin/bash

if pidof -o %PPID -x "$0"; then
echo "already running, exiting"
exit
fi


# do Stuff Here
