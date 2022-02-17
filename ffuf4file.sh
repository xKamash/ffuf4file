#!/bin/bash
#colors
red=`tput setaf 1`
green=`tput setaf 2`
GOOOD=`tput setaf 9`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
reset=`tput sgr0`

read -p "Enter Your domains file name : " domain_list
read -p "Enter Your wordlist path : " wordlists
read -p "Enter Your output file name (without the extenstion please): " output

while read line
do
	echo "${red}"
	echo "Targeting $line"
	echo "${reset}"
    name=$line
    ffuf -u $line/FUZZ -w $wordlists -fc 403 | tee -a $output.html
    sleep 1
done < $domain_list
echo "${red}"
echo "Done Baby !♥"
echo "All Result Saved in $output.html"
echo "${reset}"