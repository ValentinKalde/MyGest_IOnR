#!/bin/bash
source fonction.sh
afficheTitre "Menu d'extension"
quitter=1
echo "Que voulez-vous installer?"
while [[ $quitter -ne 0 ]]
do
echo "1) Installation du FTP"
echo "2) Installation du SSH"
echo "3) Installation de Wireshark"
echo "4) Installation de Putty"
echo "0) Retour au menu principal"
echo -e "Veuillez choisir une option :"
read choix

case $choix in 
	1 )
		bash extension/ftp.sh
		;;
	2 )
		bash extension/ssh.sh
		;;
	3 ) 
		bash extension/wireshark.sh
		;;
	4 )
		bash extension/putty.sh
		;;	
	0 )
		quitter=0
		;;

	
	* )
		echo "Erreur dans la saisie"
		;;
        esac
done