#!/bin/bash
source config.sh


echo -n "Confirmer l'installation de Wireshark (o/n)" :
read mod

case "$mod" in
oui | o | O | Oui | OUI )
echo "Installation de Wireshark..."
echo $pass | sudo -p '' -S apt update -y  > /dev/null 2> apterror.txt
echo $pass | sudo -p '' -S apt install -y wireshark  > /dev/null 2> /dev/null
	;;
non | n | N | Non | NON )
echo "Annulation de l'installation"
;;
* )
echo "Erreur dans la saisie"
;;
esac
echo ""
echo "Installation terminée"
echo ""