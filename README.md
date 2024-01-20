# Bash-WebApp-Recon-Script
Bash script to perform Web Application recon. 

The script utilizes a handful of commonly used recon tools built into Kali and Parrot Linux. Once the script has completed it's reconnaissance, it creates a report with the findings. 

# Please note, this script was created for educational purposes.

# How to Use:

The command below will run a scan against the specified domain.

`./recon.sh example.com` 

To run a scan with a specific tool only, use the -m flag. 

`./recon.sh -m nmap-only exmaple.com`
