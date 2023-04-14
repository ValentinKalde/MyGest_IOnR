#!/bin/bash
#TRISTAN
source install/infobdd.sh

echo "Que souhaitez vous consulter :"
quitter=1

while [[ $quitter -ne 0 ]]
do
echo "1) Toutes les informations"
echo "2) Seulement les machines"
echo "3) Seulement les switchs"
echo "4) Seulement les serveurs"
echo "0) Retour au menu précédent"
echo -e "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement"
		;;
	2 )
		mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement where idT like '1';"
		;;
	3 )
        mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement where idT like '2';"
        ;;
    4 )
        mysql --user=$sqluser --password=$sqlpass -e "use mgt; Select * from Equipement where idT like '3';"
        ;;    
    0 )
		quitter=0
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done

