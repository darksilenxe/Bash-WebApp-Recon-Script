# Bash-WebApp-Recon-Script
Bash script to perform Web Application recon. 

The script utilizes a handful of commonly used recon tools built into Kali and Parrot Linux. Once the script has completed it's reconnaissance, it creates a report with the findings. 

# Legal & Ethical Disclaimer

For Educational and Ethical Testing Purposes Only.

The use of this tool for scanning targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state, and federal laws. The author assumes no liability and is not responsible for any misuse or damage caused by this program.

Only use this tool on:
- Infrastructure you personally own.
- Networks where you have explicit, written permission to perform security testing.
- CTF (Capture The Flag) environments or "Hack The Box" style labs.

# How to Use:

The command below will run a scan against the specified domain.

`./recon.sh example.com` 

To run a scan with a specific tool only, use the -m flag. 

`./recon.sh -m nmap-only exmaple.com`
