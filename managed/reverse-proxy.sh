#!/bin/bash

# Color codes for console output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check if script is run as root
if [ "$EUID" -ne  0 ]
  then echo -e "${RED}Please run as root${NC}"
  exit
fi

# Install necessary packages
echo -e "${GREEN}Installing necessary packages...${NC}"
apt install nginx certbot python3-certbot-nginx -y

# Ask for site name and validate input
read -p "Enter your site name: " site_name
if [[ -z "$site_name" ]]; then
    echo -e "${RED}Site name cannot be empty. Exiting.${NC}"
    exit  1
fi

# Configure Nginx for the site
echo -e "${GREEN}Configuring Nginx for ${site_name}...${NC}"
ln -s /etc/nginx/sites-available/$site_name /etc/nginx/sites-enabled/
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$site_name

# Define the file path
FILE_PATH="/etc/nginx/sites-available/$site_name"

# Define content with placeholders
CONTENT=$(cat <<-END
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# https://www.nginx.com/resources/wiki/start/
# https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/
# https://wiki.debian.org/Nginx/DirectoryStructure
#
# Default server configuration
server {
    listen  80;
    listen [::]:80;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name $site_name;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location /ports {
        if (\$http_upgrade != "websocket") {
            return  404;
        }
        location ~ /ports/\d\d\d\d\d\$ {
            if (\$request_uri ~* "([^/]*$)" ) {
                set \$port \$1;
            }
            proxy_redirect off;
            proxy_pass http://127.0.0.1:\$port/;
            proxy_http_version  1.1;
            proxy_set_header Upgrade \$http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        }
        return  404;
    }
}
END
)

# Write content to destination file
echo -e "$CONTENT" > "$FILE_PATH"
ln -s /etc/nginx/sites-available/$site_name /etc/nginx/sites-enabled/

# Restart Nginx and check if it's running
systemctl restart nginx
if ! systemctl is-active --quiet nginx; then
    echo -e "${RED}Nginx failed to restart. Check the logs for errors.${NC}"
    exit  1
fi

# Request SSL certificate with Certbot
echo -e "${GREEN}Requesting SSL certificate for ${site_name}...${NC}"
output=$(certbot --nginx -d $site_name --register-unsafely-without-email)
if [ $? -ne  0 ]; then
    echo -e "${RED}Failed to obtain SSL certificate.${NC}"
    exit  1
fi

# Extract certificate paths
cert_path=$(echo "$output" | grep -oP '(?<=Your certificate and chain have been saved at: )[^\n]*' | sed -e 's/^\s*//' -e 's/\s*$//')
key_path=$(echo "$output" | grep -oP '(?<=Your key file has been saved at: )[^\n]*' | sed -e 's/^\s*//' -e 's/\s*$//')

echo -e "${GREEN}SSL certificate obtained.${NC}"
echo -e "${GREEN}Certificate path: ${cert_path}${NC}"
echo -e "${GREEN}Key path: ${key_path}${NC}"

echo -e "${GREEN}Setup complete. Press ENTER to continue.${NC}"
read -s -n  1
