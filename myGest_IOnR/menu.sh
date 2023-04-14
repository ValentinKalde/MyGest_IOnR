#!/bin/bash
source config.sh
source fonction.sh

echo "Bienvenu dans :"
if [[ $machine -eq 1 ]]
then
afficheTitre "MyGest IOn ' R" && echo SERVEUR
else
afficheTitre "MyGest IOn ' R" && echo CLIENT | lolcat
fi
quitter=1
while [[ $quitter -ne 0 ]]
do
echo ""
afficheTitre "Menu principal"
echo "1) Gestion du parc"
echo "2) Outils réseau"
echo "3) Extension"
echo "4) Options"
echo "0) Quitter"
echo -e "Veuillez choisir une option :"
read v
case $v in 
	1 )
		bash gestParc/menuParc.sh
		;;
	2 )
		bash outilsRx/menuOutils.sh
		;;
	3)
		bash extension/menuExt.sh
		;;
	4)
		bash options/option.sh
		;;
	0 )
		quitter=0
		afficheTitre "Aurevoir"
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done