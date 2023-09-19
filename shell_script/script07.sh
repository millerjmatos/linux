#!/bin/bash

# Desenvolva um script que faça o seguinte:

# Rode um looping de leitura do arquivo /etc/passwd.
# Verifique se o usuário atual do looping é igual ao usuário da sessão atual do Bash ($USER).
# Se for, informe qual é o Nome Completo e o Shell (ambos estão no /etc/passwd).

while read linha; do
	usuario="`echo $linha | cut -d : -f 1`"
	if [ "$usuario" == "$USER" ]; then
		nome_completo="`echo $linha | cut -d : -f 5`" 
		shell="`echo $linha | cut -d : -f 7`"
		echo "O usuário $nome_completo usa o Shell $shell"
	fi	
done < /etc/passwd
