#!/bin/bash
echo "Welcome to Data Recovery!"
echo "Please insert the name of the device you want to recover data from :"
read diskname

if [[ -z $(echo "$diskname" | xargs) ]]; then
	echo "Error: No device name entered. Please provide a valid disk name!"
	exit 1
fi
echo "Give path where you want to store the recovered data: "
echo "Example : /home/Documents/Directory_for_Recovered_Data"
read writepath
if [[ -z $(echo "$writepath" | xargs) ]]; then
        echo "Error: A path must be provided in order to continue!"
        exit 1
fi

echo "Proceeding..."

