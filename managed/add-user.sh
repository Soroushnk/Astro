#!/bin/bash

# Define color variables for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to create a new user with a password
create_user() {
    local username="$1"
    local password="$2"
    
    # Create user
    sudo adduser --disabled-login --gecos "" "$username"
    
    # Set user password
    if [[ -n "$password" ]]; then
        echo "$username:$password" | sudo chpasswd
    fi
    
    # Enable login for the user
    sudo passwd -u "$username"
    
    echo -e "${GREEN}User $username added successfully!${NC}"
}

# Function to delete a user
delete_user() {
    local username="$1"
    
    # Delete the user
    sudo deluser --remove-home "$username"
    
    echo -e "${RED}User $username deleted.${NC}"
}

# Function to list users with a password
list_users() {
    echo -e "${YELLOW}Users with passwords:${NC}"
    awk -F':' '$2 != "!" && $2 != "*" {print $1}' /etc/shadow | while read -r user; do
        echo -e "${BLUE}$user${NC}"
    done
}

# Main menu loop
while true; do
    echo -e "${YELLOW}Select an option:${NC}"
    echo -e "${YELLOW}1. Add a new user${NC}"
    echo -e "${YELLOW}2. Delete a user${NC}"
    echo -e "${YELLOW}3. List users with a password${NC}"
    echo -e "${YELLOW}4. Exit${NC}"
    read -rp "Option: " choice

    case $choice in
        1)
            read -rp "Enter username: " username
            read -rp "Enter password: " password
            create_user "$username" "$password"
            ;;
        2)
            read -rp "Enter username to delete: " username
            delete_user "$username"
            ;;
        3)
            list_users
            ;;
        4)
            echo -e "${RED}Exiting the script.${NC}"
            break
            ;;
        *)
            echo -e "${RED}Invalid option. Please try again.${NC}"
            ;;
    esac
done
