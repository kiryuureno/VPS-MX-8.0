#!/bin/bash

rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Argentina/Tucuman /etc/localtime &>/dev/null
rm $(pwd)/$0 &> /dev/null

### COLORES Y BARRA 
msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}";;
  "-bar2"|"-bar")cor="${VERMELHO}======================================================" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
 esac
}

clear
 msg -bar2
 msg -ama "     [ VPS - MX - SCRIPT \033[1;97m ❌ MOD By @Kalix1 ❌\033[1;33m ]"
 echo -e  "\033[1;97m               EJECUTANDO ACTULIZADOR  \033[1;34m "
 msg -bar2
## Script name
SCRIPT_NAME=vpsmxup
## Install directory
WORKING_DIR_ORIGINAL="$(pwd)"
INSTALL_DIR_PARENT="/usr/local/vpsmxup/"
INSTALL_DIR=${INSTALL_DIR_PARENT}${SCRIPT_NAME}/
## /etc/ config directory
mkdir -p "/etc/vpsmxup/"

## Install/update
if [ ! -d "$INSTALL_DIR" ]; then
	echo -e  "\033[1;97m           Instalando Paquetes Prioritarios"
	echo "           --------------------------------"
	sleep 2
	mkdir -p "$INSTALL_DIR_PARENT"
	cd "$INSTALL_DIR_PARENT"
    wget https://raw.githubusercontent.com/kiryuureno/VPS-MX-8.0/master/zzupdate-master/zzupdate.default.conf -O /usr/local/vpsmxup/vpsmxup.default.conf  &> /dev/null
	#chmod +x /usr/local/vpsmxup/vpsmxup.default.conf 
	rm -rf /usr/local/vpsmxup/vpsmxup.sh
    wget https://raw.githubusercontent.com/kiryuureno/VPS-MX-8.0/master/zzupdate-master/zzupdate.sh -O /usr/local/vpsmxup/vpsmxup.sh &> /dev/null
	chmod +x /usr/local/vpsmxup/vpsmxup.sh
	rm -rf /usr/bin/vpsmxup
    wget https://raw.githubusercontent.com/kiryuureno/VPS-MX-8.0/master/zzupdate-master/zzupdate.sh -O /usr/bin/vpsmxup &> /dev/null
	chmod +x /usr/bin/vpsmxup
	echo -e  "\033[1;97m              Copiando Instalador Interno "
	
	echo "           --------------------------------"	
	
	msg -bar2
	sleep 2
else
	echo ""
fi

ubu16_fun () {
    wget -O /etc/apt/sources.list https://github.com/kiryuureno/VPS-MX-8.1/raw/master/Repositorios/16.04/sources.list &> /dev/null
	echo -e "\033[1;97m SELECCIONO UBU 16"
}

ubu18_fun () {
    wget -O /etc/apt/sources.list https://github.com/kiryuureno/VPS-MX-8.1/raw/master/Repositorios/18.04/sources.list &> /dev/null
	echo -e "\033[1;97m OK UBU 18"
}	

otro_fun () {
    
	echo "OK OTRO"
}

	echo -e "\033[1;97m           ---- QUE UBUNTU ESTA USANDO ----"
	echo -e "\033[1;97m  Digite solo el numero segun su respuesta: "
    msg -bar
    echo -e "\033[1;97m Escoja la opcion deseada."
    msg -bar
    echo " 1).- Ubuntu 16.04 "
    echo " 2).- Ubuntu 18.04 "
    echo " 3).- Otro "
	msg -bar
	echo -n "Digite solo el numero segun su respuesta: "
    read opcao
    case $opcao in
    1)
    ubu16_fun 
    ;;
    2)
    ubu18_fun
    ;;
    3)
    otro_fun
    ;;
    esac
	
sleep 3

wget https://raw.githubusercontent.com/kiryuureno/VPS-MX-8.0/master/VPS-MX.sh -O /usr/bin/VPS-MX &> /dev/null
chmod +x /usr/bin/VPS-MX

## Restore working directory
cd $WORKING_DIR_ORIGINAL
vpsmxup
