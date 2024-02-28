#!/bin/bash

# Check for root privileges
if [[ $EUID -ne  0 ]]; then
   echo "This script must be run as root"  
   exit  1
fi

# Check OS compatibility
os=$(lsb_release -si)
case "$os" in
  Ubuntu|Debian|Fedora|CentOS|OracleLinux|ArchLinux)
    ;;
  *)
    echo "Unsupported operating system detected. Supported OSes: Ubuntu, Debian, Fedora, CentOS, Oracle Linux, Arch Linux."
    exit  1
    ;;
esac

# Display main menu
while true; do
  dialog --clear --backtitle "WARP Proxy Management" --title "Main Menu" --menu "Select an option:"  15  60  4 \
  "1" "Install WARP Proxy" \
  "2" "Uninstall WARP Proxy" \
  "3" "Restart WARP Proxy" \
  "4" "Exit"  2>"${INPUT}"
  response=$?
  case $response in
    1) install_warp;;
    2) uninstall_warp;;
    3) restart_warp;;
    4) break;;
  esac
done

# Functions for menu actions
function install_warp {
  # Check if WARP is already installed
  if command -v warp >/dev/null  2>&1; then
    dialog --clear --backtitle "WARP Proxy Management" --title "Installation Status" --yesno "WARP Proxy is already installed. Would you like to reinstall it?"  10  60
    response=$?
    if [ $response -eq  0 ]; then
      # Reinstall WARP
      bash <(curl -fsSL git.io/warp.sh) proxy -f
      dialog --clear --backtitle "WARP Proxy Management" --title "Installation Result" --msgbox "WARP Proxy has been reinstalled successfully."  10  60
    fi
  else
    # Install WARP
    bash <(curl -fsSL git.io/warp.sh) proxy
    dialog --clear --backtitle "WARP Proxy Management" --title "Installation Result" --msgbox "WARP Proxy has been installed successfully."  10  60
  fi
}

function uninstall_warp {
  # Uninstall WARP
  bash <(curl -fsSL git.io/warp.sh) uninstall
  dialog --clear --backtitle "WARP Proxy Management" --title "Uninstallation Result" --msgbox "WARP Proxy has been uninstalled successfully."  10  60
}

function restart_warp {
  # Restart WARP
  bash <(curl -fsSL git.io/warp.sh) restart
  dialog --clear --backtitle "WARP Proxy Management" --title "Restart Result" --msgbox "WARP Proxy has been restarted successfully."  10  60
}

# Clean up temporary file
rm "${INPUT}"
