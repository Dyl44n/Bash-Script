#!/bin/bash
#Script criado para descobrir os hosts ativos utilizando o ping.
# O usuario deve informar a rede e o script deve  retornar os hosts que respondem ao ping.
if [ "$1" == "" ]
then
       	echo "Ping Sweep"
	echo "Modo de uso: $0 (Coloque o ip da rede)"
	echo "Exemplo: $0 192.168.0"
else
for host in {1..254};
do 
ping -c 1 $1.$host | grep "64 bytes" | cut -d ":" -f 1 | cut -d " " -f 4;
#64 bytes para informar que ouve resposta do ping.
#Filtro para isolar apenas o ip | cut -d ":" -f 1 | cut -d " " -f 4; 
done
fi
