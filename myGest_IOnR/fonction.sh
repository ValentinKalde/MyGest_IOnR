#!/bin/bash
source config.sh
# fonction pour afficher les titres
function afficheTitre () {
    if [[ $machine -eq 1 ]]
    then
        figlet $1
    else
        figlet $1 | lolcat
    fi  
}

#fonction pour tester les ips
function testip () {

	adrip1=$(cut -d '.' -f 1 adrip.txt)
	adrip2=$(cut -d '.' -f 2 adrip.txt)
	adrip3=$(cut -d '.' -f 3 adrip.txt)
	adrip4=$(cut -d '.' -f 4 adrip.txt)
	if [[ $adrip1 -le 0 || $adrip1 -ge 255 ]]
	then
	echo "Erreur dans la saisie de l'IP"
	elif [[ $adrip2 -le 0 || $adrip2 -ge 255 ]]
	then
	echo "Erreur dans la saisie de l'IP"
	elif [[ $adrip3 -le 0 || $adrip3 -ge 255 ]]
	then
	echo "Erreur dans la saisie de l'IP"
	elif [[ $adrip4 -le 0 || $adrip4 -ge 255 ]]
	then
	echo "Erreur dans la saisie de l'IP"
	else 
	echo "Envoie de la requête ICMP..."
	rep=$(ping $adrip -c 2 |grep " 0% packet loss" | wc -l)

		if [[ $rep -eq 1 ]]
		then
			echo "L'adresse IP répond aux pings"
		else
			echo "L'adresse IP ne répond pas aux pings"
		fi
	fi

}
