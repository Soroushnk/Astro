#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Function to handle interrupt signal (Ctrl+C)
handle_interrupt() {
    echo -e "\n${RED}Interrupted. Returning to main menu...${NC}"
    main_menu
}

# Trap the SIGINT signal and call the handle_interrupt function
trap 'handle_interrupt' SIGINT

# Function to display the process table
display_process_table() {
    # Print table header with color
    printf "${YELLOW}%-20s %-10s %-10s %-10s${NC}\n" "Program Name" "CPU Usage" "RAM Usage" "Network Usage"

    while true; do
        # Get process information with ps command
        ps_output=$(ps -e -o comm,%cpu,%mem --sort=-%cpu | head -n   6)

        # Extract specific columns with awk command
        awk_output=$(echo "$ps_output" | awk '{printf "%-20s %-10s %-10s\n", $1, $2, $3}')

        # Get network usage with sar command
        sar_output=$(sar -n DEV   1   1 | awk '/ens/ {printf "%-10s", $5}')

        # Clear screen and print table header with color
        clear
        printf "${YELLOW}%-20s %-10s %-10s %-10s${NC}\n" "Program Name" "CPU Usage" "RAM Usage" "Network Usage"

        # Print table with color
        printf "${GREEN}%s${NC} ${RED}%s${NC}\n" "$awk_output" "$sar_output"

        echo -e "${RED}Press CTRL+C to return to the menu.${NC}"
        # Wait for   5 seconds before next iteration
        sleep   5
    done
}

# Main menu loop
main_menu() {
    clear
    echo -e "${YELLOW}System Usage Monitor${NC}"
    echo -e "${YELLOW}---------------------${NC}"
    echo -e "${GREEN}1. View process table${NC}"
    echo -e "${GREEN}2. Quit${NC}"
    echo -e "${YELLOW}---------------------${NC}"
    echo -e "${GREEN}Press CTRL+C to return to this menu at any time.${NC}"
    read -e -n1 -r option

    case $option in
        1)
            display_process_table
            ;;
        2)
            # Quit the script
            exit   0
            ;;
        *)
            # Handle invalid input
            echo -e "${RED}Invalid option selected. Press CTRL+C to return to the menu.${NC}"
            ;;
    esac
}

# Start the script with the main menu
main_menu
