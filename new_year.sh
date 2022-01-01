#!/bin/bash

CURRENT_YEAR=`date +%Y`
luck="good bad"

declare -i roll=$(( $RANDOM % 2 + 1 ))

[ $roll = 1 ] && 
echo "$CURRENT_YEAR will be a ${luck%% *} year!" || 
echo "$CURRENT_YEAR will be a ${luck##* } year!"