#!/bin/bash
source config.sh
source install/infobdd.sh
x=1
quit=1 
echo -e "Veuillez saisir le mot de passe SuperUtilisateur"
read -s pass

while [[ $quit -ne 0 ]]
do
echo -e "\nSur quelle type de machine ce trouve le programme ? :"
echo "1) Serveur"
echo "2) Client"
echo -e "Veuillez choisir une option :"
read choix
echo ""


case $choix in 
    1)
        echo "Installation des paquets du programme ..."
        machine=1
        echo $pass | sudo -p '' -S apt update -y > /dev/null 2> apterror.txt
        echo $pass | sudo -p '' -S apt install -y figlet mariadb-server nmap  > /dev/null 2> apterror.txt
        
        quit=0       
        ;;
    2)
        echo "Installation des paquets du programme ..."
        machine=0
        echo $pass | sudo -p '' -S apt update -y  > /dev/null 2> apterror.txt
        echo $pass | sudo -p '' -S apt install -y figlet lolcat mariadb-client nmap  > /dev/null 2> apterror.txt
        quit=0
        ;;
    *) 
        echo "Erreur dans la saisie"
esac
done
echo ""
echo "Importation de la Base de donnée"

echo "Utilisateur mysql existant sur la machine ? (o/n)"
read on
case "$on" in
oui | o | O | Oui | OUI )
echo "Connection à l'utilisateur mysql"
while [[ x -ne 0 ]]
do
echo -n "Utilisateur: "
read sqluser
echo -n "Mot de passe: "
read -s sqlpass
if [[ $sqluser = $sqlpass ]]
then
echo "Veuillez ne pas choisir un mot de passe identique au nom de l'utilisateur"
else
x=0
fi
done

	;;
non | n | N | Non | NON )
echo "Création d'un utilisateur mysql"
while [[ x -ne 0 ]]
do
echo -n "Utilisateur: "
read sqluser
echo -n "Mot de passe: "
read -s sqlpass
if [[ $sqluser = $sqlpass ]]
then
echo "Veuillez ne pas choisir un mot de passe identique au nom de l'utilisateur"
else
x=0
fi
done
echo $pass | sudo -p '' -S mysql -e "use mysql; create USER '$sqluser'@localhost identified by '$sqlpass'";
echo $pass | sudo -p '' -S mysql -e "grant all privileges on *.* to '$sqluser'@localhost with grant option";
;;
* )
echo "Erreur dans la saisie"
;;
esac


 
mysql -u $sqluser -p$sqlpass -e "CREATE DATABASE mgt";
mysql -u $sqluser -p$sqlpass mgt < install/myGestIOnR.sql;

if [[ $machine -eq 1 ]]
then
    #Fichier config pour serveur
    echo -e '#!/bin/bash\nmachine=1\npass='$pass''> config.sh
    echo -e '#!/bin/bash\nsqluser='$sqluser'\nsqlpass='$sqlpass'' >install/infobdd.sh
else
    #Fichier config pour client
    echo -e '#!/bin/bash\nmachine=0\npass='$pass''> config.sh
    echo -e '#!/bin/bash\nsqluser='$sqluser'\nsqlpass='$sqlpass'' >install/infobdd.sh

fi