#!/bin/bash
set -euo pipefail
# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Backup and restore original resolv.conf
BACKUP_FILE="/etc/resolv.conf.bak"

# Function to display the current nameservers with correct numbering
display_nameservers() {
    echo -e "${YELLOW}Current nameservers:${NC}"
    awk '/nameserver/ {printf "%s\n", $2}' /etc/resolv.conf | nl -ba
}

# Function to change nameserver
change_nameserver() {
    display_nameservers

    read -p "Enter the number of the nameserver you want to change: " number

    if ! [[ "$number" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Invalid input. Please enter a number corresponding to a listed nameserver.${NC}"
        return
    fi

    existing_nameserver=$(awk '/nameserver/ {print $2}' /etc/resolv.conf | sed -n "${number}p")

    if [ -z "$existing_nameserver" ]; then
        echo -e "${RED}No nameserver found at that position.${NC}"
        return
    fi

    read -p "Enter the new nameserver: " new_nameserver

    if ! grep -Pq '^(\d{1,3}\.){3}\d{1,3}$' <<< "$new_nameserver"; then
        echo -e "${RED}Invalid IP address format. Please enter a valid IPv4 address.${NC}"
        return
    fi

    sudo cp /etc/resolv.conf "$BACKUP_FILE" && echo -e "${GREEN}Backup created at $BACKUP_FILE.${NC}"
    sudo sed -i "${number}s/.*/nameserver $new_nameserver/" /etc/resolv.conf
    echo -e "${GREEN}Nameserver $number changed to $new_nameserver.${NC}"
}

# Function to add additional nameservers
add_nameservers() {
    read -p "Enter the additional nameserver(s), one per line: " -a new_nameservers

    for ns in "${new_nameservers[@]}"; do
        if grep -Fxq "nameserver $ns" /etc/resolv.conf; then
            echo -e "${YELLOW}Nameserver $ns already exists.${NC}"
        else
            echo "nameserver $ns" | sudo tee -a /etc/resolv.conf > /dev/null
            echo -e "${GREEN}Added nameserver $ns.${NC}"
        fi
    done
}

# Main menu
while true; do
    clear
    echo -e "${BLUE}-------------------"
    echo "       MENU"
    echo -e "-------------------${NC}"
    echo -e "${YELLOW}1. Display Nameservers"
    echo -e "2. Change Nameserver"
    echo -e "3. Add Additional Nameservers"
    echo -e "4. Quit${NC}"
    echo -e "${BLUE}-------------------${NC}"
    read -p "Enter your choice: " option

    case $option in
        1)
            clear
            display_nameservers
            read -p "Press Enter to continue..."
            ;;
        2)
            clear
            change_nameserver
            read -p "Press Enter to continue..."
            ;;
        3)
            clear
            add_nameservers
            read -p "Press Enter to continue..."
            ;;
        4)
            clear
            echo -e "${RED}Exiting...${NC}"
            break
            ;;
        *)
            echo -e "${RED}Invalid option. Please try again.${NC}"
            read -p "Press Enter to continue..."
            ;;
    esac
done
