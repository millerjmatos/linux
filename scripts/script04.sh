#!/bin/bash
clear
VAR2="Curso Linux"
VAR3=10
VAR4=`cat /etc/passwd |wc -l`
VAR5=$(date +%H)
echo "+++++++++++ Meu primeiro script +++++++++++"
echo " "
echo "O meu script se chama $0"
echo "Esse script recebeu $# parametros que sao: $1 e $2"
echo " "
echo -n "Digite um numero de 0 a 10: "
read VAR1
echo "O valor digitado foi $VAR1"
echo " "
echo "O arquivo /etc/passwd possui $VAR4 linhas e a hora atual é $VAR5"
echo " "
echo "Esse curso é nota $VAR3"
echo " "
echo "fim do script!"

# Execute:

    # ./script04.sh 3 4

