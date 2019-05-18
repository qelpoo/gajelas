#!/bin/bash

// Makasih buat Arvan Apriyana // Tatsumi Crew
// saya ambil beberapa codenya dari https://github.com/nako48/Checker-webshell/blob/master/scan.sh

HIJAU='\033[0;32m'
MERAH='\033[0;31m'
NORMAL='\033[0m'
PUTIH='\033[1;37m'
waktu=$(date '+%d:%m:%Y')
ndase(){
clear
printf "${HIJAU}
	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	=	qelpoo mass shell checker 	=
	=	fhallaw me @qelpoo		=
	=					=
	= Semarang Crew @ ${waktu}		=
	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
"
}
ngecurl(){
	site="${1}"
	curl=$(curl -s -I "$site")
	if [[ ! $curl =~ "200" ]]; then
		printf "${MERAH}[Die] => $site\n"
		echo "[DIE] $site" >> die.txt
	else
		printf "${HIJAU}[Live]/[Found] => $site\n"
		echo "[LIVE] $site" >> live.txt
	fi
}
ndase
echo ""
printf "${PUTIH}list dirmu: 

"
ls
echo "--------------------"
echo "list shellmu: "; read list
if [ ! -f $list ]; then 
	echo "$list is Not Found"
	exit
fi
persend=1
setleep=3

itung=1

    x=$(gawk '{ print $1 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'url=($x)'
for (( i = 0; i < "${#url[@]}"; i++ )); do
	set_kirik=$(expr $itung % $persend)
    if [[ $set_kirik == 0 && $itung > 0 ]]; then
        sleep $setleep
    fi
    urnna="${url[$i]}"
    ngecurl $urnna &
    itung=$[$itung+1]
done
