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
rep=$(ping $adrip -c 2 |grep " 0% packet loss" | wc -l)
	if [[ $rep -eq 1 ]]
	then
	echo -n "Veuillez saisir un numéro de port TCP : "
	read port
	echo "Envoie de la requête TCP..."
	rep1=$(nmap -p $port -v $adrip | grep "tcp open" | wc -l)

		if [[ $rep1 -eq 1 ]]
		then
		echo "Le port TCP est ouvert sur l'adresse IP."
		else
		echo "Le port TCP est fermé sur l'adresse IP."
		fi
		else
		echo ""
		fi
else 
echo "Erreur dans la saisie"
fi


