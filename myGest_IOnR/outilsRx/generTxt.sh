#!/bin/bash
source config.sh
source install/infobdd.sh

echo -n > txtbdd.txt
suivant=1
while [[ $suivant -eq 1 ]]
do
echo -n "Voulez-vous afficher l'id (o/n) ?" 
read mod
case "$mod" in
oui | o | O | Oui | OUI )
echo -n "id," >> txtbdd.txt
suivant=2
;;
non | n | N | Non | NON )
suivant=2
;;
* )
echo "Erreur dans la saisie"
suivant=0
;;
esac
done

while [[ $suivant -eq 2 ]]
do
echo -n "Voulez vous afficher le Nom (o/n) ?"
read mod
case "$mod" in
oui | o | O | Oui | OUI )
echo -n "nom," >> txtbdd.txt
suivant=3
;;
non | n | N | Non | NON )
suivant=3
;;
* )
echo "Erreur dans la saisie"
suivant=0
;;
esac
done

while [[ $suivant -eq 3 ]]
do
echo -n "Voulez vous afficher l'IP (o/n) ?"
read mod
case "$mod" in
oui | o | O | Oui | OUI )
echo -n "adIP," >> txtbdd.txt
suivant=4
;;
non | n | N | Non | NON )
suivant=4
;;
* )
echo "Erreur dans la saisie"
suivant=0
;;
esac
done

while [[ $suivant -eq 4 ]]
do
echo -n "Voulez vous afficher l'adresse MAC (o/n) ?"
read mod
case "$mod" in
oui | o | O | Oui | OUI )
echo -n "adMAC," >> txtbdd.txt
suivant=5
;;
non | n | N | Non | NON )
suivant=5
;;
* )
echo "Erreur dans la saisie"
suivant=0
;;
esac
done

while [[ $suivant -eq 5 ]]
do
echo -n "Voulez vous afficher le Masque CIDR (o/n) ?"
read mod
case "$mod" in
oui | o | O | Oui | OUI )
echo -n "CIDR," >> txtbdd.txt
suivant=6
;;
non | n | N | Non | NON )
suivant=6
;;
* )
echo "Erreur dans la saisie"
suivant=0
;;
esac
done

while [[ $suivant -eq 6 ]]
do
echo -n "Voulez vous afficher le Type (o/n) ?"
read mod
case "$mod" in
oui | o | O | Oui | OUI )
echo -n "idT," >> txtbdd.txt
x=$(wc -m txtbdd.txt | cut -d ' ' -f 1)
#echo $x
y=$(($x-1))
#echo $y
z=$(cat txtbdd.txt | cut -c 1-$y)
mysql -u$sqluser -p$sqlpass -e "use mgt; select $z from Equipement;"
mysql -u$sqluser -p$sqlpass -e "use mgt; select $z from Equipement;" > bddmgt.txt
suivant=7
;;
non | n | N | Non | NON )
x=$(wc -m txtbdd.txt | cut -d ' ' -f 1)
#echo $x
y=$(($x-1))
#echo $y
z=$(cat txtbdd.txt | cut -c 1-$y)
mysql -u$sqluser -p$sqlpass -e "use mgt; select $z from Equipement;"
mysql -u$sqluser -p$sqlpass -e "use mgt; select $z from Equipement;" > bddmgt.txt
suivant=7
;;
* )
echo "Erreur dans la saisie"
suivant=0
;;
esac
done
