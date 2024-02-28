#!/bin/bash

# Function to install neofetch
install_neofetch() {
    echo "Attempting to install neofetch..."
    if command -v apt > /dev/null; then
        sudo apt update && sudo apt install neofetch -y
    elif command -v pacman > /dev/null; then
        sudo pacman -Syu neofetch
    elif command -v dnf > /dev/null; then
        sudo dnf install neofetch
    else
        echo "Unsupported package manager. Please install neofetch manually."
        exit   1
    fi
}

# Function to install pv
install_pv() {
    echo "Attempting to install pv..."
    if command -v apt > /dev/null; then
        sudo apt update && sudo apt install pv -y
    elif command -v pacman > /dev/null; then
        sudo pacman -Syu pv
    elif command -v dnf > /dev/null; then
        sudo dnf install pv
    else
        echo "Unsupported package manager. Please install pv manually."
        exit   1
    fi
}

# Function to check if neofetch is installed
check_neofetch() {
    if ! command -v neofetch > /dev/null; then
        install_neofetch
    fi
}

# Function to check if pv is installed
check_pv() {
    if ! command -v pv > /dev/null; then
        install_pv
    fi
}

# Main execution
main() {
    # Check for neofetch and install if necessary
    check_neofetch

    # Check for pv and install if necessary
    check_pv

    # Run neofetch with optional arguments (remove --cpu to display CPU info)
    neofetch --cpu off | pv -qL   200 > /dev/null

    # Optionally, you can add more features here, such as logging or additional processing
}

# Execute main function
main "$@"
