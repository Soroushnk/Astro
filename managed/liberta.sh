#!/bin/ash

while true; do
    clear
    echo "Libertea Management Menu"
    echo "========================"
    echo "1. Install Libertea"
    echo "2. Update Libertea"
    echo "3. Uninstall Libertea"
    echo "4. Exit"
    echo -n "Enter choice (1-4): "
    read choice

    case $choice in
        1)  
            echo "Installing Libertea..."
            curl -s https://raw.githubusercontent.com/VZiChoushaDui/Libertea/master/bootstrap.sh -o /tmp/bootstrap.sh && bash /tmp/bootstrap.sh install
            ;;
        2)  
            echo "Updating Libertea..."
            curl -s https://raw.githubusercontent.com/VZiChoushaDui/Libertea/master/bootstrap.sh -o /tmp/bootstrap.sh && bash /tmp/bootstrap.sh update
            ;;
        3)  
            echo "Uninstalling Libertea..."
            curl -s https://raw.githubusercontent.com/VZiChoushaDui/Libertea/master/bootstrap.sh -o /tmp/bootstrap.sh && bash /tmp/bootstrap.sh uninstall
            ;;
        4)  
            break
            ;;
        *)  
            echo "Invalid choice. Please enter  1-4."
            sleep  2
            ;;
    esac
done
