#!/bin/bash
echo -e "\e[31mWarning: The provided device must be found under /dev/...\e[0m"
echo -e "\e[33mWelcome to Data Recovery!\e[0m"
echo -e "\e[32mPlease insert the name of the device you want to recover data from:\e[0m"
read diskname
if [[ -z "$diskname" ]]; then
    echo -e "\e[31mError: No device name entered. Please provide a valid disk name!\e[0m"
    exit 1
fi
device="/dev/$diskname"
if [[ ! -b "$device" ]]; then
    echo -e "\e[31mError: Device $device not found! Make sure it exists under /dev/.\e[0m"
    exit 1
fi
echo -e "\e[32mEnter the directory where you want to store recovered files:\e[0m"
read writepath
if [[ -z "$writepath" ]]; then
    echo -e "\e[31mError: A valid path must be provided!\e[0m"
    exit 1
fi
mkdir -p "$writepath"
declare -A magic_numbers
# 📷 Image Files
magic_numbers["jpg"]="FFD8FF"
magic_numbers["jpeg"]="FFD8FFE0"
magic_numbers["png"]="89504E470D0A1A0A"
magic_numbers["gif"]="47494638"
magic_numbers["bmp"]="424D"
magic_numbers["tiff"]="49492A00"
magic_numbers["ico"]="00000100"
# 📜 Document Files
magic_numbers["pdf"]="25504446"
magic_numbers["doc"]="D0CF11E0A1B11AE1"
magic_numbers["docx"]="504B0304"
magic_numbers["xls"]="D0CF11E0A1B11AE1"
magic_numbers["xlsx"]="504B0304"
magic_numbers["ppt"]="D0CF11E0A1B11AE1"
magic_numbers["pptx"]="504B0304"
magic_numbers["rtf"]="7B5C727466"
magic_numbers["odt"]="504B030414000600"
magic_numbers["epub"]="504B030414000000000000"
# 🔊 Audio Files
magic_numbers["mp3"]="494433"
magic_numbers["wav"]="52494646"
magic_numbers["flac"]="664C614300000022"
magic_numbers["aac"]="FFF1"
magic_numbers["ogg"]="4F676753"
# 🎥 Video Files
magic_numbers["mp4"]="6674797069736F6D"
magic_numbers["avi"]="52494646"
magic_numbers["mov"]="000000146674797071742020"
magic_numbers["mkv"]="1A45DFA3"
magic_numbers["flv"]="464C5601"
magic_numbers["wmv"]="3026B2758E66CF11A6D900AA0062CE6C"
# 📦 Compressed Files
magic_numbers["zip"]="504B0304"
magic_numbers["rar"]="526172211A0700"
magic_numbers["tar"]="7573746172"
magic_numbers["7z"]="377ABC"
magic_numbers["gz"]="1F8B"
magic_numbers["bz2"]="425A68"
magic_numbers["xz"]="FD377A585A00"
# 💾 Disk Images & Partitions
magic_numbers["iso"]="4344303031"
magic_numbers["vhd"]="636F6E6563746978"
magic_numbers["vmdk"]="4B444D"
magic_numbers["qcow"]="514649FB"
# 💻 Executable Files
magic_numbers["elf"]="7F454C46"
magic_numbers["exe"]="4D5A"
magic_numbers["dll"]="4D5A"
magic_numbers["msi"]="D0CF11E0A1B11AE1"
# 📜 Web & Script Files
magic_numbers["html"]="3C21444F43545950"
magic_numbers["xml"]="3C3F786D6C"
magic_numbers["json"]="7B0A202022"
magic_numbers["php"]="3C3F706870"
magic_numbers["py"]="23212F7573722F62696E2F707974686F6E"
# 📝 Plain Text & Config
magic_numbers["txt"]="EFBBBF"
magic_numbers["csv"]="EFBBBF"
magic_numbers["ini"]="5B53656374696F6E"
# 🖼️ Font Files
magic_numbers["ttf"]="0001000000"
magic_numbers["otf"]="4F54544F00"
magic_numbers["woff"]="774F4646"
magic_numbers["woff2"]="774F4632"
# 🔒 Encryption & Keys
magic_numbers["pem"]="2D2D2D2D2D424547494E"
magic_numbers["pgp"]="950110"
echo -e "\e[33mSearching for files...\e[0m"
for key in "${!magic_numbers[@]}"; do
    hex_pattern="${magic_numbers[$key]}"
    echo -e "\e[32mScanning for $key files...\e[0m"
    # Convert device to hex and search for magic numbers
    offsets=$(xxd -p "$device" | tr -d '\n' | grep -oba "$hex_pattern" | awk -F: '{print $1}')
    for offset in $offsets; do
        output_file="$writepath/recovered_${offset}.$key"
        # Extract data from offset
        dd if="$device" bs=1 skip="$offset" count=1000000 of="$output_file" status=none
        echo -e "\e[36mRecovered: $output_file\e[0m"
    done
done
echo -e "\e[33mRecovery complete! Files saved in: $writepath\e[0m"
