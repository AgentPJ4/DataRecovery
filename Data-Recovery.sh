#!/bin/bash
echo -e "\e[31mWarning: The provided device must be found under /dev/...\e[0m"
echo -e "\e[33mWelcome to Data Recovery!\e[0m"
echo -e "\e[32mPlease insert the name of the device you want to recover data from:\e[0m"
read diskname
if [[ -z $(echo "$diskname" | xargs) ]]; then
    echo -e "\e[31mError: No device name entered. Please provide a valid disk name!\e[0m"
    exit 1
fi
echo -e "\e[32mGive path where you want to store the recovered data:\e[0m"
echo -e "\e[32mExample: /home/Documents/Directory_for_Recovered_Data\e[0m"
read writepath
if [[ -z $(echo "$writepath" | xargs) ]]; then
    echo -e "\e[31mError: A path must be provided in order to continue!\e[0m"
    exit 1
fi
echo -e "\e[37mProceeding...\e[0m"

