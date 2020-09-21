#!/usr/bin/env bash

source ${HOME}/bin/.lib/core.lib.sh


__control_wifi__() {
    __check_binary__ nmcli || return 1
    nmcli radio wifi ${1}
}

__is_wifi_disabled() {
    __check_binary__ nmcli || return 1
    case $(nmcli radio wifi) in
        disabled)  return 1 ;;
        enabled)   return 0 ;;
    esac
}

__enable_wifi() {
    __is_wifi_disabled || __control_wifi__ on
}

__disable_wifi() {
    __is_wifi_disabled && __control_wifi__ off
}

__get_wifi_interface() {
    __check_binary__ iw || return 1
    # ls -l /sys/class/net | awk -F\/ '/pci/{print $NF}'
    local wifi_interface="$(iw dev | awk '$1=="Interface"{print $2}')"
    echo "${wifi_interface}"
}

__get_wifi_interfaces() {
    echo "fatal: ${FUNCNAME[0]} unsupported"
}

__get_eth_interface() {
    # ls -l /sys/class/net | awk -F\/ '/pci/{print $NF}'
    local eth_interface=$(ls -l /sys/class/net | awk -F\/ '/pci/{print $NF}' | grep ^en)
    echo "${eth_interface}"
}

__get_eth_interfaces() {
    echo "fatal: ${FUNCNAME[0]} unsupported"
}
