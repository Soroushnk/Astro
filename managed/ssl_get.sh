#!/bin/bash
# Define colors for output formatting
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if the user has sudo privileges
if [[ $(id -u) -ne  0 ]] ; then
   echo -e "${RED}Error:${NC} This script must be run as root"  1>&2
   exit  1
fi

# Function to check for required tools
check_required_tools() {
  local tool=$1
  if ! _exists $tool; then
    echo -e "${RED}Error:${NC} The '$tool' package is not installed."
    echo -e "${YELLOW}Info:${NC} Installing '$tool' now..."
    apt update && apt install -y $tool
  fi
}

# Function to check if a command exists
_exists() {
  command -v "$1" &>/dev/null
}

# Check for required tools
check_required_tools "apt"
check_required_tools "curl"

# Install socat if not already installed
if ! _exists socat; then
  echo -e "${GREEN}Installing socat...${NC}"
  apt install -y socat
fi

# Install acme.sh if not already installed
if ! _exists ~/.acme.sh/acme.sh; then
  echo -e "${GREEN}Installing Acme Script...${NC}"
  curl https://get.acme.sh | sh
else
  echo -e "${GREEN}Acme Script is already installed.${NC}"
fi

# Configure Acme
echo -e "${GREEN}Configuring Acme...${NC}"
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt

# Prompt user for email address
read -p "Enter your email address (used for account recovery): " email
~/.acme.sh/acme.sh --register-account -m $email

# Prompt user for domain name
read -p "Enter your domain name: " domain

# Issue certificate
echo -e "${GREEN}Getting SSL certificate for $domain...${NC}"
~/.acme.sh/acme.sh --issue -d $domain --standalone

# Install certificate
~/.acme.sh/acme.sh --installcert -d $domain --key-file /root/private.key --fullchain-file /root/cert.crt

# Inform user that the process is complete
echo -e "${GREEN}SSL certificate for $domain has been successfully installed.${NC}"

# Wait for user to press enter to exit
echo -e "${YELLOW}Press ENTER to finish.${NC}"
read
