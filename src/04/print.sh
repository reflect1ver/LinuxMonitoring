#!/bin/bash

. ./colours.sh

# "\033[47m\033[36m"
one="\033[4${colour_print[0]}m\033[3${colour_print[1]}m"
two="\033[4${colour_print[2]}m\033[3${colour_print[3]}m"
def="\033[0m"


HOSTNAME=$(hostname)
timedatectl set-timezone Europe/Moscow
TIMEZONE="$(cat /etc/timezone) $(date -u "+%Z") $(date "+%z")"
USER=$(whoami)
OS=$(cat /etc/issue | awk '{print $1,$2,$3}' | tr -s '\r\n' ' ')
DATE=$(date "+%d %b %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(hostname -I | awk '{print $0}')
MASK=$(ifconfig | grep -m1 netmask | awk '{print $4}')
GATEWAY=$(ip route | grep default | awk '{print $3}')
RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
SPACE_ROOT=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')


function print {
    echo -e "$one HOSTNAME = $two $HOSTNAME $def"
    echo -e "$one TIMEZONE = $two $TIMEZONE $def"
    echo -e "$one USER = $two $USER $def"
    echo -e "$one OS = $two $OS $def"
    echo -e "$one DATE = $two $DATE $def"
    echo -e "$one UPTIME = $two $UPTIME $def"
    echo -e "$one UPTIME_SEC = $two $UPTIME_SEC $def"
    echo -e "$one IP = $two $IP $def"
    echo -e "$one MASK = $two $MASK $def"
    echo -e "$one GATEWAY = $two $GATEWAY $def"
    echo -e "$one RAM_TOTAL = $two $RAM_TOTAL $def"
    echo -e "$one RAM_USED = $two $RAM_USED $def"
    echo -e "$one RAM_FREE = $two $RAM_FREE $def"
    echo -e "$one SPACE_ROOT = $two $SPACE_ROOT $def"
    echo -e "$one SPACE_ROOT_USED = $two $SPACE_ROOT_USED $def"
    echo -e "$one SPACE_ROOT_FREE = $two $SPACE_ROOT_FREE $def"
}

function print_color {
    
    echo -en "\n"
    echo "Column 1 background = ${print[0]} ${print_c[0]}"
    echo "Column 1 font color = ${print[1]} ${print_c[1]}"
    echo "Column 2 background = ${print[2]} ${print_c[2]}"
    echo "Column 2 font color = ${print[3]} ${print_c[3]}"

}
