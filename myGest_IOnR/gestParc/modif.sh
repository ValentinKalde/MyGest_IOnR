#!/bin/bash
#TRISTAN
source install/infobdd.sh

quitter=0
echo -n "Donner l'id de l'équipement à modifier : "
read id
mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement where id like '$id';"

while [[ $quitter -eq 0 ]]
do
echo "Que voulez-vous modifier ? "
echo "1) Nom"
echo "2) Adresse MAC"
echo "3) Adresse IP"
echo "4) Masque CIDR"
echo "5) Type"
echo "0) Retour au menu précédent"
read on
case "$on" in
1 )
echo -n "> Nom (pc*,svr*,sw*) : " 
read nom 
echo "> Update Equipement set nom='$nom'"
echo -n "Confirmer la modification (o/n) : "
read mod
case "$mod" in
oui | o | O | Oui | OUI )
echo "L'équipement a bien été modifié"
mysql --user=$sqluser --password=$sqlpass -e "use mgt;Update Equipement set nom='$nom' where id like '$id';"
mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement where id like '$id';"
	;;
non | n | N | Non | NON )
echo "Annulation de la modification"
;;
* )
echo "Erreur dans la saisie"
;;
esac
;;
2 )
echo -n "> Adresse MAC : "
read admac
echo "> Update Equipement set adMAC='$admac'"
echo -n "Confirmer la modification (o/n) : "
read mod
case "$mod" in
oui | o | O | Oui | OUI )
echo "L'équipement a bien été modifié"
mysql --user=$sqluser --password=$sqlpass -e "use mgt;Update Equipement set adMAC='$admac' where id like '$id';"
mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement where id like '$id';"
	;;
non | n | N | Non | NON )
echo "Annulation de la modification"
;;
* )
echo "Erreur dans la saisie"
;;
esac
;;
3 )
echo -n "> Adresse IP : "
read adip
echo "> Update Equipement set adIP=$adip'"
echo -n "Confirmer la modification (o/n) : "
read mod
case "$mod" in
oui | o | O | Oui | OUI )
echo "L'équipement a bien été modifié"
mysql --user=$sqluser --password=$sqlpass -e "use mgt;Update Equipement set adIP='$adip' where id like '$id';"
mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement where id like '$id';"
	;;
non | n | N | Non | NON )
echo "Annulation de la modification"
;;
* )
echo "Erreur dans la saisie"
;;
esac
;;
4 )
echo -n "> Masque (CIDR) : "
read cidr 
echo "> Update Equipement set CIDR=$cidr'"
echo -n "Confirmer la modification (o/n) : "
read mod
case "$mod" in
oui | o | O | Oui | OUI )
echo "L'équipement a bien été modifié"
mysql --user=$sqluser --password=$sqlpass -e "use mgt;Update Equipement set CIDR='$cidr' where id like '$id';"
mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement where id like '$id';"
	;;
non | n | N | Non | NON )
echo "Annulation de la modification"
;;
* )
echo "Erreur dans la saisie"
;;
esac
;;
5 )
echo -n "> Type (1: machine; 2: switch; 3: serveur) : "
read type
echo "> Update Equipement set idT='$type'"
case "$mod" in
oui | o | O | Oui | OUI )
echo "L'équipement a bien été modifié"
mysql --user=$sqluser --password=$sqlpass -e "use mgt;Update Equipement set idT='$type' where id like '$id';"
mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement where id like '$id';"
	;;
non | n | N | Non | NON )
echo "Annulation de la modification"
;;
* )
echo "Erreur dans la saisie"
;;
esac
;;
0 )
quitter=1
;;
* )
echo "Erreur dans la saisie"
;;
esac
done




