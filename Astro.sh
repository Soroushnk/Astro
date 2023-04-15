#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color
 Check if user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   sleep .5 
   sudo "$0" "$@"
   exit 1
fi


echo "Running as root..."
sleep .5
clear

while true; do
    clear
    echo -e "${YELLOW}+--------------------------------------------------+${NC}"
    echo -e "${YELLOW}|                                                  |${NC}"
    echo -e "${GREEN}|${GREEN}          ______       _____                      ${GREEN}|${NC}"
    echo -e "${BLUE}|${GREEN}         ___    |________  /_____________         ${BLUE}|${NC}"
    echo -e "${BLUE}|${GREEN}         __  /| |_  ___/  __/_  ___/  __ \        ${BLUE}|${NC}"
    echo -e "${BLUE}|${GREEN}         _  ___ |(__  )/ / _ _  /  / /_/ /        ${BLUE}|${NC}"
    echo -e "${BLUE}|${GREEN}         /_/  |_/____/ \__/  /_/   \____/         ${BLUE}|${NC}"
    echo -e "${BLUE}|                                         ver 1.1  |${NC}"
    echo -e "${BLUE}|${NC}                        B Y                       ${BLUE}|${NC}"
    echo -e "${BLUE}|${NC}                A T O M I C B O Y S               ${BLUE}|${NC}"
    echo -e "${BLUE}|            ---------------------------           |${NC}"
    echo -e "${BLUE}|                      ${GREEN}Main Menu${BLUE}                   |${NC}"
    echo -e "${GREEN}|     ---------------------------------------      |${NC}"
    echo -e "${BLUE}|${YELLOW} 1.${NC} ${CYAN}Update server and install dependences${NC}         ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 2.${NC} ${GRAY}Install curl/socat${NC}                            ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 3.${NC} ${GRAY}Install panel${NC}                                 ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 4.${NC} ${CYAN}Install and config ssl ${NC}                       ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 5.${NC} ${CYAN}Cisco anyconnect${NC}                              ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 6.${NC} ${GRAY}Change SSH port${NC}                               ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 7.${NC} ${GRAY}Google Recapcha Fix${NC}                           ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 8.${NC} ${CYAN}Install Mtproto proxy${NC}                         ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 9.${NC} ${CYAN}Add user (for SSH)${NC}                            ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}10.${NC} ${GRAY}Install OpenVPN${NC}                               ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}11.${NC} ${GRAY}Install and config WordPress${NC}                  ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}12.${NC} ${CYAN}Speedtest${NC}                                     ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}13.${NC} ${CYAN}Tunnel two server using IPtables${NC}              ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}14.${NC} ${GRAY}Cloudflare white IP scanner${NC}                   ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}15.${NC} ${GRAY}Reverse proxy(UNDER development)${NC}              ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}16.${NC} ${CYAN}Set up wiregaurd${NC}                              ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}17.${NC} ${CYAN}Set up Outline${NC}                                ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}18.${NC} ${GRAY}Server Backup${NC}                                 ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}19.${NC} ${GRAY}View system usage${NC}                             ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}20.${NC} ${CYAN}Set up IPsec VPN(L2TP/IKEV2)${NC}                  ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}21.${NC} ${CYAN}Reality Protocol${NC}                             ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}22.${NC} ${GREEN}CREDITS${NC}                                       ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}23.${NC} ${RED}QUIT${NC}                                          ${BLUE}|${NC}"
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
            echo -e "${GREEN}Updating server...${NC}" 
            echo ""
            apt update && apt upgrade -y
            sudo apt install git wget curl ufw  
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
        2)
            echo -e "${GREEN}Installing curl/socat...${NC}"
            echo ""
            apt install curl socat -y
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
                        
        # INSTALL X-UI PANEL
        3)
    
            echo "Please choose a panel to install:"
            echo -e "${YELLOW}1.${NC} ${GRAY}hossein assadi's x-ui${NC}"
            echo -e "${YELLOW}2.${NC} ${GREEN}vaxilu (original)${NC}"
            echo -e "${YELLOW}3.${NC} ${GRAY}hiddify${NC}"
            echo -e "${YELLOW}4.${NC} ${GRAY}alireza0 x-ui${NC}"
            echo -e "${YELLOW}5.${NC} ${GRAY}3x-ui (MHSanaei)${NC}"
            echo -e "${YELLOW}6.${NC} ${GRAY}kafka x-ui${NC}"
            echo -e "${YELLOW}7.${NC} ${GRAY}alireza0 x-ui${NC}"
            echo -e "${YELLOW}8.${NC} ${RED}Back to Main Menu${NC}"
            echo -e""

            read -p "Enter option number: " panel_choice

              case $panel_choice in
              1)
                  echo -e "${GREEN}Installing panel...${NC}"
                  echo ""
                  bash <(curl -Ls https://raw.githubusercontent.com/hossinasaadi/x-ui/master/install.sh)
                  ;;
              2)  
                  echo -e "${GREEN}Installing panel...${NC}"
                  echo ""
                  bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
                  ;;
                
              3) 
                  echo -e "${GREEN}Installing panel...${NC}"
                  echo ""
                  bash -c "$(curl -Lfo- https://raw.githubusercontent.com/hiddify/hiddify-config/main/common/download_install.sh)"
                  ;;
            
            
              4)
                  echo -e "${GREEN}Installing panel...${NC}"
                  echo ""  
                  bash <(curl -Ls https://raw.githubusercontent.com/alireza0/x-ui/master/install.sh)
                  ;;
              5)
                  echo -e "${GREEN}Installing panel...${NC}"
                  echo "" 
                  bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
                  ;;
              6)
                  echo -e "${GREEN}Installing panel...${NC}"
                  echo "" 
                  bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)
                  ;;
              7)
                  
                  echo -e "${GREEN}Installing docker and downloading panel...${NC}"
                  # Download and install Docker
                  curl -fsSL https://get.docker.com | sh

                  # Download and extract the Marzban examples archive
                  wget -qO- https://github.com/Gozargah/Marzban-examples/releases/latest/download/fully-single-port.tar.gz | tar xz --xform 's/fully-single-port/marzban/' && cd marzban

                  # Start the Docker Compose environment
                  docker-compose up -d

                  # Stop and restart the Docker Compose environment
                  cd marzban
                  docker-compose down
                  docker-compose up -d
                  ;;
              8)
                  
                  break
                  ;;
              *)
                  echo "Invalid panel choice"
                  ;;
            esac

            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;  
        # DOWNLOADS ACME
        4)
            echo -e "${GREEN}Installing Acme Script...${NC}"
            echo ""
            curl https://get.acme.sh | sh
            echo ""
            echo -e "${GREEN}Configuring Acme...${NC}"
            echo ""
            sleep 1
            echo "Configuring Acme Script..."
            echo ""
            # GET CERTIFICATE FOR DOMAIN
            ~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
            echo ""
            read -p "Enter email address: " email
            ~/.acme.sh/acme.sh --register-account -m $email
            echo ""
            read -p "Enter domain name: " domain
            ~/.acme.sh/acme.sh --issue -d $domain --standalone
            ~/.acme.sh/acme.sh --installcert -d $domain --key-file /root/private.key --fullchain-file /root/cert.crt
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
            
        #  cisco open connect (oscerv)
        5)
            echo -e "${YELLOW}1.${NC} ${GRAY}Install ocserv${NC}"
            echo -e "${YELLOW}2.${NC} ${GRAY}Run ocserv${NC}"
            echo -e "${YELLOW}3.${NC} ${GRAY}Change ocserv port${NC}"
            echo -e "${YELLOW}4.${NC} ${RED}Back to Main Menu${NC}"
            read -e -p "Enter choice [1-4]: " choice

           case $choice in
             1)
                 wget -N --no-check-certificate https://raw.githubusercontent.com/sfc9982/AnyConnect-Server/main/ocserv-en.sh
                 chmod +x ocserv-en.sh
                 bash ocserv-en.sh
                 ;;
             2)
                 sudo systemctl start ocserv
                 ;;
             3)
                 read -p "Enter new TCP port number: " port
                 sudo sed -i "s/tcp-port = [0-9]*/tcp-port = $port/" /etc/ocserv/ocserv.conf
                 echo "TCP port set to $port"
                 echo -e "Press ${RED}ENTER${NC} to continue"
                 read -s -n 1
                 ;;
             4)
                 break
                 ;;
             *)
                 echo "Invalid choice. Please enter a valid option."
                 ;;
       
             esac
           
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
            
        #CHANGE SSH PORT
        6)
            echo -e "${GREEN}Changing SSH port...${NC}"
            echo ""
            read -p "Enter a new port number: " new_port
            sed -i "s/#Port 22/Port $new_port/" /etc/ssh/sshd_config
            sed -i "s/#Port/Port/" /etc/ssh/sshd_config
            systemctl restart sshd.service
            ufw allow $new_port/tcp
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
            
        # GOOGLE RECAPCHA FIX
        7)  
            echo -e "${GREEN}Fixing Google Recapcha...${NC}"
            echo ""
            curl -O https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh && chmod +x ./install_kernel.sh && ./install_kernel.sh
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
         
        # install Mtproto  
        8)
            # Prompt user for input
            echo "Please enter the following information:"
            read -p "Port number (default is 443): " port
            echo "for secret you you can use http://seriyps.ru/mtpgen.html "
            read -p "Secret key (should be a string of 32 hexadecimal characters): " secret_key
            echo "to get the server tag you should use telegram bot https://t.me/MTProxybot "
            read -p "Server tag (should be a string of 32 hexadecimal characters): " server_tag
            read -p "List of authentication methods - place empty for default - (should be a comma-separated list): " auth_methods
            read -p "MTProto domain (should be a valid domain name): " mtproto_domain

            # Set default values if user input is empty
            port=${port:-443}
            auth_methods=${auth_methods:-"dd,tls"}

            # Download and run MTProto installation script
            curl -L -o mtp_install.sh https://git.io/fj5ru && \
            bash mtp_install.sh -p $port -s $secret_key -t $server_tag -a $auth_methods -d $mtproto_domain
            
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
            
        # Make  user for ssh connection
        9)
            echo -e "${GREEN}Adding user...${NC}"
            echo ""
            read -p "Enter username: " username
            adduser $username
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
            
        # Install OPENVPN
        10)
            echo -e "${GREEN}Installing OpenVPN...${NC}"
            echo ""
            curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
            chmod +x openvpn-install.sh
            ./openvpn-install.sh
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
        
        # Install WordPress and connect to SQL
        11)
            
            echo -e "${GREEN}Installing WordPress and connecting to SQL...${NC}"
            echo ""
            # Update package index and install required packages
            sudo apt update
            sudo apt install apache2 ghostscript mysql-server  php php-bcmath libapache2-mod-php php-mysql php-curl php-json  php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
        
            # install wordpress
            sudo mkdir -p /srv/www
          
            sudo chown www-data: /srv/www
          
            curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
        
        

            # Define the file path and content
            FILE_PATH="/etc/apache2/sites-available/wordpress.conf"
            FILE_CONTENT="<VirtualHost *:80>\n\tDocumentRoot /srv/www/wordpress\n\t<Directory /srv/www/wordpress>\n\t\tOptions FollowSymLinks\n\t\tAllowOverride Limit Options FileInfo\n\t\tDirectoryIndex index.php\n\t\tRequire all granted\n\t</Directory>\n\t<Directory /srv/www/wordpress/wp-content>\n\t\tOptions FollowSymLinks\n\t\tRequire all granted\n\t</Directory>\n</VirtualHost>"

            # Write the file
            echo -e $FILE_CONTENT | sudo tee $FILE_PATH > /dev/null

            # Enable the site
            sudo a2ensite wordpress.conf
          
            sudo a2ensite wordpress

            sudo a2enmod rewrite
          
            sudo a2dissite 000-default
          
          
            # Restart Apache
            sudo systemctl restart apache2

         

            # Prompt the user for their MySQL root password
            echo ""
            read -sp "Enter MySQL root password: " mysql_password
            echo
            read -s -p "Enter your WordPress password: " wordpress_password
            echo

            # Run the SQL commands
            echo "CREATE DATABASE wordpress;" | sudo mysql -u root -p$mysql_password
            echo "CREATE USER wordpress@localhost IDENTIFIED BY '$wordpress_password';" | sudo mysql -u root -p$mysql_password
            echo "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;" | sudo mysql -u root -p$mysql_password
            echo "FLUSH PRIVILEGES;" | sudo mysql -u root -p$mysql_password
            echo "quit" | sudo mysql -u root -p$mysql_password

            sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php



            # Define the database settings
            DB_NAME=wordpress
            DB_USER=wordpress
            DB_PASSWORD="$wordpress_password"
            DB_HOST="localhost"
            DB_CHARSET="utf8"
            DB_COLLATE=""
            
            # Get the secret keys
            SECRET_KEYS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
            
            # Define the table prefix and debugging mode
            TABLE_PREFIX="wp_"
            WP_DEBUG=false
            
            # Define the file path
            FILE_PATH="/srv/www/wordpress/wp-config.php"
            
            # Create the wp-config.php file
            echo "<?php
            /**
             * The base configuration for WordPress
             *
             * The wp-config.php creation script uses this file during the installation.
             * You don't have to use the web site, you can copy this file to 'wp-config.php'
             * and fill in the values.
             *
             * This file contains the following configurations:
             *
             * * Database settings
             * * Secret keys
             * * Database table prefix
             * * ABSPATH
             *
             * @link https://wordpress.org/documentation/article/editing-wp-config-php/
             *
             * @package WordPress
             */
            
            // ** Database settings - You can get this info from your web host ** //
            /** The name of the database for WordPress */
            define( 'DB_NAME', '$DB_NAME' );
            
            /** Database username */
            define( 'DB_USER', '$DB_USER' );
            
            /** Database password */
            define( 'DB_PASSWORD', '$DB_PASSWORD' );
            
            /** Database hostname */
            define( 'DB_HOST', '$DB_HOST' );
            
            /** Database charset to use in creating database tables. */
            define( 'DB_CHARSET', '$DB_CHARSET' );
            
            /** The database collate type. Don't change this if in doubt. */
            define( 'DB_COLLATE', '$DB_COLLATE' );
            
            /**#@+
             * Authentication unique keys and salts.
             *
             * Change these to different unique phrases! You can generate these using
             * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
             *
             * You can change these at any point in time to invalidate all existing cookies.
             * This will force all users to have to log in again.
             *
             * @since 2.6.0
             */
             $SECRET_KEYS
            /**#@-*/
            
            /**
             * WordPress database table prefix.
             *
             * You can have multiple installations in one database if you give each
             * a unique prefix. Only numbers, letters, and underscores please!
             */
            \$table_prefix = '$TABLE_PREFIX';
            
            /**
             * For developers: WordPress debugging mode.
             *
             * Change this to true to enable the display of notices during development.
             * It is strongly recommended that plugin and theme developers use WP_DEBUG
             * in their development environments.
             *
             * For information on other constants that can be used for debugging,
             * visit the documentation.
             *
             * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
             */
            define( 'WP_DEBUG', $WP_DEBUG );
            
            /* Add any custom values between this line and the "stop editing" line. */
            
            
            
            
            /* That's all, stop editing! Happy publishing. */
            
            /** Absolute path to the WordPress directory. */
            if ( ! defined( 'ABSPATH' ) ) {
                define( 'ABSPATH', __DIR__ . '/' );
            }
            
            /** Sets up WordPress vars and included files. */
            require_once ABSPATH . 'wp-settings.php';
            " > "$FILE_PATH"


            echo "New values have been added to the wp-config.php file."
            sleep 1.33
            echo "WordPress has been installed and configured!"
            sleep 1.33
            echo ""
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;

       
            
        #Saaspeedtest menu  
        12) 
        
              while true; do
                  echo ""
                  echo "===================="
                  echo "VPS Speed Test Menu"
                  echo "===================="
                  echo "1. Install speedtest-cli"
                  echo "2. complete test"
                  echo "3. complete test"
                  echo "4. Test Download Speed"
                  echo "5. Test Upload Speed"
                  echo "6. Choose Server and Test"
                  echo "7. Exit"
                  echo ""
                  read -p "Enter your choice: " choice
              
                  case $choice in
                      1)
                          echo "Installing speedtest-cli..."
                          sudo apt-get update
                          sudo apt-get install speedtest-cli -y
                          echo -e "Press ${RED}ENTER${NC} to continue"
                          read -s -n 1
                          ;;
                      2)
                          
                          if ! command -v speedtest-cli &> /dev/null
                          then
                              echo "speedtest-cli not found, installing..."
                              sudo apt-get install speedtest-cli -y
                          fi
                            # Ask the user whether to test by byte or bit
                            read -p "Do you want to test by byte? [y/n]: " byte_test
                            
                            # Ask the user whether to use HTTP or HTTPS
                            read -p "Do you want to use HTTPS? [y/n]: " use_https
                            
                            # Ask the user whether to run a download test, an upload test, or both
                            read -p "Do you want to run a download test, an upload test, or both? [d/u/b]: " test_type
                            
                            # Determine the appropriate command based on the user's input
                            if [[ $byte_test =~ ^[Yy]$ && $use_https =~ ^[Yy]$ && $test_type =~ ^[Dd]$ ]]; then
                                speedtest-cli --secure --bytes --no-upload --share
                            elif [[ $byte_test =~ ^[Yy]$ && $use_https =~ ^[Yy]$ && $test_type =~ ^[Uu]$ ]]; then
                                speedtest-cli --secure --bytes --no-download --share
                            elif [[ $byte_test =~ ^[Yy]$ && $use_https =~ ^[Yy]$ && $test_type =~ ^[Bb]$ ]]; then
                                speedtest-cli --secure --bytes --share
                            elif [[ $byte_test =~ ^[Yy]$ && $test_type =~ ^[Dd]$ ]]; then
                                speedtest-cli --bytes --no-upload --share
                            elif [[ $byte_test =~ ^[Yy]$ && $test_type =~ ^[Uu]$ ]]; then
                                speedtest-cli --bytes --no-download --share
                            elif [[ $byte_test =~ ^[Yy]$ && $test_type =~ ^[Bb]$ ]]; then
                                speedtest-cli --bytes --share
                            elif [[ $use_https =~ ^[Yy]$ && $test_type =~ ^[Dd]$ ]]; then
                                speedtest-cli --secure --no-bytes --no-upload --share
                            elif [[ $use_https =~ ^[Yy]$ && $test_type =~ ^[Uu]$ ]]; then
                                speedtest-cli --secure --no-bytes --no-download --share
                            elif [[ $use_https =~ ^[Yy]$ && $test_type =~ ^[Bb]$ ]]; then
                                speedtest-cli --secure --no-bytes --share
                            elif [[ $test_type =~ ^[Dd]$ ]]; then
                                speedtest-cli --no-bytes --no-upload --share
                            elif [[ $test_type =~ ^[Uu]$ ]]; then
                                speedtest-cli --no-bytes --no-download --share
                            elif [[ $test_type =~ ^[Bb]$ ]]; then
                                speedtest-cli --no-bytes --share
                            else
                                speedtest-cli --no-bytes --share
                            fi
                          echo -e "Press ${RED}ENTER${NC} to continue"
                          read -s -n 1
                      
                          ;;
                      3)
                          if ! command -v speedtest-cli &> /dev/null
                          then
                              echo "speedtest-cli not found, installing..."
                              sudo apt-get install speedtest-cli -y
                          fi
                          echo "Testing download and upload speed..."
                          speedtest-cli
                          echo -e "Press ${RED}ENTER${NC} to continue"
                          read -s -n 1
                          ;;
                      4)
                          if ! command -v speedtest-cli &> /dev/null
                          then
                              echo "speedtest-cli not found, installing..."
                              sudo apt-get install speedtest-cli -y
                          fi
                          echo "Testing download speed..."
                          speedtest-cli --no-upload
                          echo -e "Press ${RED}ENTER${NC} to continue"
                          read -s -n 1
                          ;;
                      5)
                          if ! command -v speedtest-cli &> /dev/null
                          then
                              echo "speedtest-cli not found, installing..."
                              sudo apt-get install speedtest-cli -y
                          fi
                          
                          echo "Testing upload speed..."
                          speedtest-cli --no-download
                          echo -e "Press ${RED}ENTER${NC} to continue"
                          read -s -n 1
                          ;;
                      6)
                          

                          # Install speedtest-cli if not already installed
                          if ! command -v speedtest-cli &> /dev/null
                          then
                              echo "speedtest-cli not found, installing..."
                              sudo apt-get install speedtest-cli -y
                          fi
                          
                          # Fetch server list and create a menu
                          servers=$(speedtest-cli --list | awk -F') ' '/^[0-9]+\)/{print $1") " $2}' | sed 's/^[ \t]*//;s/[ \t]*$//')
                          echo "Available servers:"
                          echo "$servers"
                          
                          # Prompt user to select a server
                          read -p "Enter server number: " server_number
                          server=$(echo "$servers" | grep "^$server_number)" | cut -d " " -f 2-)
                          if [ -z "$server" ]
                          then
                              echo "Invalid server number"
                              exit 1
                          fi
                          
                          # Run speedtest with selected server
                          echo "Testing speed with server: $server"
                          speedtest-cli --server "$server_number"
                          echo -e "Press ${RED}ENTER${NC} to continue"
                          read -s -n 1
                          ;;
                      7)
                          echo "Exiting..."
                          break
                          ;;
                      *)
                          echo "Invalid choice. Please try again."
                          ;;
                  esac
              done
             ;;
             
        #Iptables
        13)
           while true; do 
            # show options to user
            echo "Please choose an option:"
            echo "1. Install iptables"
            echo "2. Display forwarding table"
            echo "3. Set up a tunnel"
            echo "4. delete  a tunnel"
            echo "5. back to main menu"
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
                    
                    ;;
                3)
                    echo "Please enter the Iran IP for the tunnel:"
                    read iran_ip
                    echo "Please enter the Kharej IP for the tunnel:"
                    read kharej_ip
            
                    sudo sysctl net.ipv4.ip_forward=1
                    sudo iptables -t nat -A PREROUTING -p tcp --dport 22 -j DNAT --to-destination "$iran_ip"
                    sudo iptables -t nat -A PREROUTING -j DNAT --to-destination "$kharej_ip"
                    sudo iptables -t nat -A POSTROUTING -j MASQUERADE
                    echo -e "Press ${RED}ENTER${NC} to continue"
                    read -s -n 1
                    ;;
                4)
                    echo "Please enter the Iran IP for the tunnel  to delete:"
                    read iran_ip
                    echo "Please enter the Kharej IP for the tunnel to delete:"
                    read kharej_ip
            
                    sudo sysctl net.ipv4.ip_forward=1
                    sudo iptables -t nat -D PREROUTING -p tcp --dport 22 -j DNAT --to-destination "$iran_ip"
                    sudo iptables -t nat -D PREROUTING -j DNAT --to-destination "$kharej_ip"
                    sudo iptables -t nat -D POSTROUTING -j MASQUERADE
                    echo -e "Press ${RED}ENTER${NC} to continue"
                    read -s -n 1
                    ;;
                    
                5)
                
                    break
                    ;;    
                *)
                    echo "Invalid choice"
                    ;;
            esac
          done
          ;;
        #CFSscanner
        14)
           
           
             while true; do
                 echo "---------------------"
                 echo "CFSanner Menu Options:"
                 echo "---------------------"
                 echo "1. Install Dependencies"
                 echo "2. Set Config File"
                 echo "3. Scan"
                 echo "4. Exit"
             
                 read -p "Please select an option [1-4]: " choice
             
                 case $choice in
                     1)
                         echo "Installing dependencies..."
                         
                            if ! command -v getopt &> /dev/null || ! command -v jq &> /dev/null || ! command -v git &> /dev/null || ! command -v tput &> /dev/null || ! command -v bc &> /dev/null || ! command -v curl &> /dev/null || [[ $(parallel --version | awk '{print $4}') -lt 20220515 ]]
                           then
                               # Prompt the user to install any missing packages
                               echo "The following packages are missing or outdated:"
                               if ! command -v getopt &> /dev/null; then echo " - getopt"; fi
                               if ! command -v jq &> /dev/null; then echo " - jq"; fi
                               if ! command -v git &> /dev/null; then echo " - git"; fi
                               if ! command -v tput &> /dev/null; then echo " - tput"; fi
                               if ! command -v bc &> /dev/null; then echo " - bc"; fi
                               if ! command -v curl &> /dev/null; then echo " - curl"; fi
                               if ! command -v parallel &> /dev/null || [[ $(parallel --version | awk '{print $4}') -lt 20220515 ]]; then echo " - parallel (version > 20220515)"; fi
                               echo "Do you want to install them? (y/n)"
                               read answer
                               if [ "$answer" = "y" ]; then
                                   sudo apt-get install $(if ! command -v getopt &> /dev/null; then echo "getopt "; fi) \
                                   $(if ! command -v jq &> /dev/null; then echo "jq "; fi) \
                                   $(if ! command -v git &> /dev/null; then echo "git "; fi) \
                                   $(if ! command -v tput &> /dev/null; then echo "ncurses-bin "; fi) \
                                   $(if ! command -v bc &> /dev/null; then echo "bc "; fi) \
                                   $(if ! command -v curl &> /dev/null; then echo "curl "; fi) \
                                   $(if ! command -v parallel &> /dev/null || [[ $(parallel --version | awk '{print $4}') -lt 20220515 ]]; then echo "parallel "; fi)
                               fi
                           else
                               echo "All required packages are already installed and up to date."
                           fi
                         echo -e "Press ${RED}ENTER${NC} to continue"
                         read -s -n 1
                         ;;
                     2)
                         echo "Setting config file..."
                         
                           # Clone the CFScanner repository
                           git clone https://github.com/MortezaBashsiz/CFScanner.git
                           
                           # Navigate to the bash directory
                           cd CFScanner/bash
                           
                           # Make the bin files executable
                           chmod +x ../bin/*
                           
                           # Prompt user to use custom config or not
                           read -p "Do you want to use a custom config file? (y/n) " use_custom_config
                           
                           if [ $use_custom_config == "y" ]; then
                               # Ask user for config data and save to customconfig.real file
                               read -p "Enter your UUID: " uuid
                               read -p "Enter the host address: " host
                               read -p "Enter the port: " port
                               read -p "Enter the websocket endpoint: " path
                               read -p "Enter the SNI: " sni
                               read -p "Enter the URL for the subnet list (press Enter for default): " subnets_url
                               
                               # Use default subnet list if no URL is provided
                               if [ -z $subnets_url ]; then
                                   subnets_url="https://raw.githubusercontent.com/MortezaBashsiz/CFScanner/main/bash/cf.local.iplist"
                               fi
                               
                               # Write custom config to file
                               echo "{" > customconfig.real
                               echo "    \"id\": \"$uuid\"," >> customconfig.real
                               echo "    \"Host\": \"$host\"," >> customconfig.real
                               echo "    \"Port\": \"$port\"," >> customconfig.real
                               echo "    \"path\": \"$path\"," >> customconfig.real
                               echo "    \"serverName\": \"$sni\"," >> customconfig.real
                               echo "    \"subnetsList\": \"$subnets_url\"" >> customconfig.real
                               echo "}" >> customconfig.real
                               
                               # Use custom config file
                               config_file="customconfig.real"
                           else
                               # Use default config file
                               config_file="config.real"
                           fi
                           
                           # Download the config file
                           curl -s https://raw.githubusercontent.com/MortezaBashsiz/CFScanner/main/bash/ClientConfig.json -o $config_file
                         echo -e "Press ${RED}ENTER${NC} to continue"
                         read -s -n 1
                         ;;
                     3)
                         echo "Scanning..."
                         

                         # Default values
                         vpn="NO"
                         mode="SUBNET"
                         direction="BOTH"
                         threshold=3
                         max_tries=3
                         config_file="config.ini"
                         interval=5
                         custom_subnet_file=""
                         
                         # Read user inputs
                         read -p "Use VPN connection? [YES/NO] (default: $vpn): " input_vpn
                         if [[ ! -z $input_vpn ]]; then vpn="$input_vpn"; fi
                         
                         read -p "Scan mode? [SUBNET/IP] (default: $mode): " input_mode
                         if [[ ! -z $input_mode ]]; then mode="$input_mode"; fi
                         
                         read -p "Scan direction? [DOWN/UP/BOTH] (default: $direction): " input_direction
                         if [[ ! -z $input_direction ]]; then direction="$input_direction"; fi
                         
                         read -p "Threshold for concurrent connections? (default: $threshold): " input_threshold
                         if [[ ! -z $input_threshold ]]; then threshold="$input_threshold"; fi
                         
                         read -p "Max tries for failed connections? (default: $max_tries): " input_max_tries
                         if [[ ! -z $input_max_tries ]]; then max_tries="$input_max_tries"; fi
                         
                         read -p "Config file? (default: $config_file): " input_config_file
                         if [[ ! -z $input_config_file ]]; then config_file="$input_config_file"; fi
                         
                         read -p "Scan interval (in seconds)? (default: $interval): " input_interval
                         if [[ ! -z $input_interval ]]; then interval="$input_interval"; fi
                         
                         read -p "Number of threads to use? (default: $threads): " input_threads
                         if [[ ! -z $input_threads ]]; then threads="$input_threads"; fi
                         
                         read -p "Custom subnet file (if using mode=IP)? (default: $custom_subnet_file): " input_custom_subnet_file
                         if [[ ! -z $input_custom_subnet_file ]]; then custom_subnet_file="$input_custom_subnet_file"; fi
                         
                         # Run code with the parameters
                         echo "Running code with the following parameters:"
                         echo "-vpn $vpn -m $mode -t $direction -thr $threshold -try $max_tries -c $config_file -s $interval"
                         if [[ ! -z $custom_subnet_file ]]; then echo "-f $custom_subnet_file"; fi
                         
                         # Uncomment the following line to actually run the code with the parameters
                         ./cfScanner.sh -vpn $vpn -m $mode -t $direction -thr $threshold -try $max_tries -c $config_file -s $interval ${custom_subnet_file:+-f "$custom_subnet_file"} | xargs -n10 | column -t -s' ' | awk '{print "\033[32m" $0 "\033[0m"}'
                         echo
                         
                         echo -e "Press ${RED}ENTER${NC} to continue"
                         read -s -n 1
                         ;;
                     4)
                         echo "Exiting..."
                         break
                         ;;
                     *)
                         echo "Invalid option. Please try again."
                         ;;
                 esac
             done

           ;;
           
           
        #reverse proxy    
        15)  
           
           apt install nginx certbot python3-certbot-nginx -y
            
           
           
           read -p "Enter your site name: " site_name
           ln -s /etc/nginx/sites-available/$site_name /etc/nginx/sites-enabled/
           cp /etc/nginx/sites-available/default /etc/nginx/sites-available/YOURSITE.COM
           # Define the file path
            FILE_PATH="/etc/nginx/sites-available/$site_name"
           

            # Read user input
            
            # Set file path
            
            
            # Define content
            CONTENT="#\n# You should look at the following URL's in order to grasp a solid understanding\n# of Nginx configuration files in order to fully unleash the power of Nginx.\n# https://www.nginx.com/resources/wiki/start/\n# https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/\n# https://wiki.debian.org/Nginx/DirectoryStructure\n#\n# In most cases, administrators will remove this file from sites-enabled/ and\n# leave it as reference inside of sites-available where it will continue to be\n# updated by the nginx packaging team.\n#\n# This file will automatically load configuration files provided by other\n# applications, such as Drupal or Wordpress. These applications will be made\n# available underneath a path with that package name, such as /drupal8.\n#\n# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.\n##\n\n# Default server configuration\n#\nserver {\n        listen 80;\n        listen [::]:80;\n\n        # SSL configuration\n        #\n        # listen 443 ssl default_server;\n        # listen [::]:443 ssl default_server;\n        #\n        # Note: You should disable gzip for SSL traffic.\n        # See: https://bugs.debian.org/773332\n        #\n        # Read up on ssl_ciphers to ensure a secure configuration.\n        # See: https://bugs.debian.org/765782\n        #\n        # Self signed certs generated by the ssl-cert package\n        # Don't use them in a production server!\n        #\n        # include snippets/snakeoil.conf;\n\n        root /var/www/html;\n\n        # Add index.php to the list if you are using PHP\n        index index.html index.htm index.nginx-debian.html;\n\n        server_name $site_name;\n\n        location / {\n                # First attempt to serve request as file, then\n                # as directory, then fall back to displaying a 404.\n                try_files \$uri \$uri/ =404;\n        }\n\n    location /ports {\n        if (\$http_upgrade != \"websocket\") {\n            return 404;\n        }\n        location ~ /ports/\d\d\d\d\d\$ {\n            if (\$request_uri ~* \"([^/]*$)\" ) {\n                set \$port \$1;\n            }\n            proxy_redirect off;\n            proxy_pass http://127.0.0.1:\$port/;\n            proxy_http_version 1.1;\n            proxy_set_header Upgrade \$http_upgrade;\n            proxy_set_header Connection \"upgrade\";\n            proxy_set_header Host \$host;\n            proxy_set_header X-Real-IP \$remote_addr;\n            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;\n        }\n        return 404;\n    }\n        # pass PHP scripts to FastCGI server\n        #\n        #location ~ \.php$ {\n        #       include snippets/fastcgi-php.conf;\n        #\n        #       # With php-fpm (or other unix sockets):\n        #       fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;\n        #       # With php-cgi (or other tcp sockets):\n        #       fastcgi_pass 127.0.0.1:9000;\n        #}\n"
            
            # Write content to destination file
            echo -e "$CONTENT" > "$FILE_PATH"

           
            
            ln -s /etc/nginx/sites-available/$site_name /etc/nginx/sites-enabled/
            
            systemctl restart nginx
            
           output=$(certbot --nginx -d $site_name --register-unsafely-without-email)
           echo "$output" | grep -oP '(?<=Your certificate and chain have been saved at: )[^\n]*' | sed -e 's/^\s*//' -e 's/\s*$//'
           echo "$output" | grep -oP '(?<=Your key file has been saved at: )[^\n]*' | sed -e 's/^\s*//' -e 's/\s*$//'

            ;;
            
            
            
        #Wiregaurd    
        16)
            
            
            while true
            do
                clear
                echo "==== Main Menu ===="
                echo "1. Install WireGuard"
                echo "2. Update WireGuard"
                echo "3. Backup Users"
                echo "4. Exit"
                read -p "Enter your choice [1-4]: " choice
            
                case $choice in
                    1)
                        
                        while true
                        do
                            clear
                            echo "==== Install WireGuard ===="
                            echo "1. Install without SSL"
                            echo "2. Install with SSL"
                            echo "3. Back to main menu"
                            read -p "Enter your choice [1-3]: " install_choice
            
                            case $install_choice in
                                1)
                                    # Install WireGuard without SSL
                                    echo "Installing WireGuard without SSL..."
                                    
                                    # Add commands to install WireGuard here
                                     if ! command -v docker &> /dev/null
                                    then
                                        echo "docker not found, installing..."
                                        curl -sSL https://get.docker.com | sh
                                        sudo usermod -aG docker $(whoami)
                                    fi
                          
                                    
                                    
                                    
                                    

                                    # Prompt user for required information
                                    read -p "Enter IP address or domain name of server running Wireguard: " WG_HOST
                                    read -p "Enter admin password for Vase login: " PASSWORD
                                    read -p "Enter UDP port to use for Wireguard (default: 51820): " UDP_PORT
                                    UDP_PORT=${UDP_PORT:-51820}
                                    read -p "Enter TCP port to use for Wireguard (default: 51821): " TCP_PORT
                                    TCP_PORT=${TCP_PORT:-51821}
                                    
                                    # Run docker command with specified parameters
                                    docker run -d \
                                      --name=wg-easy \
                                      -e WG_HOST=$WG_HOST \
                                      -e PASSWORD=$PASSWORD \
                                      -v ~/.wg-easy:/etc/wireguard \
                                      -p $UDP_PORT:$UDP_PORT/udp \
                                      -p $TCP_PORT:$TCP_PORT/tcp \
                                      --cap-add=NET_ADMIN \
                                      --cap-add=SYS_MODULE \
                                      --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
                                      --sysctl="net.ipv4.ip_forward=1" \
                                      --restart unless-stopped \
                                      weejewel/wg-easy

                                    read -p "Installation complete. Press enter to continue..."
                                    ;;
                                2)
                                    # Install WireGuard with SSL
                                    echo "Installing WireGuard with SSL..."
                                    # Installing required dependencies
                                    sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
                                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
                                    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                                    apt update -y 
                                     if ! command -v docker &> /dev/null
                                    then
                                        echo "docker not found, installing..."
                                        sudo apt install docker-ce -y
                                    fi
                                    echo"checking the docker.."
                                    sudo systemctl status docker
                                    sleep 1
                                    
                                    mkdir -p ~/.docker/cli-plugins/
                                    curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
                                    chmod +x ~/.docker/cli-plugins/docker-compose
                                    docker compose version
                                    sleep 1
                                    filepath="/root/compose-dir/docker-compose.yml"
                                    read -p "Enter IP address or domain name of server running Wireguard: " WG_HOST 
                                    read -p "Enter admin password for Vase login: " PASSWORD 
                                    echo"version: "3.8"
                                    services:
                                      wg-easy:
                                        environment:
                                          # ?? Change the server's hostname (clients will connect to):
                                          - WG_HOST=$WG_HOST
                                    
                                          # ?? Change the Web UI Password:
                                          - PASSWORD=$PASSWORD
                                        image: weejewel/wg-easy
                                        container_name: wg-easy
                                        hostname: wg-easy
                                        volumes:
                                          - ~/.wg-easy:/etc/wireguard
                                        ports:
                                          - "51820:51820/udp"
                                        restart: unless-stopped
                                        cap_add:
                                          - NET_ADMIN
                                          - SYS_MODULE
                                        sysctls:
                                          - net.ipv4.ip_forward=1
                                          - net.ipv4.conf.all.src_valid_mark=1
                                    
                                      nginx:
                                        image: weejewel/nginx-with-certbot
                                        container_name: nginx
                                        hostname: nginx
                                        ports:
                                          - "80:80/tcp"
                                          - "443:443/tcp"
                                        volumes:
                                          - ~/.nginx/servers/:/etc/nginx/servers/
                                          - ./.nginx/letsencrypt/:/etc/letsencrypt/
                                    	  
                                    	  "> "$filepath"
                                         
                                         file2path="/root/compose-dir/wg-easy.conf"
                                        echo"server {
                                                 
                                             	listen 80 default_server;
                                             	server_name $WG_HOST;
                                             	
                                                 location / {
                                                     proxy_pass http://wg-easy:51821/;
                                                     proxy_http_version 1.1;
                                                     proxy_set_header Upgrade $http_upgrade;
                                                     proxy_set_header Connection "Upgrade";
                                                     proxy_set_header Host $host;
                                                 }
                                             }
                                             " > "$file2path"
                                    apt install docker-compose -y
                                    docker-compose up -d         
                                    cd ~/compose-dir 
                                    cp docker-compose.yml ~/.nginx/servers/
                                    cp wg-easy.conf ~/.nginx/servers/
                                    read -p "Enter Email you want to get certificate with : " email
                                    # Run Docker command
                                    docker exec -it nginx sh -c "certbot --nginx --non-interactive --agree-tos -m $email -d $WG_HOST && nginx -s reload"
     
                                    read -p "Installation complete. Press enter to continue..."
                                    ;;
                                3)
                                    # Back to main menu
                                    break
                                    ;;
                                *)
                                    echo "Invalid choice. Press enter to continue..."
                                    read
                                    ;;
                            esac
                        done
                        ;;
                    2)
                        # Update WireGuard
                        echo "Updating WireGuard..."
                        cp ~/.wg-easy/wg0.conf /root
                        cp ~/.wg-easy/wg0.json /root 
                        docker stop wg-easy
                        docker rm wg-easy
                        docker pull weejewel/wg-easy
                        # Prompt user for required information
                        read -p "Enter IP address or domain name of server running Wireguard: " WG_HOST
                        read -p "Enter admin password for Vase login: " PASSWORD
                        read -p "Enter UDP port to use for Wireguard (default: 51820): " UDP_PORT
                        UDP_PORT=${UDP_PORT:-51820}
                        read -p "Enter TCP port to use for Wireguard (default: 51821): " TCP_PORT
                        TCP_PORT=${TCP_PORT:-51821}
                        
                        # Run docker command with specified parameters
                 
                        docker run -d \
                          --name=wg-easy \
                          -e WG_HOST=$WG_HOST \
                          -e PASSWORD=$PASSWORD \
                          -v ~/.wg-easy:/etc/wireguard \
                          -p $UDP_PORT:$UDP_PORT/udp \
                          -p $TCP_PORT:$TCP_PORT/tcp \
                          --cap-add=NET_ADMIN \
                          --cap-add=SYS_MODULE \
                          --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
                          --sysctl="net.ipv4.ip_forward=1" \
                          --restart unless-stopped \
                          weejewel/wg-easy
                        read -p "Update complete. Press enter to continue..."
                        ;;
                    3)
                        # Backup Users
                        echo "Backing up users..."
                        cp ~/.wg-easy/wg0.conf /root
                        cp ~/.wg-easy/wg0.json /root 
                        read -p "Backup complete. Press enter to continue..."
                        ;;
                    4)
                        # Exit
                        echo "Goodbye!"
                        break
                        ;;
                    *)
                        echo "Invalid choice. Press enter to continue..."
                        read
                        ;;
                esac
            done

           ;;
           
           
           
        #outline  
        17)
            echo " installnig the outline .... "
            bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)"
            echo " copy your installation output from above and paste in outline manager."
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
           ;;
           
           
        18)
               while true; do
               clear
               echo "Menu:"
               echo "1. Install rsnapshot"
               echo "2. Configure rsnapshot"
               echo "3. Take snapshot"
               echo "4. Exit"
               read -p "Enter your choice: " choice
           
               case $choice in
                   1) 
                       echo "Installing rsnapshot..."
                       apt-get update
                       apt-get install -y rsnapshot
                       echo "Rsnapshot installed successfully."
                       read -p "Press Enter to continue."
                       ;;
                   2) 
                       echo "Configuring rsnapshot..."
                       # Backup source directories
                       echo "backup  /etc/  localhost/" >> /etc/rsnapshot.conf
                       echo "backup  /home/ localhost/" >> /etc/rsnapshot.conf
                       echo "backup  /var/log/  localhost/" >> /etc/rsnapshot.conf
                   
                       # Backup destination directory
                       echo "snapshot_root /backups/" >> /etc/rsnapshot.conf
                   
                       # Backup intervals
                       echo "interval hourly 6" >> /etc/rsnapshot.conf
                       echo "interval daily 7" >> /etc/rsnapshot.conf
                       echo "interval weekly 4" >> /etc/rsnapshot.conf
                       echo "interval monthly 3" >> /etc/rsnapshot.conf
                   
                       echo "Rsnapshot configured successfully."
                       read -p "Press Enter to continue."
                       ;;
                   3) 
                       echo "Taking snapshot..."
                       rsnapshot hourly
                       echo "Snapshot taken successfully."
                       read -p "Press Enter to continue."
                       ;;
                   4)
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
          
        19)
            # Function to wait for user input and return to menu
            function return_to_menu {
                read -n1 -r -p "Press any key to return to the menu..."
                clear
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
           ;;
        #IPsec
        20)
           # Prompt the user if they want to fill in the parameters
           read -p "Do you want to fill in the parameters for vpn.sh? (y/n): " fill_params
           
           if [[ $fill_params == "y" || $fill_params == "Y" ]]; then
               # Run the command to download the vpn.sh file
               wget https://get.vpnsetup.net -O vpn.sh
           
               # Ask the user for the necessary parameters
               read -p "Enter your IPSEC PSK: " ipsec_psk
               read -p "Enter your username: " username
               read -sp "Enter your password: " password
           
               # Fill in the necessary information in the vpn.sh file
               sed -i "s/YOUR_IPSEC_PSK=''/YOUR_IPSEC_PSK='$ipsec_psk'/g" vpn.sh
               sed -i "s/YOUR_USERNAME=''/YOUR_USERNAME='$username'/g" vpn.sh
               sed -i "s/YOUR_PASSWORD=''/YOUR_PASSWORD='$password'/g" vpn.sh
           
               echo "Setup complete! Your vpn.sh file has been updated with your parameters."
           fi
           
           # Run the command to execute the vpn.sh file
           sudo sh vpn.sh

           ;;
        21)
        
           # Define a function to display the menu
           function display_menu {
               clear
               echo "Select an option:"
               echo "1. Normal Install"
               #echo "2. Install with Docker"
               echo "2. Uninstall (normal install only)"
               echo "3. Quit"
               echo
           }
           
           # Call the function to display the menu initially
           display_menu
           
           # Loop until the user selects the Quit option
           while true; do
               # Read the user's choice from the command line
               read -p "Enter choice [1-4]: " choice
           
               # Handle the user's choice
               case $choice in
                   1)
                       echo "Performing normal installation..."
                       bash -c "$(curl -L https://raw.githubusercontent.com/sajjaddg/xray-reality/master/install.sh)"
                       ;;
                   899)
                       echo "Performing installation with Docker..."
                       curl -fsSL https://get.docker.com | sh
                       git clone https://github.com/sajjaddg/xray-reality && cd xray-reality
                       docker build -t xrayreality .
                       docker run -d --name xrayreality -p443:443 xrayreality
                       docker exec -it xrayreality cat /root/test.url
                       docker exec -it xrayreality sh -c 'qrencode -s 120 -t ANSIUTF8 $(cat /root/test.url)'
                       ;;
                   2)
                       echo "Performing uninstallation..."
                        bash -c "$(curl -L https://raw.githubusercontent.com/sajjaddg/xray-reality/master/uninstall.sh)"
                       ;;
                   3)
                       echo "Goodbye!"
                       break
                       ;;
                   *)
                       echo "Invalid choice. Please try again."
                       ;;
               esac
           
               # Display the menu again
               display_menu
           done

           ;;
        # CREDITS   
        22)
            echo ""
            echo -e "${BLUE}####################################################${NC}"
            echo -e "${BLUE}#${NC}                                      ${BLUE}#${NC}"
            echo -e "${BLUE}#${NC}           ${YELLOW}Credits${NC}      ${BLUE}#${NC}"
            echo -e "${BLUE}#${NC}                                      ${BLUE}#${NC}"
            echo -e "${BLUE}####################################################${NC}"
            echo ""

            # Print contributors
            echo -e "This bash  was created by ${GREEN}Soroush Nekoozadeh${NC}\n"
            echo -e "Special thanks to ${GREEN}AtomicBoys Team${NC}, ${GREEN}alex${NC}, and ${GREEN}kimi${NC} for their contributions.\n"
            echo -e "this script only has been made to  make youre job faster. so use it appropriately.i used lot of people codes scripts and .... that takes hole day to name. you can find them in github ^_^"
            # Wait for user input
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1
            ;;
        
        # EXIT
        23)
            echo ""
            echo -e "${GREEN}Exiting...${NC}"
            echo "Exiting program"
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
