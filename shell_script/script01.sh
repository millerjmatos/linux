#!/bin/bash
clear
echo "+++++++++++ Meu primeiro script +++++++++++"
echo " "
echo "O meu script se chama $0"
echo "Esse script recebeu $# parametros que sao: $1 e $2"
echo " "
uptime
free -m
echo "fim do script"

# Execute:

    # ./script01.sh valor01 valor02