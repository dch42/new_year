#!/bin/bash

declare CURRENT_YEAR=`date +%Y`
declare luck="good bad"
declare -i roll=$(( $RANDOM % 2 + 1 ))
declare optstring=":hed"

function usage {
    echo "Usage: $(basename $0) [-hed]" 2>&1
    echo "  -h  help, show usage info"
    echo "  -e  easy mode, increase odds of having a good year"
    echo "  -d  discordian mode, use discordian year (ddate required)"
    exit 1
}

while getopts ${optstring} arg; 
do
    case "${arg}" in
        h) usage ;;
        e) roll=$(( $RANDOM % 7 + 1 )) ;;
        d) CURRENT_YEAR=`ddate +%Y` ;;
        ?) echo "Invalide option: -${OPTARG}" && usage ;;
    esac
done

[ $roll = 1 ] && 
echo "$CURRENT_YEAR will be a ${luck##* } year!" || 
echo "$CURRENT_YEAR will be a ${luck%% *} year!"