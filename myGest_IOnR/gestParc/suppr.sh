#!/bin/bash
#VALENTIN
source install/infobdd.sh

echo -n "Donner l'id de l'équipement à supprimer : "
read id

mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement where id like '$id';"

echo -n 'Confirmer la suppression (o/n) : '
read mod

case "$mod" in
oui | o | O | Oui | OUI )
echo "L'équipement a bien été supprimé"
    mysql --user=$sqluser --password=$sqlpass -e "use mgt; Delete from Equipement where id like $id;"
	;;
non | n | N | Non | NON )
echo "Annulation de la suppression"
;;
* )
echo "Erreur dans la saisie"
;;
esac