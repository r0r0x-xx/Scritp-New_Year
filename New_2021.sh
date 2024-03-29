#!/bin/bash
# Script for New Year - updated - r0r0x 2022

# Config
name='I wish you a Happy New Year - By r0r0x'
correction=0

trap "tput reset; tput cnorm; exit" 2


tput civis

line=6
middle_column=$(($(tput cols) / 3))
middle_column=$((middle_column-0))
color=0

new_year=$(date +'%Y')
let new_year++

while true; do
    randomValue=$((RANDOM % 12 + 12)) ##
    from_middle=$((middle_column-randomValue))
    column=$((RANDOM % (randomValue) * 2 + 1 + from_middle))
    tput setaf $color; tput bold

    tput cup 6 $column
    echo '#'

    color=$(((color+7)%8))

    from_middle=-8 # from left column
    for l in H A P P Y
    do
        tput cup $((line+1)) $((middle_column+from_middle))
        echo $l
        let from_middle++
        sleep 0
    done

    from_middle=0
    for l in N E W
    do
        tput cup $((line+2)) $((middle_column+from_middle))
        echo $l
        let from_middle++
        sleep 0
    done

    from_middle=8
    for l in Y E A R
    do
        tput cup $((line+3)) $((middle_column+from_middle))
        echo $l
        let from_middle++
        sleep 0
    done

    spaceCount=$((middle_column/9 + correction))
    spaces=""
    for (( c=1; c<=$spaceCount; c++ ))
    do
        spaces+=" "
    done

    tput cup $((line+5)) 1
    toilet "${spaces}$new_year" --metal -t

    tput setaf $color; tput bold

    tput cup 10 $column
    echo '#'

    tput cup $((line+12)) $((middle_column-(${#name}/2)))
    echo $name
done
