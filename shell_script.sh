#!/bin/bash
#This section takes input from the user and hands it to a prompt string (PS3)
prompt="Please choose an option: " 
options=("CPU info" "Interrupts" "PID info" "Quit")
PS3="$prompt "

select opt in "${options[@]}"
#This selects the option according to user input
do
	case "$REPLY" in #This selects a command to input based on what the user entered.
		1 ) cat /proc/cpuinfo;; #Shows cpu info
		2 ) cat /proc/interrupts;; #Shows info on interrupts
		3 )	echo -e "Enter PID:  \c"
			read
			cat /proc/"$REPLY"/status;; #reads user input, then passes it to a cat command which brings back status of pid
		4 ) exit;; #exit script
	esac
done