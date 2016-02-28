#!/bin/bash
#
# sbruselario@frro.utn.edu.ar
#
#
#
#Se pueden agregar argumentos:
#	bash cuandollega.sh 103 8021
#	bash cuandollega.sh [linea] [parada]
#
#

############################## FUNCIONES
function getSMS {
	VAR=$(wget "http://www.etr.gov.ar/ajax/getSmsResponse.php" --post-data "parada=$2&linea=$1"  -q -t 2 --timeout=10 --no-check-certificate -O - )
	buscar=" - "
	remplazo="\n"
	VAR=`echo ${VAR:11}` #quito "Resultado: "
	echo -e ${VAR/$buscar/$remplazo} #pongo salto de línea entre banderas
}  


function logo {
	echo -e "\n\t   ____        __            _       _     _                 ___   "
	echo -e   "\t  / ___|   _  /_/_ _ __   __| | ___ | |   | | ___  __ _  __ |__ | "
	echo -e   "\t | |  | | | |/ _  | '_ \ / _  |/ _ \| |   | |/ _ \/ _  |/ _  |/ /"
	echo -e   "\t | |__| |_| | (_| | | | | (_| | (_) | |___| |  __/ (_| | (_| |_| "
	echo -e   "\t  \____\__,_|\__,_|_| |_|\__,_|\___/|_____|_|\___|\__, |\__,_(_)  "
	echo -e   "\t                                          Rosario |___/          \n\n"
	#echo -e "\033[1A \t\tRosario"
}
  

   

############################## MAIN
clear
logo
#while true
#do

	if [[ ("$1" != "") && ("$2" != "") ]]
	then
		linea=$1 
		parada=$2
		echo -e "Linea: $linea\nParada: $parada"

	else
		echo -n "Ingrese número de línea: "
		read linea
		echo -n "Ingrese parada: "
		read parada
		
	fi

	echo -e -n "\033[2A\t\t\t\t\t\t"
	date
	echo -e -n "\n\n"
	getSMS $linea $parada
	echo -e "\n"
#done

exit 1




