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
# TESTE DO IF
if [ $VAR4 -gt $VAR3 ] ; then
    echo "O sistema tem mais de $VAR3 usuários!"
else
    echo "O sistema tem menos de $VAR3 usuários!"
fi

echo "fim do script!"

# TESTE DO CASE
echo " "
case $VAR1 in 
0)
    echo "O valor digitado foi 0"
;;
1|2|3|4|5)
    echo "O valor digitado foi entre 1 e 5!"
sleep 3
;;
*)
    echo "O valor digitado foi maior que 5!!"
esac

# Execute:

    # ./script06.sh 17 8

