#!/usr/bin/env bash
BOLD='\033[1m'
RED='\033[31m'

echo -e "${BOLD}Removing WebcamGuard..."
sudo rm -rf /opt/WebcamGuard/
sudo unlink /lib/systemd/system-sleep/WebcamGuard
echo -e "${RED}Successfully uninstalled WebcamGuard!"
