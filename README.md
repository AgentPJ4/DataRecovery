# Disk-Copy.sh - Disk Cloning Script 🖥️🔄

## Overview 📝

The `Disk-Copy.sh` script automates the process of creating an exact copy (bit-by-bit) of a disk drive using the `dd` command. It prompts the user for essential information like the drive name, destination path, and the image file name, before proceeding with the cloning process.

The script uses the `dd` command to create an image file of the selected drive and saves it in the specified directory. It also gives warnings and prompts to ensure the user is aware of the actions it is about to take.

---

## Features ✨

- **Interactive**: The script guides you step-by-step through the cloning process, asking for confirmation before starting.
- **Drive Selection**: It allows you to select which drive to copy by specifying the device name.
- **Destination Path**: You can specify where you want the disk image to be saved.
- **Progress Feedback**: Displays progress during the cloning process, so you can estimate how long it will take.
- **Safety Checks**: It asks for confirmation before proceeding with the potentially destructive operation to ensure data safety.

---

## How It Works 🔧

1. **Initialization**:
   - The script clears the terminal and shows a fun ASCII banner using `figlet` and `lolcat`.
   - It then explains the purpose of the script in a humorous tone using `lolcat`.

2. **Drive Selection**:
   - The script asks you to specify the drive you wish to copy, expecting a path like `/dev/device_name`.
   - If you don't provide a drive name, it will show an error and exit.

3. **Destination Path**:
   - You will be prompted to provide a path where the disk image will be saved.
   - If the path is not provided, the script will show an error and exit.

4. **Warnings & Confirmation**:
   - The script warns that the process will copy the entire drive, which might take some time ⏳.
   - For example, cloning an 8GB USB drive might take about 5-10 minutes depending on the speed of your drives ⚡.
   - You will then be asked to confirm if you want to proceed. If you decline, the operation is canceled.

5. **Image File Name**:
   - You can provide a custom name for the disk image (ending with `.img`).
   - If no name is provided, the script defaults the image file to `disk_backup.img`.

6. **Cloning Process**:
   - The script starts the cloning process with the `dd` command, copying the drive bit by bit.
   - The progress of the cloning operation is displayed to keep you informed.
   - A basic time estimate is shown based on the size of the drive being copied 🕒.

    **Time Estimate**:
    - The cloning time varies depending on the size and the speed of your drives. For example:
        - **8GB USB**: ~5-10 minutes ⏳
        - **1TB Hard Drive**: ~1-2 hours ⏳

---

## Example Usage 💡

You will be prompted with the following questions:

- **Drive Name**: `/dev/sda` (Make sure you enter the correct drive name! ⚠️)
- **Destination Path**: `/home/user/backups/`
- **Image File Name**: `backup_drive.img`

The script will then proceed with copying the entire drive into the specified path.

---

## Warnings ⚠️

- **Drive Name**: Be sure the drive name you provide is correct! Copying the wrong drive may lead to data loss.
- **Data Overwrite**: The cloning process can overwrite existing files in the destination path. Make sure the directory is empty or contains no important files before proceeding.
- **Time Consumption**: Copying large drives can take a considerable amount of time ⏳, depending on the size and speed of the drives. For example, an 8GB USB drive might take 5-10 minutes, while a 1TB hard drive can take 1-2 hours.

---
