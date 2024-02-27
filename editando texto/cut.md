Imprimindo o arquivo removendo os 5 primeiros caracteres:

	cut -c1-5 arquivo.txt

Caracteres em posições específicos:

	cut -c1,2,5 arquivo.txt

Do caractere específico em diante:

	cut -c5- arquivo.txt

Definindo um delimitador:

	cut -d" " -f1 arquivo.txt

Logins de todos os usuários do sistema contidos no arquivo passwd:

	cut -d: -f1 /etc/passwd
