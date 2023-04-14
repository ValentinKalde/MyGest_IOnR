#!/bin/bash
source install/infobdd.sh
source config.sh
source fonction.sh


afficheTitre "Options"
oldpass=$(head -n 3 config.sh | tail -n 1 | cut -d '=' -f 2)
oldsqluser=$(head -n 2 install/infobdd.sh | tail -n 1 | cut -d '=' -f 2)
oldsqlpass=$(head -n 3 install/infobdd.sh | tail -n 1 | cut -d '=' -f 2)

echo "1) Changer mot de passe SuperUtilisateur"
echo "2) Modifier l'utilisateur mysql"
echo "3) Supprimer la base de donnée"
echo "4) Importer une base de donnée"
echo "5) Réinitialiser l'installation"
echo "0) Retour au menu principal"
read choix

case $choix in 
	1 )
		echo "Veuillez saisir le nouveau mot de passe SuperUtilisateur : "
        read -s newpass
        sed -i 's/'$oldpass'/'$newpass'/g' install/infobdd.sh
		
		;;
	2 )
		echo -e "Veuillez saisir le nouveau nom d'utilisateur"
		read newsqluser
		sed -i 's/'$oldsqluser'/'$newsqluser'/g' install/infobdd.sh
		echo -e "Veuillez saisir le mot de passe de $newsqluser"
		read -s newsqlpass
		sed -i 's/'$oldsqlpass'/'$newsqlpass'/g' install/infobdd.sh
		;;
	3 )
		mysql -u$sqluser -p$sqlpass -e "drop database mgt ;"
		
		;;
	4 )
		
		echo "Saisir le chemin de la base de donnée (~/fichier.sql)"
		read bdd
		sql=$(ls $bdd | grep .sql | wc -l)
		if [[ sql -eq 1 ]]
		then
		mysql -u $sqluser -p$sqlpass -e "drop database mgt ;" 2>/dev/null
		mysql -u $sqluser -p$sqlpass -e "CREATE DATABASE mgt";
		mysql -u $sqluser -p$sqlpass mgt < $bdd;
		else
		echo "Erreur dans le chemin"
		fi
		;;
	5 )
		echo  "Voulez-vous réinitialiser myGestIOnR ? (o/n)"
		read mod
		case "$mod" in
		
		oui | o | O | Oui | OUI )
		echo "Réinitialisation de MyGestIOnR"
		echo > config.sh
		echo > install/infobdd.sh
        echo $pass | sudo -p '' -S mysql -e "drop database mgt ";
		echo $pass | sudo -p '' -S mysql -e "drop user $sqluser@localhost";
		echo $pass | sudo -p '' -S apt remove -y lolcat figlet > /dev/null 2> /dev/null
		rm *.txt
		pkill bash
		pkill menu.sh
		pkill myGestIOnR.sh
					;;
		non | n | N | Non | NON )
		echo "Annulation de la réinitialisation"
		;;
		* )
		echo "Erreur dans la saisie"
		;;
		esac
		
		;;
	0 )
	
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac