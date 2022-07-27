#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
a () {
((left=$timer-$SECONDS))
if [[ $left -le 0 ]]
then
clear
printf "Your score is $sc.\nYou made $mt mistakes.\n"
sleep 1
exit 1 
fi
echo "Current Score = "$sc"     Time left = "$left" seconds"
}
filename=$1
while read line; do
listia+=($line)
done < $filename
sc=0
mt=0
clear
echo "Game starting in 3.."
sleep 1 
clear
echo "Game starting in 2.."
sleep 1
clear
echo "Game starting in 1.."
sleep 1
clear
SECONDS=0
timer=10
while true
do
selected=${listia[ $(( $RANDOM % ${#listia[@]} + 1 )) ]}
len=${#selected}
ct=0
a
while [ $ct -lt $len ]
do
printf "${RED}${selected::ct}${NC}${selected:ct}\n"
read -s -n1 ans
if [[ "$ans" == "${selected:ct:1}" ]]
then
((ct=ct+1))
clear
a
else
        clear
        echo "Wrong letter, try again!"
        ((sc=sc-1))
        ((mt=mt+1))
fi
done
((sc=sc+5))
clear
done
