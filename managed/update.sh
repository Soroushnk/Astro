#!/bin/bash

# Set a vibrant blue background color for the script's output
tput setaf 4

# Perform the server update process
echo "🟦 Updating the server..."

# Update the package repositories
apt update 

# Wait for the update process to complete
while [ $(pgrep apt-get) -gt 0 ]; do
    sleep 1
done

# Upgrade all installed packages
echo "🟦 Upgrading all packages..."
apt upgrade -y

apt install zenity tput
# Clear the screen to show the updated package list
clear

# Check for any packages to install
packages=$(dpkg -l | grep "^i ." | awk '{print $2}')

# Set a contrasting yellow color for the packages list
tput setaf 2

# Display the list of packages to install
echo "🟦 Packages to install:"
echo
for package in $packages; do
    echo "   $package"
done

# Set the background color back to blue
tput setaf 4

# Install the packages automatically
echo "🟦 Installing packages..."

for package in $packages; do
    apt install -y $package
done

# Set a green color to indicate successful completion
tput setaf 2

# Display completion message
echo "🟩 Server update completed."

# Return to the main menu
echo "🟦 Returning to main menu..."

# Clear the screen for a fresh start
clear

# Fetch and execute the main menu script
curl -sL https://raw.githubusercontent.com/[YOUR_USERNAME]/[YOUR_REPOSITORY]/main/main_menu.sh | bash
