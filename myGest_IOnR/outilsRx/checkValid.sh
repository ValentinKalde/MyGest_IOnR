#!/bin/bash
#TRISTAN
source config.sh
source install/infobdd.sh

#Variables couleurs
rouge='\e[0;31m'
vert='\e[0;32m'
neutre='\e[0;m'

echo > ip1.txt
echo > ip2.txt
echo > mgtip.txt
nb=1
mysql -u$sqluser -p$sqlpass -e "use mgt; select adIP from Equipement;" > mgtip.txt
x=$(wc mgtip.txt -l |cut -d ' ' -f 1)

while [[ nb -lt $x ]]
do
    let "nb=nb+1"
    ip=$(head -n "$nb" mgtip.txt | tail -n 1)
    echo "Requête ping vers l'adresse $ip " 
    rep=$(ping $ip -c 2 |grep " 0% packet loss" | wc -l)
        if [[ $rep -eq 1 ]]
        then
	        echo -e "${vert}" $ip >> ip1.txt
        else
	        echo -e "${rouge}" $ip >> ip2.txt
        fi
done
echo ""
echo "Adresse(s) IP répondant au(x) ping(s) :" 
cat ip1.txt
echo  -e "${neutre}"
echo "Adresse(s) IP ne répondant pas au(x) ping(s) :" 
cat ip2.txt
echo  -e "${neutre}"
