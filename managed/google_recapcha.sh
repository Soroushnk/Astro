#!/bin/bash
set -euo pipefail

# Define colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to display help information
display_help() {
    echo -e "${GREEN}Usage: $0 [options]"
    echo -e "Commands:"
    echo -e "  help    Show this help menu."
    echo -e "  fix     Fix Google Recaptcha."
    echo -e "${NC}"
}

# Function to fix Google Recaptcha
fix_google_recaptcha() {
    echo -e "${GREEN}Fixing Google Recaptcha...${NC}"
    curl -O https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh
    chmod +x ./install_kernel.sh
    read -p "Do you want to proceed with the fix? (Y/N): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        ./install_kernel.sh
    else
        echo -e "${RED}Aborted Google Recaptcha fix.${NC}"
    fi
    echo -e "Press ${RED}ENTER${NC} to continue"
    read -s -n   1
}

# Main menu loop
while true; do
    clear
    echo -e "${GREEN}Menu:${NC}"
    echo -e "   1. ${GREEN}Fix Google Recaptcha${NC}"
    echo -e "   0. ${RED}Exit${NC}"
    read -p "Enter your choice: " choice

    case "$choice" in
       
        1)
            fix_google_recaptcha
            ;;
        0)
            echo -e "${RED}Exiting...${NC}"
            exit  0
            ;;
        *)
            echo -e "${RED}Invalid choice. Try again.${NC}"
            ;;
    esac
done
