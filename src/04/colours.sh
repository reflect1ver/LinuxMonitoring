#!/bin/bash

. ./config.conf
# . ./default.conf

# colour=( echo "$column1_background" echo "$column1_font_color" echo "$column2_background" echo "$column2_font_color")
colour=( $column1_background $column1_font_color $column2_background $column2_font_color )
# default=( echo "$column1_background_d" echo "$column1_font_color_d" echo "$column2_background_d" echo "$column2_font_color_d")


# for i in 0 1 2 3
# do
# echo "start defaul massiv def[$i] = ${default[i]}"
# echo "start massiv colour[$i] = ${colour[i]}"
# done
# column1_background=$column1_background
# if [[ ${column1_background} =~ ^[1-6] ]]
# then

# else
#     column1_background_=2
# fi

# column1_font_color=$column1_font_color
# if [[ ${column1_font_color} =~ ^[1-6] ]]
# then
# else
#     column1_font_color_=4
# fi

# column2_background=$column2_background
# if [[ ${column2_background} =~ ^[1-6] ]]
# then
# else
#     column2_background_=5
# fi

# column2_font_color=$column2_font_color
# if [[ ${column2_font_color} =~ ^[1-6] ]]
# then
# else
#     column2_font_color_=1   
# fi

# colour=( $column1_background_ $column1_font_color_ $column2_background_ $column2_font_color_ )

for i in 0 1 2 3
do
if [[ ${colour[i]} =~ ^[1-6] ]]
then
    print[i]=${colour[i]}
else
    flag[i]=1
    print[i]="default"
fi
done


for i in 0 1 2 3
do
if [[ ${flag[$i]} != 1 ]]
then
    if [[ ${colour[$i]} == 1 ]]
    then 
        colour_print[i]=7
        print_c[i]="(white)"
    elif [[ ${colour[$i]} == 2 ]]
    then 
        colour_print[i]=1
        print_c[i]="(red)"
    elif [[ ${colour[$i]} == 3 ]]
    then 
        colour_print[i]=2
        print_c[i]="(green)"
    elif [[ ${colour[$i]} == 4 ]]
    then 
        colour_print[i]=4
        print_c[i]="(blue)"
    elif [[ ${colour[$i]} == 5 ]]
    then 
        colour_print[i]=5
        print_c[i]="(purple)"
    elif [[ ${colour[$i]} == 6 ]]
    then 
        colour_print[i]=0
        print_c[i]="(black)"
    fi
else

print_c[0]="(red)"
print_c[1]="(blue)"
print_c[2]="(purple)"
print_c[3]="(white)"

colour_print[0]=1
colour_print[1]=6
colour_print[2]=5
colour_print[3]=7
fi

done


# for i in 0 1 2 3
# do
# echo "colour print[$i] = ${colour_print[$i]}"
# done
