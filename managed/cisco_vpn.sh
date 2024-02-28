#!/bin/bash
set -euo pipefail
# Define colors
YELLOW='\033[1;33m'
GRAY='\033[0;37m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to display help information
display_help() {
    echo -e "${YELLOW}1.${NC} ${GRAY}Install ocserv${NC}"
    echo -e "${YELLOW}2.${NC} ${GRAY}Run ocserv${NC}"
    echo -e "${YELLOW}3.${NC} ${GRAY}Change ocserv port${NC}"
    echo -e "${YELLOW}4.${NC} ${RED}Back to Main Menu${NC}"
    echo -e "${YELLOW}5.${NC} ${GRAY}Show this help information${NC}"
}

# Main loop
while true; do
    clear
    display_help
    read -e -p "Enter choice [1-5]: " choice

    case $choice in
        1)
            wget -N --no-check-certificate https://raw.githubusercontent.com/sfc9982/AnyConnect-Server/main/ocserv-en.sh
            chmod +x ocserv-en.sh
            bash ocserv-en.sh
            ;;
        2)
            sudo systemctl start ocserv
            ;;
        3)
            read -p "Enter new TCP port number: " port
            if [[ $port =~ ^[0-9]+$ ]]; then
                sudo sed -i "s/tcp-port = [0-9]*/tcp-port = $port/" /etc/ocserv/ocserv.conf
                echo "TCP port set to $port"
            else
                echo "Invalid port number. Please try again."
            fi
            ;;
        4)
            break
            ;;
        5)
            display_help
            ;;
        *)
            echo "Invalid choice. Please enter a valid option."
            ;;
    esac

    read -p "Press ENTER to continue or type 'exit' to quit: " reply
    if [[ "$reply" == "exit" ]]; then
        break
    fi
done
