Imprimindo arquivos por nome:

	find /home/ -name Linux

	find /home/ -iname Linux

Imprimindo arquivos de um usuário:

	find /home/ -user liveuser

Imprimindo arquivos por tamanho:
		
	find /home/ -type f -size +1G

Imprimindo diretórios por tamanho:

	find /home/ -type d -size +100M
	
	find . -type d -size -5M

Imprimindo arquivos por extensão/string:

	find . -type f -name "*.pst"

	find /home/ -name "arq*csv"

Imprimindo os arquivos do diretório local:

	find . -type f -mtime +120 -exec ls -lha {} \;

Imprimindo arquivos acessados há 7 dias pelo usuário por extensão:

	find /home/ -atime -7 -user muller -name "*.pdf"

Imprimindo arquivos alterados a 1 dia:

	find /home/ -ctime -1

Imprimindo arquivos alterados a mais de 2 dias:

	find /var/spool/ -ctime -2 | wc -l

Imprimindo arquivos modificados entre 30 e 90 dias pelo grupo vendas:
	
	find /home/ -type f -mtime +30 -mtime -90 -group vendas

Imprimindo os arquivos e diretórios com determinado nome e tempo de modificação:

	find /var -type f -name "*.gz" -mtime -2

	find /var -name "*config*" -type d

	find /home/ -type f -name "*.pdf" | xargs ls -l

Deletando arquivos e diretórios:

	find /home/ -type f -size +500M -delete

	find /caminho/do/diretorio -type f -mtime +120 -exec rm -f {} \;

	find . -ctime +2 -exec rm -f {} \;

	find . -size +100M -exec truncate -s 50M {} \;

    find . -type f -mtime +30 -exec rm -v {} +

    find . -type d -empty -delete

	find /home/ -type f -size +1G | xargs rm -v
