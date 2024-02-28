#!/bin/bash

function prompt_yes_no() {
  dialog --clear --backtitle "VPN Setup" --title "Confirmation" --yesno "$1"  7  60
  response=$?
  return $response
}

function get_input() {
  dialog --clear --backtitle "VPN Setup" --title "Input Required" --inputbox "$1"  8  60  2>temp
  response=$(<temp)
  rm temp
  echo $response
}

function show_menu() {
  local choice=$(dialog --clear --backtitle "VPN Setup" --title "Menu" --menu "Choose an option:"  15  60  5 \
  "1" "Install VPN" \
  "2" "Quit"  2>&1 >/dev/tty)
  case $choice in
    1)
      install_vpn
      ;;
    2)
      exit  0
      ;;
  esac
}

function install_vpn() {
  if prompt_yes_no "Are you sure you want to install the VPN?"; then
    YOUR_IPSEC_PSK=$(get_input "Enter IPsec PSK:")
    YOUR_USERNAME=$(get_input "Enter VPN Username:")
    YOUR_PASSWORD=$(get_input "Enter VPN Password:")
    
    wget https://get.vpnsetup.net -O vpn.sh && sudo sh vpn.sh
    rm vpn.sh
  fi
}

show_menu
