#!/bin/bash
set -euo pipefail

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
                echo "8. Exit"
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
                        apt-get update
                        apt-get install -y rsnapshot
                        echo "Rsnapshot installed successfully."
                        read -p "Press Enter to continue."
                        ;;
                    5)
                        echo "Configuring rsnapshot..."
                        # Backup source directories
                        echo "backup  /etc/  localhost/" >> /etc/rsnapshot.conf
                        echo "backup  /etc/x-ui  localhost/" >> /etc/rsnapshot.conf
                        echo "backup  /etc/oscerv  localhost/" >> /etc/rsnapshot.conf
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
                        echo "Snapshot taken successfully."
                        read -p "Press Enter to continue."
                        ;;
                    7)
                        transfer_backup
                        ;;
                    8)
                        echo "Exiting program."
                        break
                        ;;
                    *)
                        echo "Invalid choice. Please try again."
                        read -p "Press Enter to continue."
                        ;;
                esac
            done