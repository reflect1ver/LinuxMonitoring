#!/bin/bash

if [ $# != 1 ]
then
    echo "wrong number of parameters"
else
    pattern="^[+-.]?[0-9]+([.][0-9]+)?$"
    if [[ ! $1 =~ $pattern ]]
    then
        echo $1
    else
        echo "Incorrect input: string expected"
    fi
fi