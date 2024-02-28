#!/bin/bash

# Path to the .bashrc file of the current user
BASHRC="$HOME/.bashrc"

# Command to add to .bashrc
ASTRO_COMMAND="neofetch | pv -qL   200"

# Function to install neofetch and pv
install_tools() {
    if ! command -v neofetch > /dev/null; then
        sudo apt update && sudo apt install neofetch -y
    fi
    if ! command -v pv > /dev/null; then
        sudo apt update && sudo apt install pv -y
    fi
}

# Function to enable the autostart feature
enable_autostart() {
    echo -e "\n# Autostart for SSH\n$ASTRO_COMMAND" >> $BASHRC
    echo "Autostart enabled."
}

# Function to disable the autostart feature
disable_autostart() {
    sed -i "/^# Autostart for SSH/,+1d" $BASHRC
    echo "Autostart disabled."
}

# Function to check the status of the autostart feature
check_status() {
    if grep -q "^# Autostart for SSH" $BASHRC; then
        echo -e "\e[34mEnabled\e[0m" # Blue dot
    else
        echo -e "\e[31mDisabled\e[0m" # Red dot
    fi
}

# Main loop
while true; do
    clear
    echo "SSH AutoStart Manager"
    echo "--------------------"
    echo "1. Enable Autostart"
    echo "2. Disable Autostart"
    echo "3. Check Status"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) enable_autostart ;;
        2) disable_autostart ;;
        3) check_status ;;
        4) break ;;
        *) echo "Invalid choice. Try again." ;;
    esac

    sleep   2
done

# Ensure tools are installed
install_tools
