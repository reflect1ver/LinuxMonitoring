#!/bin/bash
. ./print.sh

if [[ -n $5 ]] # проверка на непереизбыток параметров 
then
    echo "Too much parameters. Try again."
else
    if [[ -n $4 ]] 
    then
        reg="^[1-6]$" # принимаем только 1 2 3 4 5 6

        if [[ $1 =~ $reg ]] && [[ $2 =~ $reg ]] && [[ $3 =~ $reg ]] && [[ $4 =~ $reg ]] 
        then
            if [[ $1 == $2 ]] || [[ $3 == $4 ]]
            then
                echo "first  cant be equal second, third cant be eaual fourth. Try again."
            else
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

                get_color $1
                background_left="\033[4$?m"
                get_color $2
                left_font="\033[3$?m"
                get_color $3
                background_right="\033[4$?m"
                get_color $4
                right_font="\033[3$?m"
                default_colors="\033[37m\033[0m"

                print
            fi
        else
            echo "Type from 1 to 6. Try again."
        fi
    else
        echo "More parametrs need. Try again."
    fi
fi