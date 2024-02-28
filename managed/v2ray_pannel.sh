#!/bin/bash

# Define color codes
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
GRAY='\033[0;90m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to display a panel
function display_panel() {
    local panel_number=$1
    local panel_name=$2
    local panel_url=$3
    echo -e "${YELLOW}${panel_number}.${NC} ${GRAY}${panel_name}${NC}"
}

# Function to install a panel
function install_panel() {
    local panel_url=$1
    echo -e "${GREEN}Installing panel...${NC}"
    echo ""
    bash <(curl -Ls $panel_url)
}

# Function to install Marzban with Docker
function install_marzban() {
    echo -e "${GREEN}Installing Docker and Marzban...${NC}"
    echo ""
    curl -fsSL https://get.docker.com | sh
    wget -qO- https://github.com/Gozargah/Marzban-examples/releases/latest/download/fully-single-port.tar.gz | tar xz --xform 's/fully-single-port/marzban/' && cd marzban
    docker-compose up -d
    docker-compose down
    docker-compose up -d
}

# Main menu loop
while true; do
    clear
    echo "Please choose a panel to install:"
    display_panel  1 "hossein assadi's x-ui" "https://raw.githubusercontent.com/hossinasaadi/x-ui/master/install.sh"
    display_panel  2 "vaxilu (original)" "https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh"
    display_panel  3 "hiddify" "https://raw.githubusercontent.com/hiddify/hiddify-config/main/common/download_install.sh"
    display_panel  4 "alireza0 x-ui" "https://raw.githubusercontent.com/alireza0/x-ui/master/install.sh"
    display_panel  5 "3x-ui (MHSanaei)" "https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh"
    display_panel  6 "kafka x-ui" "https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh"
    display_panel  7 "marzban" "https://github.com/Gozargah/Marzban-scripts/raw/master/marzban.sh"
    display_panel  8 "s-ui" "https://raw.githubusercontent.com/alireza0/s-ui/master/install.sh)"
    display_panel  9 "Back to Main Menu" ""
    echo ""

    read -p "Enter option number: " panel_choice

    case $panel_choice in
        1)
            install_panel "https://raw.githubusercontent.com/hossinasaadi/x-ui/master/install.sh"

            echo "🟩 panel installed successfully."
            sleep 2
            ;;
        2)
            install_panel "https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh"
            echo "🟩 panel installed successfully."
            sleep 2
            ;;
        3)
            install_panel "https://raw.githubusercontent.com/hiddify/hiddify-config/main/common/download_install.sh"
            echo "🟩 panel installed successfully."
            sleep 2
            ;;
        4)
            install_panel "https://raw.githubusercontent.com/alireza0/x-ui/master/install.sh"
            echo "🟩 panel installed successfully."
            sleep 2
            ;;
        5)
            install_panel "https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh"
            echo "🟩 panel installed successfully."
            sleep 2
            ;;
        6)
            install_panel "https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh"
            echo "🟩 panel installed successfully."
            sleep 2
            ;;
        7)
            install_marzban "https://github.com/Gozargah/Marzban-scripts/raw/master/marzban.sh"
            echo "🟩 panel installed successfully."
            sleep 2
            ;;

        8)
            install_panel "https://raw.githubusercontent.com/alireza0/s-ui/master/install.sh)" 

            ;;
        9)
            break
            ;;
        *)
            echo "Invalid panel choice. Please enter a number between  1 and  8."
            ;;
    esac
done

echo -e "Press ${RED}ENTER${NC} to continue"
read -s -n  1
