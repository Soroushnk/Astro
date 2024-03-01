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
    echo "此脚本必须以root身份运行"
    sleep .5 
    #su -s /bin/bash -c "$0 $*" root
    #exit 1
fi
echo "以root身份运行中..."
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
    echo -e "${BLUE}|                      ${YELLOW}主菜单${BLUE}                      |${NC}"
    echo -e "${YELLOW}|--------------------------------------------------|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${GREEN}       ------------ 服务器工具 ------------       ${BLUE}|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${YELLOW} 1.${NC} ${CYAN}更新服务器并安装依赖${NC}                          ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 2.${NC} ${GRAY}更改SSH端口${NC}                                   ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 3.${NC} ${CYAN}添加用户（用于SSH）${NC}                           ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 4.${NC} ${GRAY}服务器备份${NC}                                    ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 5.${NC} ${CYAN}使用IPtables隧道服务器${NC}                        ${BLUE}|${NC}"      # TODO 添加多种方法
    echo -e "${BLUE}|${YELLOW} 6.${NC} ${GRAY}查看系统使用情况${NC}                              ${BLUE}|${NC}"        # 更新该部分
    echo -e "${BLUE}|${YELLOW} 7.${NC} ${CYAN}更改仓库${NC}                                      ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 8.${NC} ${GRAY}更改名称服务器${NC}                                ${BLUE}|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|      --------------- V2ray --------------        |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${YELLOW}  9.${NC} ${GRAY}安装面板${NC}                                     ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 10.${NC} ${CYAN}Reality.ez${NC}                                   ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 11.${NC} ${GRAY}X-UI 管理器${NC}                                  ${BLUE}|${NC}" 
    echo -e "${BLUE}|${YELLOW} 12.${NC} ${CYAN}安装和配置SSL ${NC}                               ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW} 13.${NC} ${GRAY}Liberta 面板${NC}${NC}${YELLOW}(新)${NC}                             ${BLUE}|${NC}" 
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|        ------------ VPN 配置 -----------         |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${YELLOW}14.${NC} ${CYAN}Cisco VPN ${NC} ${YELLOW}(最佳)${NC}                             ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}15.${NC} ${GRAY}安装 OpenVPN${NC}                                  ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}16.${NC} ${CYAN}设置Outline${NC}                                   ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}17.${NC} ${GRAY}设置 Wiregaurd${NC}                                ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}18.${NC} ${CYAN}设置 IPsec VPN(L2TP/IKEV2)${NC}                    ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}19.${NC} ${GRAY}制作Telegram代理(mtproto)${NC}                     ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}20.${NC} ${GRAY}SSH 面板 ${NC} ${YELLOW}(最佳)${NC}                              ${BLUE}|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|     ------------  侧边工具 -------------         |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${YELLOW}21.${NC} ${CYAN}Google Recapcha 修复${NC}                          ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}22.${NC} ${GRAY}TOR IP 更改器 ${NC}${NC}${YELLOW}(新)${NC}                            ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}23.${NC} ${CYAN}速度测试${NC}                                      ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}24.${NC} ${GRAY}安装并配置 WordPress${NC}                          ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}25.${NC} ${CYAN}反向代理(开发中)${NC}                              ${BLUE}|${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${GREEN}|     ----------------  其他 --------------        |${NC}"
    echo -e "${BLUE}|                                                  |${NC}"
    echo -e "${BLUE}|${YELLOW}26.${NC} ${GREEN}Astro 自动机器人${NC}                              ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}27.${NC} ${GREEN}服务器配置${NC}                                    ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}28.${NC} ${GREEN}使ASTRO成为一个命令${NC}                           ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}29.${NC} ${GREEN}将WARP添加到代理${NC}${YELLOW}(新)${NC}                          ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}30.${NC} ${GREEN}贡献者${NC}                                        ${BLUE}|${NC}"
    echo -e "${BLUE}|${YELLOW}0.${NC} ${RED}退出${NC}                                           ${BLUE}|${NC}"
    echo -e "${GREEN}|                                                  |${NC}" 
    echo -e "${YELLOW}|                                                  |${NC}" 
    echo -e "${YELLOW}+--------------------------------------------------+${NC}"
    echo -e ""
    echo -e "${GREEN}请选择一个选项:${NC}"
    echo -e ""
    
    read -p "输入选项编号: " choice

    
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
        
