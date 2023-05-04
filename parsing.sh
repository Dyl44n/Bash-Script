#!/bin/bash
#Script para identificar possiveis hosts no dominio especificado.
#O script baixa o index.html da pagina e cria um arquivo.txt com os dados do index, e posteriormente utiliza o metodo host para filtragem de informações. 
if [ "$1" =  "" ]
then
	echo "//////////////////////////////////////"
	echo "PARSING HTML"
	echo "By:D1l4n"
	echo "Exemplo: ./parsing.sh www.alvo.com.br"
	echo "//////////////////////////////////////"
else
figlet "RECON   HTML"
echo -e "\e[33m    BY: D1l4N \e[0m"
echo -e "\e[31m ////////////////////////////////////////////////// \e[0m"
echo -e "\e[31m  [+]  BAIXANDO INDEX.HTML: $1 \e[0m"
echo -e "\e[31m ///////////////////////////////////////////////// \e[0m"
$(wget $1)
echo -e "\e[31m //////////////////////////////////////////////// \e[0m"
echo -e "\e[31m [+] FILTRANDO RESULTADOS: $1\e[0m"
echo -e "\e[31m /////////////////////////////////////////////// \e[0m"
echo -e "\e[32m Sucesso!\e[0m"
grep href index.html | cut -d "/" -f  3 | grep "\." | cut -d '"'  -f 1 | grep -v "<li" > lista
for url in $(cat lista);
do host $url | grep "has address";
done
fi


