#!/bin/bash

function print {
    echo -e "${background_left}${left_font}HOSTNAME= ${background_right}${right_font}$HOSTNAME${default_colors}"
    echo -e "${background_left}${left_font}TIMEZONE = ${background_right}${right_font}${background_right}${right_font}$TIMEZONE${default_colors}"
    echo -e "${background_left}${left_font}USER = ${background_right}${right_font}$USER${default_colors}"
    echo -e "${background_left}${left_font}OS = ${background_right}${right_font}$OS${default_colors}"
    echo -e "${background_left}${left_font}DATE = ${background_right}${right_font}$DATE${default_colors}"
    echo -e "${background_left}${left_font}UPTIME = ${background_right}${right_font}$UPTIME${default_colors}"
    echo -e "${background_left}${left_font}UPTIME_SEC = ${background_right}${right_font}$UPTIME_SEC${default_colors}"
    echo -e "${background_left}${left_font}IP = ${background_right}${right_font}$IP${default_colors}"
    echo -e "${background_left}${left_font}MASK = ${background_right}${right_font}$MASK${default_colors}"
    echo -e "${background_left}${left_font}GATEWAY = ${background_right}${right_font}$GATEWAY${default_colors}"
    echo -e "${background_left}${left_font}RAM_TOTAL = ${background_right}${right_font}$RAM_TOTAL${default_colors}"
    echo -e "${background_left}${left_font}RAM_USED = ${background_right}${right_font}$RAM_USED${default_colors}"
    echo -e "${background_left}${left_font}RAM_FREE = ${background_right}${right_font}$RAM_FREE${default_colors}"
    echo -e "${background_left}${left_font}SPACE_ROOT = ${background_right}${right_font}$SPACE_ROOT${default_colors}"
    echo -e "${background_left}${left_font}SPACE_ROOT_USED = ${background_right}${right_font}$SPACE_ROOT_USED${default_colors}"
    echo -e "${background_left}${left_font}SPACE_ROOT_FREE = ${background_right}${right_font}$SPACE_ROOT_FREE${default_colors}"
}

function get_color {
    res=0

    case "$1" in
        1) res=7 ;;  # white
        2) res=1 ;;  # red 
        3) res=2 ;;  # green
        4) res=4 ;;  # blue
        5) res=5 ;;  # purple
        6) res=0 ;;  # black
    esac

    return $res
}
