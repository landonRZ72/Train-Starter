#!/bin/bash


sc="/meso/.sc/"

### tszs ###






while true ;
do


clear


echo "### trainz ###"
echo "**************"
echo "s: start      "
echo "--------------"
echo "0: exit       "
read -s -n 1 select

if [[ $select = 0 ]] ;
then
clear
exit 0 ;
fi


if [[ $select = "s" ]] ;
then

con=0
atmp=1

while [ $con = 0 ] ;
do

clear

echo "starting..."
echo "ready system"

if pgrep -x "wineserver" > /dev/null
then
${sc}kw.sh 2>&1 &
fi


sleep 10s

echo "start"
echo "games start"

steam steam://rungameid/553520 > /dev/null  2>&1 &

sleep 20s


if pgrep -x "TRS19.exe" > /dev/null
then
tcheck="y"
else
tcheck="n"
fi

if test $(wmctrl -l | grep "Trainz Railroad Simulator 2019 Launcher" 2>&1 | wc -l) -eq 1; then
wcheck="y"
else    
wcheck="n"
fi




clear

echo "tcheck: $tcheck"
echo "wcheck: $wcheck"

sleep 3s

if [[ $tcheck = "y" ]] && [[ $wcheck = "y" ]] ;
then

clear

echo "### trainz ###"
echo "**************"
echo "atmp: $atmp   "
echo "--------------"
echo "c: confirm    "
echo "r: retry      "
echo "--------------"
echo "0: exit       "
read -s -n 1 select

if [[ $select = 0 ]] ;
then
clear 
exit 0;
fi

if [[ $select = "c" ]] ;
then
con=1
fi

fi

done



fi





atmp=$(( $atmp + 1 ))



done
