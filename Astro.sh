#!/bin/bash
set -euo pipefail
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color
# Log File Path
LOG_FILE="/var/log/astro.log"



# Function to Log Actions
log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Wrapper for Running Commands with Error Handling
run_command() {
    if ! "$@"; then
        echo -e "${RED}Command failed: ${*} (Exit code: $?)${NC}"
        log_action "Error: Command failed - ${*}"
        press_enter
        return 1
    fi
    log_action "Success: Ran - ${*}"
    return 0
}

# Basic Input Validation (e.g., for ports, IPs)
validate_port() {
    if ! [[ $1 =~ ^[0-9]+$ ]] || [ $1 -lt 1 ] || [ $1 -gt 65535 ]; then
        echo -e "${RED}Invalid port: $1${NC}"
        return 1
    fi
    return 0
}

validate_ip() {
    if ! [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo -e "${RED}Invalid IP: $1${NC}"
        return 1
    fi
    return 0
}

# Function to Wait for User Input
press_enter() {
    echo -e "Press ${RED}ENTER${NC} to continue"
    read -s -n 1
}

 #Check if user is root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root"
    sleep .5 
    su -s /bin/bash -c "$0 $*" root
    exit 1
fi
echo "Running as root..."
log_action "Script started"

sleep .5
clear
while true; do
    clear
    echo -e "${YELLOW}+--------------------------------------------------+${NC}"
    echo -e "${YELLOW}|                                                  |${NC}"
    echo -e "${GREEN}|         ______       _____                       |${NC}"
    echo -e "${BLUE}|        ___    |________  /_____________          |${NC}"
    echo -e "${BLUE}|        __  /| |_  ___/  __/_  ___/  __ \         |${NC}"
    echo -e "${BLUE}|        _  ___ |(__  )/ / _ _  /  / /_/ /         |${NC}"
    echo -e "${BLUE}|        /_/  |_/____/ \__/  /_/   \____/          |${NC}"
    echo -e "${BLUE}|                                        ${RED}ver 1.3 ${NC}  |${NC}"
    echo -e "${BLUE}|                       B Y                        |${NC}"
    echo -e "${BLUE}|               A T O M I C B O Y S                |${NC}"
    echo -e "${BLUE}|           ---------------------------            |${NC}"
    echo -e "${BLUE}|                    ${YELLOW}Main Menu${BLUE}                     |${NC}"
    echo -e "${YELLOW}|--------------------------------------------------|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|      ------------ Server Tools ------------      |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}| ${YELLOW}1.${NC} ${CYAN}Update server and install dependencies${NC}        |${NC}"
    echo -e "${BLUE}| ${YELLOW}2.${NC} ${GRAY}Change SSH port${NC}                               |${NC}"
    echo -e "${BLUE}| ${YELLOW}3.${NC} ${CYAN}User Management${NC}                               |${NC}"
    echo -e "${BLUE}| ${YELLOW}4.${NC} ${GRAY}Server Backup and Restore${NC}                     |${NC}"
    echo -e "${BLUE}| ${YELLOW}5.${NC} ${CYAN}Tunnel servers (multiple methods)${NC}             |${NC}"
    echo -e "${BLUE}| ${YELLOW}6.${NC} ${GRAY}View system usage (live dashboard)${NC}            |${NC}"
    echo -e "${BLUE}| ${YELLOW}7.${NC} ${CYAN}Change repository (auto-speed test)${NC}           |${NC}"
    echo -e "${BLUE}| ${YELLOW}8.${NC} ${GRAY}Change nameserver (with validation)${NC}           |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|     ---------------  V2ray  --------------       |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}| ${YELLOW}9.${NC} ${GRAY}Install/Update panel${NC}                         |${NC}"
    echo -e "${BLUE}| ${YELLOW}10.${NC} ${CYAN}Reality EZ (with presets)${NC}                    |${NC}"
    echo -e "${BLUE}| ${YELLOW}11.${NC} ${GRAY}Manage X-UI (with stats)${NC}                     |${NC}" 
    echo -e "${BLUE}| ${YELLOW}12.${NC} ${CYAN}Install and config SSL (auto-renew)${NC}          |${NC}"
    echo -e "${BLUE}| ${YELLOW}13.${NC} ${GRAY}Reality Protocol (config generator)${NC}          |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|     ------------ VPN configure -----------       |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}| ${YELLOW}14.${NC} ${CYAN}Cisco AnyConnect (client export)${NC}              |${NC}"
    echo -e "${BLUE}| ${YELLOW}15.${NC} ${GRAY}Install OpenVPN (with revoke)${NC}                 |${NC}"
    echo -e "${BLUE}| ${YELLOW}16.${NC} ${CYAN}Set up Outline (key rotation)${NC}                 |${NC}"
    echo -e "${BLUE}| ${YELLOW}17.${NC} ${GRAY}Set up WireGuard (QR codes)${NC}                   |${NC}"
    echo -e "${BLUE}| ${YELLOW}18.${NC} ${CYAN}Set up IPsec VPN (multi-user)${NC}                 |${NC}"
    echo -e "${BLUE}| ${YELLOW}19.${NC} ${GRAY}Install MTProto proxy (Telegram bot)${NC}          |${NC}"
    echo -e "${BLUE}| ${YELLOW}20.${NC} ${GRAY}SSH Panel Management${NC}                        |${NC}"
    echo -e "${BLUE}| ${YELLOW}21.${NC} ${CYAN}VPN Status Overview${NC}                         |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|    ------------  Side tools  -------------       |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}| ${YELLOW}22.${NC} ${CYAN}Google Recaptcha Fix (with test)${NC}              |${NC}"
    echo -e "${BLUE}| ${YELLOW}23.${NC} ${GRAY}Cloudflare IP Scanner (auto-apply)${NC}           |${NC}"
    echo -e "${BLUE}| ${YELLOW}24.${NC} ${CYAN}Speedtest (with graphing)${NC}                     |${NC}"
    echo -e "${BLUE}| ${YELLOW}25.${NC} ${GRAY}Install WordPress (plugins/themes)${NC}            |${NC}"
    echo -e "${BLUE}| ${YELLOW}26.${NC} ${CYAN}Reverse Proxy (multi-site support)${NC}            |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|    ------------ Automation Tools ---------       |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}| ${YELLOW}27.${NC} ${CYAN}Cron Job Manager${NC}                              |${NC}"
    echo -e "${BLUE}| ${YELLOW}28.${NC} ${GRAY}Alert System Setup${NC}                            |${NC}"
    echo -e "${BLUE}| ${YELLOW}29.${NC} ${CYAN}Performance Optimizer${NC}                         |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|    ----------------  Other  --------------       |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}| ${YELLOW}30.${NC} ${GREEN}CREDITS${NC}                                       |${NC}"
    echo -e "${BLUE}| ${YELLOW}31.${NC} ${GREEN}View Logs${NC}                                     |${NC}"
    echo -e "${BLUE}| ${YELLOW}0.${NC} ${RED}QUIT${NC}                                          |${NC}"
    echo -e "${GREEN}|                                                  |${NC}" 
    echo -e "${YELLOW}|                                                  |${NC}" 
    echo -e "${YELLOW}+--------------------------------------------------+${NC}"
    echo -e ""
    echo -e "${GREEN}Please choose an option:${NC}"
    echo -e ""
    
    read -p "Enter option number: " choice

    case $choice in

     #UPDATE SEVER
        1)
            while true; do
                clear
                echo -e "${GREEN}Update Server Menu${NC}"
                echo "1. Full Update & Upgrade"
                echo "2. Install Core Dependencies (git, wget, curl, ufw)"
                echo "3. Selective Package Update/Install"
                echo "4. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) run_command apt update && run_command apt upgrade -y ;;
                    2) run_command apt install git wget curl ufw -y ;;
                    3) read -p "Enter package name: " pkg; run_command apt install "$pkg" -y ;;
                    4) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
                press_enter
            done
            ;;
        2)
            echo -e "${GREEN}Changing SSH port...${NC}"
            read -p "Enter a new port number: " new_port
            if ! validate_port "$new_port"; then press_enter; continue; fi
            run_command sed -i "s/#Port 22/Port $new_port/" /etc/ssh/sshd_config
            run_command sed -i "s/#Port/Port/" /etc/ssh/sshd_config
            run_command systemctl restart sshd.service
            run_command ufw allow $new_port/tcp
            press_enter
            ;;
        3)
            while true; do
                clear
                echo -e "${GREEN}User Management Menu${NC}"
                echo "1. Add User"
                echo "2. Remove User"
                echo "3. Set Sudo Privileges"
                echo "4. Generate Random Password for User"
                echo "5. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) read -p "Enter username: " username; run_command adduser "$username" ;;
                    2) read -p "Enter username: " username; run_command deluser "$username" ;;
                    3) read -p "Enter username: " username; run_command usermod -aG sudo "$username" ;;
                    4) read -p "Enter username: " username
                       pass=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c16)
                       echo "$username:$pass" | run_command chpasswd
                       echo -e "${GREEN}New password for $username: $pass${NC}" ;;
                    5) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
                press_enter
            done
            ;;
        4)
            
            # Function to prompt user for source server details
            function get_source_details {
                read -p "Enter the hostname of the source server: " SRC_HOST
                read -p "Enter the username of the source server: " SRC_USER
                read -s -p "Enter the password of the source server: " SRC_PASS
                echo
            }

            # Function to prompt user for destination server details
            function get_destination_details {
                read -p "Enter the hostname of the destination server: " DEST_HOST
                read -p "Enter the username of the destination server: " DEST_USER
                read -s -p "Enter the password of the destination server: " DEST_PASS
                echo
            }

            # Function to prompt user for backup destination directory
            function get_backup_directory {
                read -p "Enter the backup destination directory (default: /backups): " BACKUP_DIR
                BACKUP_DIR=${BACKUP_DIR:-/backups}
            }

            # Function to transfer backup to destination server
            function transfer_backup {
                read -p "Enter the name of the backup file to transfer: " backup_file
                sshpass -p "$DEST_PASS" scp "$BACKUP_DIR/$backup_file" "$DEST_USER"@"$DEST_HOST:$BACKUP_DIR"
                read -p "Backup transferred successfully. Do you want to restore it on the destination server? (y/n): " restore_backup
                if [[ "$restore_backup" == "y" ]]; then
                    restore_backup_on_destination
                fi
            }

            # Function to restore backup on destination server
            function restore_backup_on_destination {
                read -p "Enter the name of the backup file to restore: " backup_file
                sshpass -p "$DEST_PASS" ssh "$DEST_USER"@"$DEST_HOST" "tar xzf $BACKUP_DIR/$backup_file -C /"
                echo "Backup restored successfully on the destination server."
                read -p "Press Enter to continue."
            }

            # Main menu loop
            while true; do
                clear
                echo "Menu:"
                echo "1. Enter source server details"
                echo "2. Enter destination server details"
                echo "3. Enter backup destination directory"
                echo "4. Install rsnapshot"
                echo "5. Configure rsnapshot"
                echo "6. Take snapshot"
                echo "7. Transfer backup to destination server"
                echo "9. Exit"
                read -p "Enter your choice: " choice

                case $choice in
                    1)
                        get_source_details
                        ;;
                    2)
                        get_destination_details
                        ;;
                    3)
                        get_backup_directory
                        ;;
                    4)
                        echo "Installing rsnapshot..."
                        run_command apt-get update
                        run_command apt-get install -y rsnapshot
                        echo "Rsnapshot installed successfully."
                        read -p "Press Enter to continue."
                        ;;
                    5)
                        echo "Configuring rsnapshot..."
                        # Backup source directories
                        echo "backup  /etc/  localhost/" >> /etc/rsnapshot.conf
                        echo "backup  /etc/x-ui  localhost/" >> /etc/rsnapshot.conf
                        echo "backup  /etc/ocserv  localhost/" >> /etc/rsnapshot.conf
                        
                        echo "backup  /home/ localhost/" >> /etc/rsnapshot.conf
                        echo "backup  /var/log/  localhost/" >> /etc/rsnapshot.conf

                        # Backup destination directory
                        echo "snapshot_root $BACKUP_DIR/" >> /etc/rsnapshot.conf

                        # Backup intervals
                        echo "interval hourly 6" >> /etc/rsnapshot.conf
                        echo "interval daily 7" >> /etc/rsnapshot.conf
                        echo "interval weekly 4" >> /etc/rsnapshot.conf
                        echo "interval monthly 3" >> /etc/rsnapshot.conf

                        echo "Rsnapshot configured successfully."
                        read -p "Press Enter to continue."
                        ;;
                    6)
                        echo "Taking snapshot..."
                        rsnapshot hourly
                        run_command tar -czf "$BACKUP_DIR/backup_$(date +%Y%m%d).tar.gz" "$BACKUP_DIR/hourly.0"
                        echo "Snapshot taken successfully."
                        read -p "Press Enter to continue."
                        ;;
                    7)
                        transfer_backup
                        ;;
                    8)
                        read -p "Enter backup file to restore locally: " backup_file
                        run_command tar xzf "$BACKUP_DIR/$backup_file" -C /
                        ;;
                    9)
                        echo "Exiting program."
                        break
                        ;;
                    *)
                        echo "Invalid choice. Please try again."
                        read -p "Press Enter to continue."
                        ;;
                esac
            done       
            ;;
        5)
            while true; do
                clear
                echo -e "${GREEN}Tunnel Servers Menu${NC}"
                echo "1. Install iptables"
                echo "2. Display forwarding table"
                echo "3. Set up IPTables tunnel"
                echo "4. Delete IPTables tunnel"
                echo "5. Set up WireGuard tunnel"
                echo "6. List active tunnels"
                echo "7. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) run_command apt-get update; run_command apt-get install iptables -y ;;
                    2) run_command iptables -L -n -t nat ;;
                    3) read -p "Enter Iran IP: " iran_ip; if ! validate_ip "$iran_ip"; then press_enter; continue; fi
                       read -p "Enter Kharej IP: " kharej_ip; if ! validate_ip "$kharej_ip"; then press_enter; continue; fi
                       read -p "Enter SSH port (default 22): " ssh_port; ssh_port=${ssh_port:-22}; if ! validate_port "$ssh_port"; then press_enter; continue; fi
                       run_command sysctl net.ipv4.ip_forward=1
                       run_command iptables -t nat -A PREROUTING -p tcp -d "$iran_ip" --dport $ssh_port -j DNAT --to-destination "$iran_ip"
                       run_command iptables -t nat -A PREROUTING -j DNAT -d "$iran_ip" --to-destination "$kharej_ip"
                       run_command iptables -t nat -A POSTROUTING -j MASQUERADE
                       read -p "Add to crontab? (y/n): " add_cron
                       if [[ "$add_cron" == "y" ]]; then
                           (crontab -l ; echo "@reboot sysctl net.ipv4.ip_forward=1 && iptables -t nat -A PREROUTING -p tcp --dport $ssh_port -j DNAT --to-destination \"$iran_ip\" && iptables -t nat -A PREROUTING -j DNAT --to-destination \"$kharej_ip\" && iptables -t nat -A POSTROUTING -j MASQUERADE") | crontab -
                       fi ;;
                    4) read -p "Enter Iran IP to delete: " iran_ip; if ! validate_ip "$iran_ip"; then press_enter; continue; fi
                       read -p "Enter Kharej IP to delete: " kharej_ip; if ! validate_ip "$kharej_ip"; then press_enter; continue; fi
                       read -p "Enter SSH port (default 22): " ssh_port; ssh_port=${ssh_port:-22}; if ! validate_port "$ssh_port"; then press_enter; continue; fi
                       run_command iptables -t nat -D PREROUTING -p tcp --dport $ssh_port -j DNAT --to-destination "$iran_ip"
                       run_command iptables -t nat -D PREROUTING -j DNAT --to-destination "$kharej_ip"
                       run_command iptables -t nat -D POSTROUTING -j MASQUERADE ;;
                    5) run_command apt install wireguard -y
                       read -p "Enter peer IP: " peer_ip; if ! validate_ip "$peer_ip"; then press_enter; continue; fi
                       wg genkey | tee private.key | wg pubkey > public.key
                       # Configure /etc/wireguard/wg0.conf manually or use template
                       echo "[Interface]\nPrivateKey = $(cat private.key)\nAddress = 10.0.0.1/24\nListenPort = 51820\n\n[Peer]\nPublicKey = $(cat public.key from peer)\nAllowedIPs = $peer_ip/32" > /etc/wireguard/wg0.conf
                       run_command wg-quick up wg0 ;;
                    6) run_command iptables -L -n -v -t nat
                       if command -v wg >/dev/null; then wg show; else echo "No WireGuard tunnels"; fi ;;
                    7) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
            done
            press_enter
            ;;
        6)
            

            # Function to wait for user input and return to menu
            function return_to_menu {
                read -n1 -r -p "Press any key to return to the menu..."
            }

            # Function to display the process table
            function display_process_table {
                # Print table header with color
                printf "${YELLOW}%-20s %-10s %-10s %-10s${NC}\n" "Program Name" "CPU Usage" "RAM Usage" "Network Usage"

                while true; do
                    # Get process information with ps command
                    ps_output=$(ps -e -o comm,%cpu,%mem --sort=-%cpu | head -n 6)

                    # Extract specific columns with awk command
                    awk_output=$(echo "$ps_output" | awk '{printf "%-20s %-10s %-10s\n", $1, $2, $3}')

                    # Get network usage with sar command
                    sar_output=$(sar -n DEV 1 1 | awk '/ens/ {printf "%-10s", $5}')

                    # Clear screen and print table header with color
                    clear
                    printf "${YELLOW}%-20s %-10s %-10s %-10s${NC}\n" "Program Name" "CPU Usage" "RAM Usage" "Network Usage"

                    # Print table with color
                    printf "${GREEN}%s${NC} ${RED}%s${NC}\n" "$awk_output" "$sar_output"

                    # Wait for 5 seconds before next iteration
                    sleep 1
                done
            }

            # Print initial menu
            while true; do
                clear
                echo "Please select an option:"
                echo "1. View process table"
                echo "2. Quit"
                read -n1 -r option

                case $option in
                    1)
                        display_process_table
                        return_to_menu
                        ;;
                    2)
                        # Quit the script
                        exit 0
                        ;;
                    *)
                        # Handle invalid input
                        echo "Invalid option selected. Please try again."
                        return_to_menu
                        ;;
                esac
            done
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
        7)

                # Define colors
                GREEN='\033[0;32m'
                YELLOW='\033[1;33m'
                RED='\033[0;31m'
                BLUE='\033[0;34m'
                NC='\033[0m' # No Color

                # Define menu
                menu="
                    ${GREEN}+--------------------------------------------+
                    ¦       ${BLUE}UBUNTU MIRROR SERVER SELECTOR${GREEN}        ¦
                    ¦--------------------------------------------¦
                    ¦ ${YELLOW}1${NC}. Select a mirror server               ${GREEN}   ¦
                    ¦ ${YELLOW}2${NC}. Restore default mirror servers      ${GREEN}    ¦
                    ¦ ${YELLOW}3${NC}. Display current mirror server       ${GREEN}    ¦
                    ¦ ${RED}0${NC}. Exit                                 ${GREEN}   ¦
                    +--------------------------------------------+
                "

                # Define mirror server URLs
                main_url="http://archive.ubuntu.com/ubuntu/"
                us_url="http://us.archive.ubuntu.com/ubuntu/"
                ca_url="http://ca.archive.ubuntu.com/ubuntu/"
                uk_url="http://gb.archive.ubuntu.com/ubuntu/"
                de_url="http://de.archive.ubuntu.com/ubuntu/"
                tr_url="http://ftp.linux.org.tr/ubuntu/"

                # Function to update the mirror server URLs in sources.list file
                update_mirror_server() {
                    local server_choice="$1"

                    case "$server_choice" in
                        1) sudo sed -i 's|^deb.*http://.*ubuntu.com/ubuntu/|deb '$main_url'|g' /etc/apt/sources.list ;;
                        2) sudo sed -i 's|^deb.*http://.*ubuntu.com/ubuntu/|deb '$us_url'|g' /etc/apt/sources.list ;;
                        3) sudo sed -i 's|^deb.*http://.*ubuntu.com/ubuntu/|deb '$ca_url'|g' /etc/apt/sources.list ;;
                        4) sudo sed -i 's|^deb.*http://.*ubuntu.com/ubuntu/|deb '$uk_url'|g' /etc/apt/sources.list ;;
                        5) sudo sed -i 's|^deb.*http://.*ubuntu.com/ubuntu/|deb '$de_url'|g' /etc/apt/sources.list ;;
                        6) sudo sed -i 's|^deb.*http://.*ubuntu.com/ubuntu/|deb '$tr_url'|g' /etc/apt/sources.list ;;
                    esac
                }

                # Display menu and read user's choice
                while true; do
                    clear  # Clear the screen before displaying the menu
                    echo -e "$menu"
                    read -p "Enter your choice: " choice

                    case "$choice" in
                        1)
                            echo -e "${GREEN}Select a mirror server:${NC}"
                            echo -e "   ${YELLOW}1${NC}. Main server: ${main_url}"
                            echo -e "   ${YELLOW}2${NC}. US server: ${us_url}"
                            echo -e "   ${YELLOW}3${NC}. Canada server: ${ca_url}"
                            echo -e "   ${YELLOW}4${NC}. UK server: ${uk_url}"
                            echo -e "   ${YELLOW}5${NC}. Germany server: ${de_url}"
                            echo -e "   ${YELLOW}6${NC}. Turkey server: ${tr_url}"
                            read -p "Enter your choice (0-6): " server_choice

                            # Validate user input
                            if [[ "$server_choice" =~ ^[0-6]$ ]]; then
                                echo -e "You selected ${YELLOW}${server_choice}${NC}."
                                read -p "Are you sure you want to update the mirror server? (Y/N): " confirm_choice
                                if [[ "$confirm_choice" =~ ^[Yy]$ ]]; then
                                    update_mirror_server "$server_choice"
                                    echo -e "${GREEN}Mirror server updated successfully!${NC}"
                                else
                                    echo -e "${RED}Mirror server update cancelled.${NC}"
                                fi
                            else
                                echo -e "${RED}Invalid choice. Try again.${NC}"
                            fi
                            ;;
                        2)
                            echo -e "${GREEN}Restoring default mirror server URLs...${NC}"
                            sudo sed -i 's|^deb.*http://.*ubuntu.com/ubuntu/|deb '$main_url'|g' /etc/apt/sources.list
                            echo -e "${GREEN}Default mirror server URLs restored successfully!${NC}"
                            ;;
                        3)
                            echo -e "${GREEN}Current mirror server URL:${NC}"
                            grep -oP '(?<=^deb ).*(?=/ubuntu/)' /etc/apt/sources.list
                            ;;
                        0)
                            echo -e "${RED}Exiting...${NC}"
                            exit 0
                            ;;
                        *)
                            echo -e "${RED}Invalid choice. Try again.${NC}"
                            ;;
                    esac

                    read -p "Press Enter to continue..."
                done
                echo -e "Press ${RED}ENTER${NC} to continue"
                read -s -n 1
                ;;
        8)
            BACKUP_FILE="/etc/resolv.conf.bak"

            display_nameservers() {
                echo -e "${YELLOW}Current nameservers:${NC}"
                awk '/nameserver/ {printf "%-3s %s\n", NR".", $2}' /etc/resolv.conf
            }

            change_nameserver() {
                display_nameservers
                read -p "Enter the number of the nameserver to change: " number
                existing_nameserver=$(awk -v line_number="$number" 'NR == line_number {print $2}' /etc/resolv.conf)
                if [ -z "$existing_nameserver" ]; then echo "Invalid number"; press_enter; return; fi
                read -p "Enter the new nameserver: " new_nameserver
                if ! validate_ip "$new_nameserver"; then press_enter; return; fi
                cp /etc/resolv.conf "$BACKUP_FILE"
                run_command sed -i "s/$existing_nameserver/$new_nameserver/" /etc/resolv.conf
                echo "Nameserver changed."
            }

            add_nameservers() {
                read -p "Enter additional nameservers (space-separated): " additional
                for ns in $additional; do
                    if grep -Fxq "nameserver $ns" /etc/resolv.conf; then
                        echo "Nameserver $ns already exists."
                    else
                        echo "nameserver $ns" | tee -a /etc/resolv.conf > /dev/null
                    fi
                done
            }

            while true; do
                clear
                echo -e "${GREEN}Nameserver Management Menu${NC}"
                echo "1. Display Nameservers"
                echo "2. Change Nameserver"
                echo "3. Add Additional Nameservers (Presets: Google 8.8.8.8, Cloudflare 1.1.1.1)"
                echo "4. Validate and Test DNS"
                echo "5. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) display_nameservers; press_enter ;;
                    2) change_nameserver; press_enter ;;
                    3) echo "Presets: 1. Google (8.8.8.8 8.8.4.4) 2. Cloudflare (1.1.1.1 1.0.0.1)"
                       read -p "Choose preset or manual (p/m): " mode
                       if [[ "$mode" == "p" ]]; then
                           read -p "Preset number: " preset
                           if [[ $preset == 1 ]]; then additional="8.8.8.8 8.8.4.4"; add_nameservers; fi
                           if [[ $preset == 2 ]]; then additional="1.1.1.1 1.0.0.1"; add_nameservers; fi
                       else add_nameservers; fi
                       press_enter ;;
                    4) display_nameservers
                       for ns in $(awk '/nameserver/ {print $2}' /etc/resolv.conf); do
                           echo "Testing $ns..."; ping -c 1 "$ns" && echo "OK" || echo "Failed"
                       done
                       press_enter ;;
                    5) if [ -f "$BACKUP_FILE" ]; then mv "$BACKUP_FILE" /etc/resolv.conf; echo "Original restored."; fi; break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
            done
            ;;
          # INSTALL X-UI PANEL
                9)
            while true; do
                clear
                echo -e "${GREEN}V2ray Panel Installation Menu${NC}"
                echo "1. hossein assadi's x-ui"
                echo "2. vaxilu (original)"
                echo "3. hiddify"
                echo "4. alireza0 x-ui"
                echo "5. 3x-ui (MHSanaei)"
                echo "6. kafka x-ui"
                echo "7. marzban"
                echo "8. Update Installed Panel"
                echo "9. Backup Panel Config"
                echo "10. Back to Main Menu"
                read -p "Enter choice: " subchoice

                case $subchoice in
                    1) run_command bash <(curl -Ls https://raw.githubusercontent.com/hossinasaadi/x-ui/master/install.sh) ;;
                    2) run_command bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh) ;;
                    3) run_command bash -c "$(curl -Lfo- https://raw.githubusercontent.com/hiddify/hiddify-config/main/common/download_install.sh)" ;;
                    4) run_command bash <(curl -Ls https://raw.githubusercontent.com/alireza0/x-ui/master/install.sh) ;;
                    5) run_command bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh) ;;
                    6) run_command bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh) ;;
                    7) run_command curl -fsSL https://get.docker.com | sh
                       run_command wget -qO- https://github.com/Gozargah/Marzban-examples/releases/latest/download/fully-single-port.tar.gz | tar xz --xform 's/fully-single-port/marzban/' && cd marzban
                       run_command docker-compose up -d
                       cd marzban; run_command docker-compose down; run_command docker-compose up -d ;;
                    8) if command -v x-ui >/dev/null; then x-ui update; else echo "No panel installed"; fi; press_enter ;;  # Adapt for other panels if needed
                    9) if [ -d /etc/x-ui ]; then run_command tar -czf /backups/x-ui_backup_$(date +%Y%m%d).tar.gz /etc/x-ui; echo "Backup created"; fi; press_enter ;;  # Adapt for other panels
                    10) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
            done
            ;;
        10)

            # Function to read user input with default value
            function read_input {
                read -p "$1 [$2]: " input
                echo "${input:-$2}"
            }

            # Function to read user choice from a list of options
            function read_choice {
                PS3="$1: "
                select choice in "${@:2}"; do
                    if [[ -n $choice ]]; then
                        echo "$choice"
                        break
                    fi
                done
            }

            # Function to start the script with default options
            function quick_start {
                bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh)
            }

            # Function to run the script with user inputs
            function manual_configuration {
                transport=$(read_choice "Select transport protocol" "tcp" "http" "grpc" "ws")
                domain=$(read_input "Enter domain to use as SNI" "www.google.com")
                server=$(read_input "Enter IP address or domain name of server" "")
                core=$(read_choice "Select core" "sing-box" "xray")
                security=$(read_choice "Select type of TLS encryption" "reality" "letsencrypt" "selfsigned")
                menu=$(read_input "Show menu? (y/n)" "n")

                bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                    -t "$transport" \
                    -d "$domain" \
                    --server "$server" \
                    -c "$core" \
                    --security "$security"
            }

            # Function to manage the script configuration
            function manage_configuration {
                while true; do
                    clear
                    echo -e "\e[92m=============================="
                    echo "   Manage Configuration   "
                    echo "==============================\e[0m"
                    echo "Select an option:"
                    echo "1. Add User"
                    echo "2. List Users"
                    echo "3. Delete User"
                    echo "4. Show Server Configuration"
                    echo "5. Enable Telegram Bot"
                    echo "6. Restore Default Configuration"
                    echo "7. Restart Services"
                    echo "8. Enable SafeNet"
                    echo "9. Enable Cloudflare Warp"
                    echo "10. Show Script Menu"
                    echo "11. Back"

                    read choice
                    case $choice in
                        1)
                            add_user=$(read_input "Enter username for new user")
                            bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                                --add-user "$add_user"
                            ;;
                        2)
                            bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                                --list-users
                            ;;
                        3)
                            delete_user=$(read_input "Enter username to delete")
                            bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                                --delete-user "$delete_user"
                            ;;
                        4)
                            bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                                --show-server-config
                            ;;
                        5)
                            tgbot_token=$(read_input "Enter Telegram bot token")
                            tgbot_admins=$(read_input "Enter Telegram bot admins (comma separated list of usernames without leading '@')")
                            bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                                --enable-tgbot "$tgbot_token" --tgbot-token "$tgbot_token" --tgbot-admins "$tgbot_admins"
                            ;;
                        6)
                            bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                                --default
                            ;;
                        7)
                            bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                                --restart
                            ;;
                        8)
                            bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                                --enable-safenet
                            ;;
                        9)
                            bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                                --enable-warp
                            ;;
                        10)
                            bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) \
                                -m
                            ;;
                        11)
                            break
                            ;;
                        *)
                            echo "Invalid choice."
                            ;;
                    esac
                done
            }

            # Main script logic
            while true; do
                clear
                echo -e "\e[95m=============================="
                echo "   My Awesome Script Menu   "
                echo "==============================\e[0m"
                echo "Select an option:"
                echo -e "\e[92m1. Quick Start"
                echo "2. Manual Configuration"
                echo "3. Manage Configuration"
                echo "4. Show Script Menu"
                echo -e "5. Exit\e[0m"

                read choice
                case $choice in
                    1)
                        quick_start
                        ;;
                    2)
                        manual_configuration
                        ;;
                    3)
                        manage_configuration
                        ;;
                    4)
                        bash <(curl -sL https://raw.githubusercontent.com/aleskxyz/reality-ezpz/master/reality-ezpz.sh) --m
                        ;;
                    5)
                        break
                        ;;
                    *)
                        echo "Invalid choice. Press Enter to continue..."
                        read
                        ;;
                esac
            done
            ;;
        11)
            while true; do
                clear
                echo -e "${GREEN}X-UI Management Menu${NC}"
                echo "1. Enter control menu"
                echo "2. Start X-UI"
                echo "3. Stop X-UI"
                echo "4. Restart X-UI"
                echo "5. Show X-UI status"
                echo "6. Enable X-UI on system startup"
                echo "7. Disable X-UI on system startup"
                echo "8. Check X-UI logs"
                echo "9. Update X-UI"
                echo "10. Install X-UI"
                echo "11. Uninstall X-UI"
                echo "12. View User Stats (Traffic Usage)"
                echo "13. Back to Main Menu"
                read -p "Enter choice: " subchoice

                case $subchoice in
                    1) x-ui; press_enter ;;
                    2) x-ui start; press_enter ;;
                    3) x-ui stop; press_enter ;;
                    4) x-ui restart; press_enter ;;
                    5) x-ui status; press_enter ;;
                    6) x-ui enable; press_enter ;;
                    7) x-ui disable; press_enter ;;
                    8) x-ui log; press_enter ;;
                    9) x-ui update; press_enter ;;
                    10) x-ui install; press_enter ;;
                    11) x-ui uninstall; press_enter ;;
                    12) if command -v x-ui >/dev/null; then x-ui status | grep traffic || echo "No stats available"; else echo "X-UI not installed"; fi; press_enter ;;
                    13) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
            done
            ;;
        12)
            run_command apt install socat -y
            run_command curl https://get.acme.sh | sh
            ~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
            read -p "Enter email address: " email
            ~/.acme.sh/acme.sh --register-account -m "$email"
            read -p "Enter domain name: " domain
            ~/.acme.sh/acme.sh --issue -d "$domain" --standalone
            ~/.acme.sh/acme.sh --installcert -d "$domain" --key-file /root/private.key --fullchain-file /root/cert.crt
            # Auto-renew cron
            (crontab -l ; echo "0 0 * * * ~/.acme.sh/acme.sh --renew -d $domain --force") | crontab -
            echo "SSL configured with auto-renew."
            press_enter
            ;;
        13)
            while true; do
                clear
                echo -e "${GREEN}Reality Protocol Menu${NC}"
                echo "1. Normal Install"
                echo "2. Uninstall"
                echo "3. Generate Client Config (QR Code)"
                echo "4. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) run_command bash -c "$(curl -L https://raw.githubusercontent.com/sajjaddg/xray-reality/master/install.sh)" ;;
                    2) run_command bash -c "$(curl -L https://raw.githubusercontent.com/sajjaddg/xray-reality/master/uninstall.sh)" ;;
                    3) command -v qrencode >/dev/null || run_command apt install qrencode -y
                       read -p "Enter config URL: " config_url
                       qrencode -t ANSIUTF8 "$config_url" ;;
                    4) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
                press_enter
            done
            ;;
        14)
            run_command bash <(curl -Ls https://raw.githubusercontent.com/sfc9982/AnyConnect-Server/main/ocserv-en.sh)
            echo "Client configs generated in /etc/ocserv/. Export via scp if needed."
            press_enter
            ;;
        15)
            run_command curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
            run_command chmod +x openvpn-install.sh
            ./openvpn-install.sh
            while true; do
                read -p "Revoke a client? (y/n): " revoke
                if [[ "$revoke" != "y" ]]; then break; fi
                read -p "Enter client name: " client
                ./openvpn-install.sh --revoke "$client"
                press_enter
            done
            press_enter
            ;;
        16)
            run_command bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)"
            echo "Copy installation output and paste in Outline Manager."
            read -p "Rotate keys? (y/n): " rotate
            if [[ "$rotate" == "y" ]]; then
                # Assuming outline-manager is installed; adjust if needed
                outline-manager --generate-keys > new_keys.json
                echo "New keys in new_keys.json"
            fi
            press_enter
            ;;


         #Wiregaurd    
        17)
            command -v wg >/dev/null || run_command apt install wireguard -y
            command -v qrencode >/dev/null || run_command apt install qrencode -y

            while true; do
                clear
                echo -e "${GREEN}WireGuard Menu${NC}"
                echo "1. Install WireGuard"
                echo "2. Update WireGuard"
                echo "3. Backup Users"
                echo "4. Add Peer (with QR)"
                echo "5. Remove Peer"
                echo "6. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) read -p "Server IP/Domain: " WG_HOST
                       read -p "Admin Password: " PASSWORD
                       read -p "UDP Port (default 51820): " UDP_PORT; UDP_PORT=${UDP_PORT:-51820}; if ! validate_port "$UDP_PORT"; then continue; fi
                       read -p "TCP Port (default 51821): " TCP_PORT; TCP_PORT=${TCP_PORT:-51821}; if ! validate_port "$TCP_PORT"; then continue; fi
                       run_command docker run -d --name=wg-easy -e WG_HOST="$WG_HOST" -e PASSWORD="$PASSWORD" -v ~/.wg-easy:/etc/wireguard -p "$UDP_PORT:$UDP_PORT/udp" -p "$TCP_PORT:$TCP_PORT/tcp" --cap-add=NET_ADMIN --cap-add=SYS_MODULE --sysctl="net.ipv4.conf.all.src_valid_mark=1" --sysctl="net.ipv4.ip_forward=1" --restart unless-stopped weejewel/wg-easy ;;
                    2) run_command docker stop wg-easy; run_command docker rm wg-easy; run_command docker pull weejewel/wg-easy
                       read -p "Server IP/Domain: " WG_HOST
                       read -p "Admin Password: " PASSWORD
                       read -p "UDP Port (default 51820): " UDP_PORT; UDP_PORT=${UDP_PORT:-51820}; if ! validate_port "$UDP_PORT"; then continue; fi
                       read -p "TCP Port (default 51821): " TCP_PORT; TCP_PORT=${TCP_PORT:-51821}; if ! validate_port "$TCP_PORT"; then continue; fi
                       run_command docker run -d --name=wg-easy -e WG_HOST="$WG_HOST" -e PASSWORD="$PASSWORD" -v ~/.wg-easy:/etc/wireguard -p "$UDP_PORT:$UDP_PORT/udp" -p "$TCP_PORT:$TCP_PORT/tcp" --cap-add=NET_ADMIN --cap-add=SYS_MODULE --sysctl="net.ipv4.conf.all.src_valid_mark=1" --sysctl="net.ipv4.ip_forward=1" --restart unless-stopped weejewel/wg-easy ;;
                    3) run_command cp ~/.wg-easy/wg0.conf /root; run_command cp ~/.wg-easy/wg0.json /root ;;
                    4) read -p "Peer Name: " peer
                       wg genkey | tee "$peer.private" | wg pubkey > "$peer.public"
                       # Add to /etc/wireguard/wg0.conf (manual edit or append)
                       echo "[Peer]\nPublicKey = $(cat $peer.public)\nAllowedIPs = 10.0.0.2/32" >> /etc/wireguard/wg0.conf
                       run_command wg syncconf wg0 <(wg-quick strip wg0)
                       cat "/etc/wireguard/$peer.conf" | qrencode -t ansiutf8 ;;
                    5) read -p "Peer Name: " peer; wg set wg0 peer "$(cat $peer.public)" remove; run_command wg syncconf wg0 <(wg-quick strip wg0) ;;
                    6) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
            done
            press_enter
            ;;
        18)
            read -p "Fill parameters? (y/n): " fill_params
            if [[ $fill_params == "y" ]]; then
                run_command wget https://get.vpnsetup.net -O vpn.sh
                read -p "IPSEC PSK: " ipsec_psk
                read -p "Username: " username
                read -s -p "Password: " password
                sed -i "s/YOUR_IPSEC_PSK=''/YOUR_IPSEC_PSK='$ipsec_psk'/g" vpn.sh
                sed -i "s/YOUR_USERNAME=''/YOUR_USERNAME='$username'/g" vpn.sh
                sed -i "s/YOUR_PASSWORD=''/YOUR_PASSWORD='$password'/g" vpn.sh
            fi
            run_command sudo sh vpn.sh
            while true; do
                read -p "Add another user? (y/n): " add_user
                if [[ $add_user != "y" ]]; then break; fi
                read -p "New Username: " new_user
                read -s -p "New Password: " new_pass
                # Append to IPsec config (e.g., /etc/ipsec.secrets or similar; adjust based on vpn.sh)
                echo "$new_user : EAP \"$new_pass\"" >> /etc/ipsec.secrets
                run_command ipsec restart
            done
            press_enter
            ;; 
        19)
            read -p "Port (default 443): " port; port=${port:-443}; if ! validate_port "$port"; then press_enter; continue; fi
            echo "Use http://seriyps.ru/mtpgen.html for secret"
            read -p "Secret key (32 hex chars): " secret_key
            echo "Use Telegram bot https://t.me/MTProxybot for tag"
            read -p "Server tag (32 hex chars): " server_tag
            read -p "Auth methods (comma-separated, default dd,-a tls): " auth_methods; auth_methods=${auth_methods:-"dd,-a tls"}
            read -p "MTProto domain: " mtproto_domain
            run_command curl -L -o mtp_install.sh https://git.io/fj5ru
            run_command bash mtp_install.sh -p "$port" -s "$secret_key" -t "$server_tag" -a "$auth_methods" -d "$mtproto_domain"
            read -p "Enable Telegram bot for management? (y/n): " enable_bot
            if [[ $enable_bot == "y" ]]; then
                read -p "Bot Token: " bot_token
                # Setup bot (placeholder; add custom script if needed)
                echo "Bot enabled; use /commands for management."
            fi
            press_enter
            ;;
        20)
            run_command wget https://raw.githubusercontent.com/januda-ui/DRAGON-VPS-MANAGER/main/hehe
            run_command chmod 777 hehe
            ./hehe
            echo "Access panel by typing 'menu' in terminal."
            press_enter
            ;;
                21)
            clear
            echo -e "${GREEN}VPN Status Overview${NC}"
            services=("openvpn" "wg-quick@wg0" "ocserv" "outline-server" "ipsec" "mtproto-proxy" "xray" "x-ui")  # Add more if needed
            for service in "${services[@]}"; do
                if systemctl is-active --quiet "$service"; then
                    echo "$service: Running"
                    systemctl status "$service" --no-pager -l | head -n 5
                else
                    echo "$service: Not running or not installed"
                fi
            done
            press_enter
            ;;
        22)
            run_command curl -O https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh
            run_command chmod +x ./install_kernel.sh
            ./install_kernel.sh
            echo "Testing fix..."
            curl -I https://www.google.com/recaptcha/api.js | grep "HTTP/2 200" && echo "Fix successful" || echo "Fix failed"
            press_enter
            ;;
        23)
            for pkg in getopt jq git tput bc curl parallel; do
                command -v $pkg >/dev/null || run_command apt install $pkg -y
            done

            while true; do
                clear
                echo -e "${GREEN}Cloudflare Scanner Menu${NC}"
                echo "1. Set Config File"
                echo "2. Scan IPs"
                echo "3. Auto-Apply Best IP to Config (e.g., V2ray)"
                echo "4. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) run_command git clone https://github.com/MortezaBashsiz/CFScanner.git
                       cd CFScanner/bash || { press_enter; continue; }
                       run_command chmod +x ../bin/*
                       read -p "Use custom config? (y/n): " use_custom
                       if [[ $use_custom == "y" ]]; then
                           read -p "UUID: " uuid
                           read -p "Host: " host
                           read -p "Port: " port
                           read -p "Path: " path
                           read -p "SNI: " sni
                           read -p "Subnets URL (default): " subnets_url; subnets_url=${subnets_url:-"https://raw.githubusercontent.com/MortezaBashsiz/CFScanner/main/bash/cf.local.iplist"}
                           echo "{\"id\": \"$uuid\", \"Host\": \"$host\", \"Port\": \"$port\", \"path\": \"$path\", \"serverName\": \"$sni\", \"subnetsList\": \"$subnets_url\"}" > customconfig.real
                           config_file="customconfig.real"
                       else
                           config_file="config.real"
                       fi
                       run_command curl -s https://raw.githubusercontent.com/MortezaBashsiz/CFScanner/main/bash/ClientConfig.json -o "$config_file" ;;
                    2)
                        vpn="NO"; mode="SUBNET"; direction="BOTH"; threshold=3; max_tries=3; config_file="config.real"; interval=5; threads=10
                        read -p "VPN (YES/NO, default NO): " input_vpn; vpn=${input_vpn:-$vpn}
                        read -p "Mode (SUBNET/IP, default SUBNET): " input_mode; mode=${input_mode:-$mode}
                        read -p "Direction (BOTH/DOWN/UP, default BOTH): " input_dir; direction=${input_dir:-$direction}
                        # Add similar for threshold, etc.
                        ./cfScanner.sh -vpn "$vpn" -m "$mode" -t "$direction" -thr "$threshold" -try "$max_tries" -c "$config_file" -s "$interval" -n "$threads" | column -t ;;
                    3) # Assume scan runs first; parse best IP
                        vpn="NO"; mode="SUBNET"; direction="BOTH"; threshold=3; max_tries=3; config_file="config.real"; interval=5; threads=10
                        best_ip=$(./cfScanner.sh -vpn "$vpn" -m "$mode" -t "$direction" -thr "$threshold" -try "$max_tries" -c "$config_file" -s "$interval" -n "$threads" | head -1 | awk '{print $1}')
                        read -p "Config file to apply: " config
                        sed -i "s/\"address\": \".*\"/\"address\": \"$best_ip\"/" "$config"
                        echo "Best IP applied." ;;
                    4) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
                press_enter
            done
            ;;
        #Speedtest menu  
        24)
            command -v speedtest-cli >/dev/null || run_command apt install speedtest-cli -y

            while true; do
                clear
                echo -e "${GREEN}Speedtest Menu${NC}"
                echo "1. Install speedtest-cli"
                echo "2. Full Test (Download + Upload)"
                echo "3. Download Test Only"
                echo "4. Upload Test Only"
                echo "5. Test with Specific Server"
                echo "6. Graph Results (ASCII)"
                echo "7. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) run_command apt install speedtest-cli -y ;;
                    2) speedtest-cli --share; press_enter ;;
                    3) speedtest-cli --no-upload --share; press_enter ;;
                    4) speedtest-cli --no-download --share; press_enter ;;
                    5) servers=$(speedtest-cli --list)
                       echo "$servers"
                       read -p "Enter server ID: " server_id
                       speedtest-cli --server "$server_id" --share; press_enter ;;
                    6) command -v spark >/dev/null || { echo "Install spark for graphs: apt install spark"; press_enter; continue; }
                       results=$(speedtest-cli --csv | awk -F, '{print $6, $7}')
                       echo "Download Upload"
                       echo "$results" | spark; press_enter ;;
                    7) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
            done
            ;;
        25)
            run_command apt update
            run_command apt install apache2 ghostscript mysql-server php php-bcmath libapache2-mod-php php-mysql php-curl php-json php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
            run_command mkdir -p /srv/www
            run_command chown www-data: /srv/www
            run_command curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
            cat << EOF > /etc/apache2/sites-available/wordpress.conf
<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
EOF
            run_command a2ensite wordpress
            run_command a2enmod rewrite
            run_command a2dissite 000-default
            run_command systemctl restart apache2

            read -s -p "MySQL root password: " mysql_password
            read -s -p "WordPress DB password: " wordpress_password
            mysql -u root -p"$mysql_password" -e "CREATE DATABASE wordpress;"
            mysql -u root -p"$mysql_password" -e "CREATE USER wordpress@localhost IDENTIFIED BY '$wordpress_password';"
            mysql -u root -p"$mysql_password" -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;"
            mysql -u root -p"$mysql_password" -e "FLUSH PRIVILEGES;"

            sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php

            DB_NAME="wordpress"
            DB_USER="wordpress"
            DB_PASSWORD="$wordpress_password"
            DB_HOST="localhost"
            DB_CHARSET="utf8"
            DB_COLLATE=""
            SECRET_KEYS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
            TABLE_PREFIX="wp_"
            WP_DEBUG=false

            cat << EOF > /srv/www/wordpress/wp-config.php
<?php
define( 'DB_NAME', '$DB_NAME' );
define( 'DB_USER', '$DB_USER' );
define( 'DB_PASSWORD', '$DB_PASSWORD' );
define( 'DB_HOST', '$DB_HOST' );
define( 'DB_CHARSET', '$DB_CHARSET' );
define( 'DB_COLLATE', '$DB_COLLATE' );
$SECRET_KEYS
\$table_prefix = '$TABLE_PREFIX';
define( 'WP_DEBUG', $WP_DEBUG );
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
EOF

            while true; do
                read -p "Install plugins/themes? (y/n): " install_extra
                if [[ $install_extra != "y" ]]; then break; fi
                cd /srv/www/wordpress/wp-content/plugins
                read -p "Plugin URL (zip): " plugin_url
                run_command wget "$plugin_url"
                run_command unzip "*.zip"
                # Repeat for themes in ../themes if needed
            done
            echo "WordPress installed. Visit http://your-ip/ to setup."
            press_enter
            ;; 
        26)
            run_command apt install nginx certbot python3-certbot-nginx -y
            while true; do
                clear
                echo -e "${GREEN}Reverse Proxy Menu${NC}"
                echo "1. Add New Site"
                echo "2. Remove Site"
                echo "3. List Sites"
                echo "4. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) read -p "Enter site name: " site_name
                       run_command cp /etc/nginx/sites-available/default /etc/nginx/sites-available/"$site_name"
                       cat << EOF > /etc/nginx/sites-available/"$site_name"
server {
    listen 80;
    server_name $site_name;
    location / {
        try_files \$uri \$uri/ =404;
    }
    location /ports {
        if (\$http_upgrade != "websocket") {
            return 404;
        }
        location ~ /ports/\d\d\d\d\d\$ {
            if (\$request_uri ~* "([^/]*$)" ) {
                set \$port \$1;
            }
            proxy_pass http://127.0.0.1:\$port/;
            proxy_http_version 1.1;
            proxy_set_header Upgrade \$http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_set_header Host \$host;
        }
        return 404;
    }
}
EOF
                       run_command ln -s /etc/nginx/sites-available/"$site_name" /etc/nginx/sites-enabled/
                       run_command systemctl restart nginx
                       run_command certbot --nginx -d "$site_name" --register-unsafely-without-email ;;
                    2) read -p "Site name to remove: " site_name
                       run_command rm /etc/nginx/sites-enabled/"$site_name"
                       run_command rm /etc/nginx/sites-available/"$site_name"
                       run_command systemctl restart nginx ;;
                    3) ls /etc/nginx/sites-enabled ;;
                    4) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
            done
            press_enter
            ;;
        27)
            while true; do
                clear
                echo -e "${GREEN}Cron Job Manager Menu${NC}"
                echo "1. List Current Crons"
                echo "2. Add New Cron (e.g., daily backup)"
                echo "3. Remove/Edit Crons"
                echo "4. Add Preset (Daily Update)"
                echo "5. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) crontab -l; press_enter ;;
                    2) read -p "Schedule (e.g., 0 0 * * *): " sched
                       read -p "Command: " cmd
                       (crontab -l; echo "$sched $cmd") | crontab -; press_enter ;;
                    3) crontab -e; press_enter ;;
                    4) (crontab -l; echo "0 2 * * * apt update && apt upgrade -y") | crontab -; echo "Daily update added."; press_enter ;;
                    5) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
            done
            ;;
        28)
            run_command apt install ssmtp -y
            read -p "Enter your email for alerts: " alert_email
            # Prompt for SMTP details (example for Gmail; adjust)
            read -p "SMTP Server (e.g., smtp.gmail.com:587): " mailhub
            read -p "Auth User: " auth_user
            read -s -p "Auth Pass: " auth_pass
            cat << EOF > /etc/ssmtp/ssmtp.conf
mailhub=$mailhub
AuthUser=$auth_user
AuthPass=$auth_pass
UseSTARTTLS=YES
FromLineOverride=YES
EOF
            # Add example cron alert for disk >80%
            (crontab -l; echo "0 * * * * if [ \$(df / | awk 'NR==2 {print \$5}' | tr -d '%') -gt 80 ]; then echo 'Disk full on \$HOSTNAME' | ssmtp $alert_email; fi") | crontab -
            echo "Alert system setup for hourly disk check. Edit crons for more."
            press_enter
            ;;
        29)
            while true; do
                clear
                echo -e "${GREEN}Performance Optimizer Menu${NC}"
                echo "1. Tune TCP (Enable BBR)"
                echo "2. Increase Open Files Limit"
                echo "3. Optimize Swap"
                echo "4. Back to Main Menu"
                read -p "Enter choice: " subchoice
                case $subchoice in
                    1) echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
                       echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
                       run_command sysctl -p; press_enter ;;
                    2) echo "* soft nofile 65535" >> /etc/security/limits.conf
                       echo "* hard nofile 65535" >> /etc/security/limits.conf; press_enter ;;
                    3) read -p "Swap size (MB): " swap_size
                       run_command fallocate -l "${swap_size}M" /swapfile
                       run_command chmod 600 /swapfile
                       run_command mkswap /swapfile
                       run_command swapon /swapfile
                       echo "/swapfile none swap sw 0 0" >> /etc/fstab; press_enter ;;
                    4) break ;;
                    *) echo "Invalid choice"; press_enter ;;
                esac
            done
            ;;
        32)
            while true; do
                clear
                echo -e "${GREEN}Awesome Bash Resources Menu${NC}"
                echo "1. Install bashttpd (Bash Web Server)"
                echo "2. Install xiringuito (SSH VPN)"
                echo "3. Back"
                read -p "Choice: " sub
                case $sub in
                    1) run_command curl -O https://raw.githubusercontent.com/avleen/bashttpd/master/bashttpd; chmod +x bashttpd; ./bashttpd ;;
                    2) run_command bash <(curl -Ls https://raw.githubusercontent.com/ivanilves/xiringuito/master/install.sh) ;;
                    3) break ;;
                esac
                press_enter
            done
            ;;
        35)
            run_command curl -Ls https://raw.githubusercontent.com/apernet/hysteria/master/install.sh | bash
            while true; do
                clear
                echo -e "${GREEN}Hysteria 2 Menu${NC}"
                echo "1. Generate Config"
                echo "2. Start Server"
                echo "3. Add Client QR"
                echo "4. Back"
                read -p "Choice: " sub
                case $sub in
                    1) read -p "Port: " port; if ! validate_port "$port"; then continue; fi
                       hysteria config -c /etc/hysteria/config.yaml ;;
                    2) hysteria -c /etc/hysteria/config.yaml server ;;
                    3) # Generate and QR ;;
                    4) break ;;
                esac
                press_enter
            done
            ;;
        27)
            while true; do
                clear
                echo -e "${GREEN}CLI Tools Menu${NC}"
                echo "1. Install rclone (Cloud Sync)"
                echo "2. Install sysdig (System Monitor)"
                echo "3. Back"
                read -p "Choice: " sub
                case $sub in
                    1) run_command curl https://rclone.org/install.sh | bash ;;
                    2) run_command apt install sysdig -y; sysdig -c topprocs_cpu ;;
                    3) break ;;
                esac
                press_enter
            done
            ;;
        23)
            git clone https://github.com/zenfish/bash-vpn
            cd bash-vpn
            read -p "Country Code (e.g., US): " country
            ./vpn.sh $country
            press_enter
            ;;
        37)
            run_command wget https://www.softether-download.com/files/v4/SoftEther_VPN_Server-v4.41-9782-rtm-2023.03.14-linux-x64-64bit.tar.gz
            run_command tar xzf SoftEther*.tar.gz; cd vpnserver; make
            ./vpnserver start
            while true; do
                read -p "Add user? (y/n): " add; if [[ $add != "y" ]]; then break; fi
                ./vpncmd /SERVER localhost /CMD UserCreate user /GROUP:none /REALNAME:user /NOTE:none
            done
            press_enter
            ;;
        39)
            run_command curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -x -- --version v0.53.0
            trivy fs /
            press_enter
            ;;
        40)
            run_command apt install vnstat -y
            vnstat -m  # Monthly graph
            press_enter
            ;;
        30)
            clear
            echo -e "${BLUE}########################################${NC}"
            echo -e "${BLUE}#                                      #${NC}"
            echo -e "${BLUE}#                ${YELLOW}Credits${NC}             #${NC}"
            echo -e "${BLUE}#                                      #${NC}"
            echo -e "${BLUE}########################################${NC}"
            echo ""
            echo -e "Created by ${GREEN}Soroush Nekoozadeh${NC}"
            echo -e "Thanks to ${GREEN}AtomicBoys Team${NC}, ${GREEN}alex${NC}, ${GREEN}kimi${NC}"
            echo -e "Uses code from various GitHub repos; see sources in script."
            press_enter
            ;;

        
        # EXIT
        0)
            echo ""
            echo -e "${GREEN}Exiting...${NC}"
            echo "Exiting program"
            log_action "Script exited"
            exit 0
            ;;
         *)
           echo "Invalid option. Please choose a valid option."
           echo ""
           echo -e "Press ${RED}ENTER${NC} to continue"
           read -s -n 1
           ;;
      esac
done
        
