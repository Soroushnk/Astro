#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored text
print_color() {
  local color="$1"
  shift
  echo -e "${color}$*${NC}"
}

# Check if Zenity is installed
if ! command -v zenity >/dev/null   2>&1; then
  print_color $RED "Error: Zenity tool not found. Please install Zenity to use this script."
  exit   1
fi

# Main menu
while true; do
  print_color $BLUE "\nMain Menu:\n"
  print_color $GREEN "1. Change SSH Port\n"
  print_color $GREEN "2. Reset SSH Port to  22\n"
  print_color $RED "3. Exit\n"
  read -rp "Select an option [1-3]: " choice

  case $choice in
    1)
      # Change SSH Port
      while true; do
        new_port=$(zenity --entry --title="Change SSH Port" --text="Enter the new SSH port number:")
        if [ -z "$new_port" ]; then
          print_color $RED "Invalid port selection: please enter a valid port number."
        elif ! [[ $new_port =~ ^[0-9]{2,5}$ ]] || [[ $new_port -lt   1024 || $new_port -ge   65535 ]]; then
          print_color $RED "Invalid port number: must be a number between   1024 and   65535, inclusive."
        else
          break
        fi
      done

      confirm=$(zenity --question --title="Confirm SSH Port Change" --text="Are you sure you want to change the SSH port to $new_port?")
      if [ "$confirm" == "Yes" ]; then
        # Backup the existing SSH configuration file
        NOW=$(date +"%m_%d_%Y-%H_%M_%S")
        print_color $BLUE "Backing up the SSH configuration..."
        cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bckup.$NOW

        # Modify the SSH configuration file
        print_color $BLUE "Changing SSH port in configuration..."
        sed -i "s/#Port   22/$new_port/" /etc/ssh/sshd_config

        # Restart the SSH daemon
        print_color $BLUE "Restarting SSH service..."
        systemctl restart sshd.service

        # Update the firewall rules to allow the new SSH port
        print_color $BLUE "Updating firewall rules..."
        ufw allow $new_port/tcp

        # Display a confirmation dialog
        zenity --info --text="SSH port has been changed to $new_port. Please use this port to connect to the server."
        print_color $GREEN "SSH port change successful!"
      else
        print_color $YELLOW "Operation cancelled by the user."
      fi
      ;;
    2)
      # Reset SSH Port to  22
      print_color $BLUE "Resetting SSH port to the default (22)..."
      sed -i "s/^#Port.*$/Port  22/" /etc/ssh/sshd_config
      systemctl restart sshd.service
      ufw delete allow  22/tcp
      print_color $GREEN "SSH port has been reset to  22. Please use the default port to connect to the server."
      ;;
    3)
      # Exit
      print_color $YELLOW "Exiting the script."
      exit  0
      ;;
    *)
      # Invalid option
      print_color $RED "Invalid option. Please choose a number between  1 and  3."
      ;;
  esac
done
