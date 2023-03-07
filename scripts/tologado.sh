#!/bin/bash
#  Verifica se determinado usuário esta "logado".
#
if  who | grep $1 > /dev/null
then
    echo "O $1 está logado!"
else
    echo "O $1 não esta logado!"
fi