#!/bin/bash
clear
echo "+++++++++++ Meu primeiro script +++++++++++"
echo " "
echo "O meu script se chama $0"
echo "Esse script recebeu $# parametros que sao: $1 e $2"
echo " "
echo -n "Digite um numero de 0 a 10: "
read VAR1
echo "O valor digitado foi $VAR1"
echo "fim do script!"

# Execute:

    # ./script02.sh