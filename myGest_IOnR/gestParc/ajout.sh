#!/bin/bash
#TRISTAN
source install/infobdd.sh

echo "Veuillez saisir les informations suivantes :"
echo -n "> Nom (pc*,svr*,sw*) : " 
read nom 
echo -n "> Adresse MAC : "
read admac
echo -n "> Adresse IP : "
read adip
echo -n "> Masque (CIDR) : "
read cidr 
echo -n "> Type (1: machine; 2: switch; 3: serveur) : "
read type
echo "Récapitulatif de la requête :"
echo "> INSERT INTO Equipement (nom, adMAC, adIP, CIDR, idT) VALUES ('$nom','$admac','$adip','$cidr',$type');"
echo -n "Confirmer l'insertion ? (o/n)"
read on
case "$on" in
oui | o | O | Oui | OUI )
echo "Les saisies ont été intégrées à la base de données"
    mysql --user=$sqluser --password=$sqlpass -e "use mgt;INSERT INTO Equipement (id,nom,adMAC,adIP,CIDR,idT) VALUES (0,'$nom','$admac','$adip','$cidr','$type');"
	;;
non | n | N | Non | NON )
echo "Annulation de l'insertion"
;;
* )
echo "Erreur dans la saisie"
;;
esac

