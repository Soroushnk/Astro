#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to install speedtest-cli if not already installed
install_speedtest() {
    if ! command -v speedtest-cli &> /dev/null; then
        echo -e "${GREEN}Installing speedtest-cli...${NC}"
        sudo apt-get update && sudo apt-get install speedtest-cli -y || {
            echo -e "${RED}Installation failed${NC}"   1>&2
            exit   1
        }
    fi
}

# Function to print a colored menu
print_menu() {
    clear
    echo -e "${BLUE}========================${NC}"
    echo -e "${BLUE}VPS Speed Test Menu${NC}"
    echo -e "${BLUE}========================${NC}"
    echo -e "${GREEN}1. Install speedtest-cli${NC}"
    echo -e "${GREEN}2. Complete test${NC}"
    echo -e "${GREEN}3. Continuous test${NC}"
    echo -e "${GREEN}4. Test Download Speed${NC}"
    echo -e "${GREEN}5. Test Upload Speed${NC}"
    echo -e "${GREEN}6. Choose Server and Test${NC}"
    echo -e "${GREEN}7. Help${NC}"
    echo -e "${GREEN}8. Exit${NC}"
    echo -e "${BLUE}========================${NC}"
}

# Function to display help text
display_help() {
    echo -e "${GREEN}Usage:${NC}"
    echo -e "${GREEN}1. Install speedtest-cli${NC}"
    echo -e "${GREEN}2. Complete test: Runs a full speed test once.${NC}"
    echo -e "${GREEN}3. Continuous test: Keeps testing until stopped.${NC}"
    echo -e "${GREEN}4. Test Download Speed: Checks download speed only.${NC}"
    echo -e "${GREEN}5. Test Upload Speed: Checks upload speed only.${NC}"
    echo -e "${GREEN}6. Choose Server and Test: Selects a server from a list and tests against it.${NC}"
    echo -e "${GREEN}7. Help: Displays this help text.${NC}"
    echo -e "${GREEN}8. Exit: Exits the script.${NC}"
}

# Main loop
while true; do
    print_menu
    read -p "Enter your choice: " choice

    case $choice in
        1)
            install_speedtest
            ;;
        2)
            install_speedtest
            speedtest-cli --share
            ;;
        3)
             install_speedtest
             trap 'echo "Stopping continuous test..."; break' INT  # This line will catch Ctrl+C and break the loop
             echo "Continuously measuring speed. Press Ctrl+C to stop."
             while true; do
                 speedtest-cli --share
                 sleep   5
            done
            ;;
        4)
            install_speedtest
            speedtest-cli --no-upload --share
            ;;
        5)
            install_speedtest
            speedtest-cli --no-download --share
            ;;
        6)
            install_speedtest
            # List servers and let user choose
            servers=$(speedtest-cli --list | awk -F') ' '/^[0-9]+\)/{print $1") " $2}' | sed 's/^[ \t]*//;s/[ \t]*$//')
            echo "Available servers:"
            echo "$servers"
            read -p "Enter server number: " server_number
            speedtest-cli --server "$server_number" --share
            ;;
        7)
            display_help
            ;;
        8)
            echo -e "${RED}Exiting...${NC}"
            exit
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
