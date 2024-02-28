#!/bin/bash

# Function to check if a package is installed
check_if_installed() {
    dpkg -l | grep -q "^ii\s*$1"
}

# Function to install a package
install_package() {
    if ! check_if_installed "$1"; then
        sudo apt-get update
        sudo apt-get install -y "$1"
    fi
}

# Check if sudo is available


# Install TOR and PIP3 if they are not installed
install_package tor
install_package python3
install_package python3-pip

# Install the requests[socks] Python package using pip3
pip3 install --user requests[socks]

# Clone the Auto Tor IP changer repository
git clone https://github.com/FDX100/Auto_Tor_IP_changer.git

# Change directory to the cloned repository
cd Auto_Tor_IP_changer

# Run the Python installer
python3 install.py

# Create a function to start the IP changer
aut() {
    # Set up the IP changer
    # The following lines depend on the actual implementation of the Auto Tor IP changer
    # For example, if the installer creates a command line tool called `toripchange`, you would call it here
    echo "Starting IP changer..."
    toripchange --time "$1" --count "$2"
}

# Prompt the user for input
echo "How often would you like to change your IP?"
read -p "Time (in seconds): " time
echo "How many times would you like to change your IP?"
read -p "Count (0 for infinite): " count

# Start the IP changer with the user's preferences
aut "$time" "$count"

# Inform the user to configure their browser to use the SOCKS proxy
echo "Please set your browser's SOCKS proxy to   127.0.0.1:9050."
