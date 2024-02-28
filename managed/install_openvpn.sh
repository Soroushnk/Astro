#!/bin/bash
set -euo pipefail

# Define colors
declare -A COLORS=(
    ["GREEN"]='\033[0;32m'
    ["YELLOW"]='\033[1;33m'
    ["RED"]='\033[0;31m'
    ["BLUE"]='\033[0;34m'
    ["NC"]='\033[0m' # No Color
)

# Function to install OpenVPN
install_openvpn() {
    echo -e "${COLORS["GREEN"]}Installing OpenVPN...${COLORS["NC"]}"
    echo ""
    curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
    chmod +x openvpn-install.sh
    ./openvpn-install.sh
    echo ""
    echo -e "OpenVPN installation completed. Press ${COLORS["RED"]}ENTER${COLORS["NC"]} to return to the menu."
    read -s -n  1
}

# Function to display certificate details
display_certificates() {
    local client_name
    read -p "Enter the name of the client for which you want to display certificates: " client_name
    if [[ -z "$client_name" ]]; then
        echo -e "${COLORS["RED"]}Client name cannot be empty.${COLORS["NC"]}"
        return
    fi
    cat "/etc/openvpn/easy-rsa/pki/ca.crt"
    echo ""
    awk '/BEGIN/,/END CERTIFICATE/' "/etc/openvpn/easy-rsa/pki/issued/$client_name.crt"
    echo ""
    cat "/etc/openvpn/easy-rsa/pki/private/$client_name.key"
    echo ""
    cat /etc/openvpn/tls-crypt.key
    echo ""
    cat /etc/openvpn/tls-auth.key
    echo ""
    echo -e "Certificate details displayed. Press ${COLORS["RED"]}ENTER${COLORS["NC"]} to return to the menu."
    read -s -n  1
}

# Function to display help information
display_help() {
    echo -e "${COLORS["GREEN"]}Usage: $0 [options]"
    echo -e "Options:"
    echo -e "  -h, --help    Show this help message."
    echo -e "  -i, --install Install OpenVPN."
    echo -e "  -d, --details Display client certificate details."
    echo -e "${COLORS["NC"]}"
}

# Parse command-line arguments
while (( "$#" )); do
    case "$1" in
        -h|--help)
            display_help
            exit   0
            ;;
        -i|--install)
            install_openvpn
            exit   0
            ;;
        -d|--details)
            display_certificates
            exit   0
            ;;
        *)
            echo "Invalid option. Use -h or --help for usage information."
            exit   1
            ;;
    esac
    shift
done

# Main menu loop
while true; do
    echo -e "${COLORS["GREEN"]}+------------------------------------------+"
    echo -e "¦           ${COLORS["BLUE"]}OpenVPN Management Script${COLORS["GREEN"]}            ¦"
    echo -e "¦------------------------------------------¦"
    echo -e "¦ ${COLORS["YELLOW"]}1${COLORS["NC"]}. Install OpenVPN             ${COLORS["GREEN"]}   ¦"
    echo -e "¦ ${COLORS["YELLOW"]}2${COLORS["NC"]}. Display Client Certificate Details${COLORS["GREEN"]}    ¦"
    echo -e "¦ ${COLORS["RED"]}0${COLORS["NC"]}. Exit                                 ${COLORS["GREEN"]}   ¦"
    echo -e "+------------------------------------------+${COLORS["NC"]}"
    read -p "Enter your choice: " choice

    case "$choice" in
        1)
            install_openvpn
            ;;
        2)
            display_certificates
            ;;
        0)
            echo -e "${COLORS["RED"]}Exiting...${COLORS["NC"]}"
            exit   0
            ;;
        *)
            echo -e "${COLORS["RED"]}Invalid choice. Try again.${COLORS["NC"]}"
            ;;
    esac
done
