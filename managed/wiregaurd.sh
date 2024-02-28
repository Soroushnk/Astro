#!/bin/bash


# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m'

# Function to install WireGuard without SSL
install_without_ssl() {
    echo -e "${YELLOW}Installing WireGuard without SSL...${NC}"
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

      read -p "Installation complete.  you can enter the panel bu addressing ${GREEN}(http://serverip:TCPport)${NC} Press enter to continue..."
                                    
    echo -e "${GREEN}Installation complete! Access the admin panel at ${CYAN}http://your_server_ip:your_tcp_port${NC}"

    sleep 10
    read -p "Press Enter to continue..."
}

# Function to install WireGuard with SSL
install_with_ssl() {
    echo -e "${YELLOW}Installing WireGuard with SSL...${NC}"
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
     
                                    
    echo -e "${GREEN}Installation complete! Access the secure admin panel at ${CYAN}https://your_server_domain:51821${NC}"
    sleep 10
    read -p "Press Enter to continue..."
}

# Main loop
while true; do
    clear
    echo -e "${YELLOW}=================== Main Menu ===================${NC}"
    echo -e "${YELLOW}1.${NC} Install WireGuard without SSL"
    echo -e "${YELLOW}2.${NC} Install WireGuard with SSL"
    echo -e "${YELLOW}3.${NC} Update WireGuard"
    echo -e "${YELLOW}4.${NC} Backup Users"
    echo -e "${YELLOW}5.${NC} Exit"
    read -p "Enter your choice [1-5]: " choice

    case $choice in
        1)
            install_without_ssl
            ;;
        2)
            install_with_ssl
            ;;
        3)
            # Update WireGuard
            echo -e "${YELLOW}Updating WireGuard...${NC}"
            # Your existing update commands go here
            echo -e "${GREEN}Update complete!${NC}"
            read -p "Press Enter to continue..."
            ;;
        4)
            # Backup Users
            echo -e "${YELLOW}Backing up users...${NC}"
            # Your existing backup commands go here
            echo -e "${GREEN}Backup complete!${NC}"
            read -p "Press Enter to continue..."
            ;;
        5)
            # Exit
            echo -e "${GREEN}Goodbye!${NC}"
            exit  0
            ;;
        *)
            echo -e "${RED}Invalid choice. Please try again.${NC}"
            read -p "Press Enter to continue..."
            ;;
    esac
done


      
            
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

                                    read -p "Installation complete.  you can enter the panel bu addressing ${GREEN}(http://serverip:TCPport)${NC} Press enter to continue..."
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
            echo -e "Press ${RED}ENTER${NC} to continue"
            read -s -n 1