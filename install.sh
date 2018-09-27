#!/usr/bin/env bash

BOLD='\033[1m'
GREEN='\033[92m'
WHITE='\033[37m'
YELLOW='\033[93m'
BLUE='\033[34m'

echo -e "${BOLD}${BLUE}Installing WebcamGuard to /opt/WebcamGuard/${WHITE}"

# Creating the config file
echo -e "${YELLOW}Enter FROM email address: ${WHITE}"
read FROM
echo -e "${YELLOW}Enter TO email address: ${WHITE}"
read TO
echo -e "${YELLOW}Enter email password: ${WHITE}"
read -s PASSWORD
echo -e "${YELLOW}\nEnter SMTP server address: ${WHITE}"
read SMTP
echo -e "${YELLOW}Enter SMTP port number: ${WHITE}"
read PORT

# Copying files
sudo mkdir -p /opt/WebcamGuard/archive
sudo cp -f {WebcamGuard,sendEmail.py,uninstall.sh} /opt/WebcamGuard/
sudo chmod -R +x /opt/WebcamGuard/*

sudo echo "fromAddr = \"${FROM}\"
toAddr = \"${TO}\"
password = \"${PASSWORD}\"
smtpServer = \"${SMTP}\"
smtpPort = ${PORT}" > config.py

sudo mv config.py /opt/WebcamGuard/

# Linking the script to the systemd
sudo ln -s /opt/WebcamGuard/WebcamGuard /lib/systemd/system-sleep/

echo -e "${GREEN}Installed successfully!"
