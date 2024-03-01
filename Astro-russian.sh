#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color
 #Check if user is root
if [ "$(id -u)" != "0" ]; then
    echo "Этот скрипт должен быть запущен от имени root"
    sleep .5 
    su -s /bin/bash -c "$0 $*" root
    #exit 1
fi
echo "Запускается от имени root..."
sleep .5
clear
while true; do
    clear
    echo -e "${YELLOW}+--------------------------------------------------+${NC}"
    echo -e "${YELLOW}|                                                  |${NC}"
    echo -e "${GREEN}|${GREEN}         ______       _____                       ${GREEN}|${NC}"
    echo -e "${BLUE}|${GREEN}        ___    |________  /_____________          ${BLUE}|${NC}"
    echo -e "${BLUE}|${GREEN}        __  /| |_  ___/  __/_  ___/  __ \         ${BLUE}|${NC}"
    echo -e "${BLUE}|${GREEN}        _  ___ |(__  )/ / _ _  /  / /_/ /         ${BLUE}|${NC}"
    echo -e "${BLUE}|${GREEN}        /_/  |_/____/ \__/  /_/   \____/          ${BLUE}|${NC}"
    echo -e "${BLUE}|                                        ${RED}ver 1.3 ${NC}  ${BLUE}|${NC}"
    echo -e "${BLUE}|${NC}                       B Y                        ${BLUE}|${NC}"
    echo -e "${BLUE}|${NC}               A T O M I C B O Y S                ${BLUE}|${NC}"
    echo -e "${BLUE}|           ---------------------------            |${NC}"
    echo -e "${BLUE}|                    ${YELLOW}Главное меню${BLUE}                  |${NC}"
    echo -e "${YELLOW}|--------------------------------------------------|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${GREEN}  ------------ Инструменты сервера ------------   ${BLUE}|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${YELLOW} 1.${NC} ${CYAN}Обновить сервер и установить зависимости${NC}      ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 2.${NC} ${GRAY}Изменить порт SSH${NC}                             ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 3.${NC} ${CYAN}Добавить пользователя (для SSH)${NC}               ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 4.${NC} ${GRAY}Резервное копирование сервера${NC}                 ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 5.${NC} ${CYAN}Настройка туннелей серверами с использованием ${BLUE}|${NC}
${BLUE}|${NC} IPtables${NC}                                         ${BLUE}|${NC}"      # TODO добавить несколько методов
    echo -e "${BLUE}|${YELLOW} 6.${NC} ${GRAY}Просмотр использования системы${NC}                ${BLUE}|${NC}"        # обновить
    echo -e "${BLUE}|${YELLOW} 7.${NC} ${CYAN}Изменить репозиторий${NC}                          ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 8.${NC} ${GRAY}Изменить сервер имен${NC}                          ${BLUE}|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|      --------------- V2ray --------------        |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${YELLOW}  9.${NC} ${GRAY}Установка панели${NC}                             ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 10.${NC} ${CYAN}Reality.ez${NC}                                   ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 11.${NC} ${GRAY}X-UI Менеджер${NC}                                ${BLUE}|${NC}" 
    echo -e "${BLUE}|${YELLOW} 12.${NC} ${CYAN}Установка и настройка SSL ${NC}                   ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 13.${NC} ${GRAY}Панель Liberta${NC}${NC}${YELLOW}(НОВОЕ)${NC}                        ${BLUE}|${NC}" 
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|    ------------ Конфигурация VPN -----------     |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${YELLOW}14.${NC} ${CYAN}Cisco VPN ${NC} ${YELLOW}(лучшее)${NC}                           ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}15.${NC} ${GRAY}Установка OpenVPN${NC}                             ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}16.${NC} ${CYAN}Настройка Outline${NC}                             ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}17.${NC} ${GRAY}Настройка Wiregaurd${NC}                           ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}18.${NC} ${CYAN}Настройка IPsec VPN(L2TP/IKEV2)${NC}               ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}19.${NC} ${GRAY}Создание Telegram прокси(mtproto)${NC}             ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}20.${NC} ${GRAY}SSH Панель ${NC} ${YELLOW}(лучшее)${NC}                          ${BLUE}|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|  -------- Дополнительные инструменты ---------   |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${YELLOW}21.${NC} ${CYAN}Исправление Google Recapcha${NC}                   ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}22.${NC} ${GRAY}Изменение IP TOR ${NC}${NC}${YELLOW}(НОВОЕ)${NC}                      ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}23.${NC} ${CYAN}Тестирование скорости${NC}                         ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}24.${NC} ${GRAY}Установка и настройка WordPress${NC}               ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}25.${NC} ${CYAN}Реверсивный прокси (в разработке)${NC}             ${BLUE}|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|     ---------------- Другое --------------       |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${YELLOW}26.${NC} ${GREEN}Автобот Astro${NC}                                 ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}27.${NC} ${GREEN}Конфигурация сервера${NC}                          ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}28.${NC} ${GREEN}Сделать ASTRO командой${NC}                        ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}29.${NC} ${GREEN}Добавить WARP к прокси${NC}${YELLOW}(НОВОЕ)${NC}                 ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}30.${NC} ${GREEN}УЧАСТНИКИ${NC}                                     ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}0.${NC} ${RED}ВЫХОД${NC}                                          ${BLUE}|${NC}"
    echo -e "${GREEN}|                                                  |${NC}" 
    echo -e "${YELLOW}|                                                  |${NC}" 
    echo -e "${YELLOW}+--------------------------------------------------+${NC}"
    echo -e ""
    echo -e "${GREEN}Пожалуйста, выберите опцию:${NC}"
    echo -e ""
    
    read -p "Введите номер опции: " choice

    
    case $choice in

     #UPDATE SEVER
        1)
            
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/update.sh)

            ;;

        2)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/ssh-change-port.sh)
            ;; 

        3)
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/add-user.sh)
            ;;

        4)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/server-backup.sh)
            ;;

        5)
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/tunnel.sh)
            ;;

        6)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/system-usage.sh)
            ;;

        7)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/repository.sh)
            ;;

        8)
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/namaeserver.sh)
            ;;
        # INSTALL X-UI PANEL
        9)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/v2ray_pannel.sh)
            ;;

        10)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/reallity_ez.sh)
            ;;

        11)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/xui_manager.sh)
            ;;

        # DOWNLOADS ACME
        12)
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/ssl_get.sh)
            ;;

        13)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/liberta.sh)
            ;;

        #cisco open connect (oscerv)
        14)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/cisco_vpn.sh)
            ;;
        #Install OPENVPN
        15)
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/install_openvpn.sh)
            ;;

        16)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/install_outline.sh)
            ;;

        #Wiregaurd    
        17)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/wiregaurd.sh)
            ;;
        #IPsec
        18)
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/IPsec.sh)
            ;;
        # install Mtproto  
        19)
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/mtproto.sh)
            ;;

        20)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/ssh_panel.sh) 
            ;;

        21)  
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/google_recapcha.sh)
            ;;
        #CFSscanner
        22)
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/chengesip_tor.sh)
            ;;
        
        #Speedtest menu  
        23) 
            bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/speedtest.sh) 
            ;;
        # Install WordPress and connect to SQL
        24)
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/wordpress.sh)
            ;;
        #reverse proxy    
        25)  
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/reverse-proxy.sh)
            ;;
        26)  
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/Astro-autobot.sh)
            ;;
        27)  
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/whats_server.sh)
            ;;
        28)  
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/astro_alias.sh)
            ;;
        29)  
           bash <(curl -Ls https://raw.githubusercontent.com/Soroushnk/Astro/main/managed/install-warp.sh)
            ;;
        
        30)
             clear
            echo ""
            echo -e "${BLUE}########################################${NC}"
            echo -e "${BLUE}#${NC}                                      ${BLUE}#${NC}"
            echo -e "${BLUE}#${NC}                ${YELLOW}Credits${NC}             ${BLUE}#${NC}"
            echo -e "${BLUE}#${NC}                                      ${BLUE}#${NC}"
            echo -e "${BLUE}########################################${NC}"
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
        0)
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
        
