#!/bin/bash
# Function to add the iptables commands to crontab
             RED='\033[0;31m'
            GREEN='\033[0;32m'
            YELLOW='\033[1;33m'
            BLUE='\033[0;34m'
            MAGENTA='\033[0;35m'
            CYAN='\033[0;36m'
            GRAY='\033[0;37m'
            NC='\033[0m' # No Color
            while true; do
             clear
            # show options to user
            echo -e "${YELLOW}1.${NC} ${YELLOW}Install iptables${NC}"
            echo -e "${YELLOW}2.${NC} ${NC}Display forwarding table${NC}"
            echo -e "${YELLOW}3.${NC} ${GREEN}Set up a tunnel${NC}"
            echo -e "${YELLOW}4.${NC} ${RED}Delete a tunnel${NC}"
            echo -e "${YELLOW}5.${NC} ${NC}1.${NC}Add commands to crontab"
            echo -e "${RED}6.${NC} ${BLUE}Back to main menu${NC}"
            echo " "
            echo "Please choose an option:"
            # read user input
            read choice
            # run appropriate function based on user choice
             case $choice in
                1)
                        sudo apt-get update
                        sudo apt-get install iptables
                        echo -e "Press ${RED}ENTER${NC} to continue"
                        read -s -n 1
                        ;;
                2)
                        # Add code to display forwarding table|
                         iptables -L -n -t nat
                         ;;
                3)
                        echo "Please enter the Iran IP for the tunnel:"
                        read iran_ip
                        echo "Please enter the Kharej IP for the tunnel:"
                        read kharej_ip
                        echo "Please enter the SSH port (default is 22):"
                        read ssh_port
                        sudo sysctl net.ipv4.ip_forward=1
                        sudo iptables -t nat -A PREROUTING -p tcp -d "$iran_ip" --dport $ssh_port -j DNAT --to-destination "$iran_ip"
                        sudo iptables -t nat -A PREROUTING -j DNAT -d "$iran_ip" --to-destination "$kharej_ip"
                        sudo iptables -t nat -A POSTROUTING -j MASQUERADE
                        echo "Do you want to add the commands to crontab for automatic execution on server reboot? (y/n)"
                        read add_to_crontab_choice
                        if [ "$add_to_crontab_choice" == "y" ] || [ "$add_to_crontab_choice" == "Y" ]; then
                        (crontab -l ; echo "@reboot sudo sysctl net.ipv4.ip_forward=1 && sudo iptables -t nat -A PREROUTING -p tcp --dport $ssh_port -j DNAT --to-destination \"$iran_ip\" && sudo iptables -t nat -A PREROUTING -j DNAT --to-destination \"$kharej_ip\" && sudo iptables -t nat -A POSTROUTING -j MASQUERADE") | crontab -
                        echo "The iptables commands have been added to the crontab for automatic execution on server reboot."
                        fi
                        echo -e "Press ${RED}ENTER${NC} to continue"
                        read -s -n 1
                        ;;
                4)
                        echo "Please enter the Iran IP for the tunnel to delete:"
                        read iran_ip
                        echo "Please enter the Kharej IP for the tunnel to delete:"
                        read kharej_ip
                        echo "Please enter the SSH port (default is 22):"
                        read ssh_port
                        sudo sysctl net.ipv4.ip_forward=1
                        sudo iptables -t nat -D PREROUTING -p tcp --dport $ssh_port -j DNAT --to-destination "$iran_ip"
                        sudo iptables -t nat -D PREROUTING -j DNAT --to-destination "$kharej_ip"
                        sudo iptables -t nat -D POSTROUTING -j MASQUERADE
                        echo -e "Press ${RED}ENTER${NC} to continue"
                        read -s -n 1
                        ;;
                5)
                        (crontab -l ; echo "@reboot sudo sysctl net.ipv4.ip_forward=1 && sudo iptables -t nat -A PREROUTING -p tcp --dport $ssh_port -j DNAT --to-destination \"$iran_ip\" && sudo iptables -t nat -A PREROUTING -j DNAT --to-destination \"$kharej_ip\" && sudo iptables -t nat -A POSTROUTING -j MASQUERADE") | crontab -
                        echo "The iptables commands have been added to the crontab for automatic execution on server reboot."
                        echo -e "Press ${RED}ENTER${NC} to continue"
                        read -s -n 1
                        ;;
                6)
                        break
                        ;;
                *)
                        echo "Invalid choice"
                        ;;
                    esac
                 done
                 
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;