#!/bin/bash
#VALENTIN
source fonction.sh

echo -n "Veuillez saisir une adresse IP : "
read adrip
echo $adrip > adrip.txt
ipnbdot=$(echo -n $1 |grep -o "\." adrip.txt|wc -l)
if [[ $ipnbdot == 3 ]]
then
testip $adrip
else
echo "Erreur dans la saisie"
fi