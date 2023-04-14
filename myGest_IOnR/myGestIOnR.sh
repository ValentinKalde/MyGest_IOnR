#!/bin/bash
source fonction.sh
source config.sh

configexist=$(wc -l config.sh | cut -d ' ' -f 1)
if [[ $configexist -eq 1 ]];
then
bash install/install.sh
fi
bash menu.sh

