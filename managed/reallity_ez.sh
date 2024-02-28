#!/bin/bash
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
                        exit 0
                        ;;
                    *)
                        echo "Invalid choice. Press Enter to continue..."
                        read
                        ;;
                esac
            done

