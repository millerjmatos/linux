Imprimindo o final do arquivo:

	tail arquivo.txt

	tail -n5 arquivo.txt

Com essa opção o tail aguarda e imprime o final do arquivo em tempo real, útil para logs:

	tail -f arquivo.txt

Imprimindo as últimas 15 linhas do /etc/passwd, com o nome do usuário e seu ID, e ordenado pelo ID numérico:

	tail -n 15 /etc/passwd | cut -d":" -f1,3 | sort -t ":" -k2 -g

		"sort -t" Corresponde ao delimitador
	
		"-k2" Corresponde a referência para o ordenamento
	
		"-g" Ordena como números ao invés de como caracteres