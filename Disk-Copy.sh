#!/bin/bash
clear
figlet "Disk Copy" | lolcat
echo "This program is an automated script of the command \"dd\" used to copy drives bit by bit into an image file." | lolcat
echo ""
echo -e "\e[33mWARNING: The inserted drive name should be found under /dev/device_name\e[0m"
echo "Please insert the name of the drive you want to copy:"
read drivename
if [[ -z $(echo "$drivename" | xargs) ]]; then
        echo -e "\e[31mERROR: A drive name must be provided in order to proceed!\e[0m"
        exit 1
fi
echo ""
echo -e "\e[33mWARNING: The provided path will be inserted after the \"of\" parameter in the dd command!\e[0m"
echo "Please insert the path in which you want to save the extracted files:"
read ofpath
if [[ -z $(echo "$ofpath" | xargs) ]]; then
        echo -e "\e[31mERROR: A path must be provided!\e[0m"
        exit 1
fi
echo ""
echo -e "\e[33mWARNING: The command will now copy the entire drive. This may take a long time!\e[0m"
echo -e "\e[33mDrive to copy: \e[0m/dev/$drivename"
echo -e "\e[33mDestination file: \e[0m$ofpath"
echo ""
echo -e "\e[31mAre you sure you want to proceed? (y/n)\e[0m"
read confirmation
if [[ "$confirmation" != "y" ]]; then
    echo -e "\e[31mOperation canceled.\e[0m"
    exit 1
fi
echo "What would you like to name the image file? (____.img) "
read imagename
if [[ -z $(echo "$imagename" | xargs) ]]; then
        echo -e "\e[31mImage name set to disk_backup\e[0m"
	imagename="disk_backup"
fi
echo "This process might take a while depending on the size of the drive being copied. Please be patient..." | pv -qL 10
dd if=/dev/$drivename of=$ofpath/$imagename.img bs=4 status=progress
