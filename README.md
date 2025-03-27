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
# Data-Recovery.sh - Data Recovery Script 💾🔍

## Overview 📝

The `Data-Recovery.sh` script is designed to help users recover lost or corrupted files from a specified disk by scanning it for known file signatures (magic numbers). It can recover files like images, documents, audio, video, and more, based on the specific signatures of those file types.

This script uses tools like `xxd` and `grep` to scan the disk for specific byte patterns that match known file formats. Once it identifies these patterns, it extracts the data and saves it as files in a user-defined location.

---

## Features ✨

- **Interactive**: The script asks for input and guides you step by step through the recovery process.
- **File Signature Search**: Scans the disk for multiple file types based on their magic numbers (file headers).
- **Multiple File Types**: Recovers a wide variety of files, including images, documents, audio, video, and more.
- **Custom Recovery Path**: You specify where you want the recovered files to be saved.
- **Warnings**: Provides warnings when necessary (such as ensuring the device exists under `/dev/...`).

---

## How It Works 🔧

1. **Initialization**:
   - The script prompts the user to provide the disk device name (e.g., `/dev/sda`) and checks that the device exists.
   - It then asks for the directory where the recovered files should be stored.

2. **Magic Number Search**:
   - The script contains a list of magic numbers for various file types (e.g., images, documents, audio files, etc.).
   - It scans the device using `xxd` and `grep`, looking for these signatures in the raw disk data.

3. **File Recovery**:
   - When a match is found, the script uses `dd` to extract the data from the disk and saves it as a file in the user-defined recovery path.
   - Each recovered file is named based on its offset and file type, making it easy to identify.

4. **Completion**:
   - Once the scan is complete, the script outputs a message indicating where the recovered files are stored.

---

## Example Usage 💡

You will be prompted with the following questions:

- **Disk Name**: `/dev/sda` (Ensure the disk name is correct! ⚠️)
- **Recovery Directory**: `/home/user/recovered_files/`

The script will then scan the device and recover files, saving them in the specified directory.

---

## Pros 🌟

- **Variety of Supported File Types**: The script can recover a wide range of file types, including images, documents, audio, video, and even compressed or disk image files.
  
- **No Need for Installation**: If the necessary tools (`xxd`, `grep`, `dd`) are available on the system, the script is ready to run without additional software installation.

- **Customizable Recovery Path**: You can specify exactly where the recovered files should be stored, giving you control over your file management.

- **Basic Recovery for Lost Files**: It provides an automated way to recover files when a file system is corrupted or data is accidentally lost.

---

## Cons/Limitations ⚠️

- **Partial File Recovery**: The recovered files might not always be fully intact. If a file is split or its data is fragmented, the recovery might result in partial files that may not open properly or be corrupted.
  
- **File Integrity Issues**: The script does not guarantee the integrity of the recovered files. Some files may open but might have missing data or become unusable.

- **Time-Consuming**: The recovery process can take a long time, especially if the device is large. For example:
    - **Small Device (e.g., 8GB USB)**: ~10-15 minutes ⏳
    - **Larger Device (e.g., 1TB HDD)**: ~1-2 hours ⏳

- **Raw Disk Scanning**: The script scans raw disk data, which can sometimes lead to the recovery of files that are not usable or are incorrectly formatted.

- **No File System Awareness**: The script doesn't check file systems or partitions. It assumes file signatures are still intact in the raw data, which might not be the case on highly corrupted disks.

---

## Warnings ⚠️

- **Device Name**: Make sure the device name you provide (e.g., `/dev/sda`) is correct. Recovering data from the wrong device can lead to data loss!
  
- **Recovery Path**: The recovery path must be valid and empty, as the script will save recovered files there. Ensure the directory is not being used for important files.

- **Disk Integrity**: This script works on raw disk data, so it may not recover files with high integrity. It's meant for basic recovery, not for highly damaged or corrupted disks.

---
