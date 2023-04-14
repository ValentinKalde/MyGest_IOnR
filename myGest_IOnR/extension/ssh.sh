#!/bin/bash
source config.sh

if [[ $machine -eq 0 ]]
then
    echo -n "Confirmer l'installation d'openssh-client (o/n)" :
    read mod
    case "$mod" in
    oui | o | O | Oui | OUI )
    echo "Installation d'openssh-client..."
    echo $pass | sudo -p '' -S apt update -y  > /dev/null 2> apterror.txt
    echo $pass | sudo -p '' -S apt install -y openssh-client  > /dev/null 2> /dev/null
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
else
    echo -n "Confirmer l'installation d'openssh-server (o/n)" :
    read mod

    case "$mod" in
    oui | o | O | Oui | OUI )
        echo "Installation d'openssh-server..."
        echo $pass | sudo -p '' -S apt update -y  > /dev/null 2> apterror.txt
        echo $pass | sudo -p '' -S apt install -y openssh-server  > /dev/null 2> /dev/null
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
fi