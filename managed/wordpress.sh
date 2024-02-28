#!/bin/bash


# Color codes for terminal output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Menu function
show_menu() {
    echo "Please select an option:"
    echo "1) Install WordPress"
    echo "2) Remove WordPress"
    echo "3) Check WordPress Status"
    echo "4) Quit"
    read -p "Enter option number: " option
    case $option in
        1) install_wordpress ;;
        2) remove_wordpress ;;
        3) check_status ;;
        4) exit  0 ;;
        *) echo -e "${RED}Invalid option. Try again.${NC}" && show_menu ;;
    esac
}

# Install WordPress function
install_wordpress() {
    # Your existing installation script here
    echo -e "${GREEN}Installing WordPress...${NC}"
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
    # ... rest of your installation script
}

# Remove WordPress function
# Remove WordPress function
remove_wordpress() {
    echo -e "${RED}Removing WordPress...${NC}"

    # Stop the Apache service
    sudo systemctl stop apache2

    # Remove the WordPress directory and its contents
    sudo rm -rf /srv/www/wordpress

    # Drop the WordPress database
    mysql -u root -p <<EOF
DROP DATABASE wordpress;
DROP USER 'wordpress'@'localhost';
EOF

    # Remove any leftover configuration files and directories
    sudo rm -rf /etc/apache2/sites-available/wordpress.conf
    sudo a2disconf wordpress.conf

    # Start the Apache service
    sudo systemctl start apache2

    echo "WordPress has been successfully uninstalled."
}


# Check WordPress status function
# Check WordPress status function
check_status() {
    echo -e "${GREEN}Checking WordPress status...${NC}"
    
    # Check if WordPress is installed
    if sudo -u www-data wp core is-installed; then
        echo "WordPress is installed."
        
        # Check the status of all plugins
        echo "Listing installed plugins:"
        sudo -u www-data wp plugin list
        
        # Check the status of all themes
        echo "Listing installed themes:"
        sudo -u www-data wp theme list
    else
        echo "WordPress is not installed."
    fi
}


# Call the menu function
show_menu































 