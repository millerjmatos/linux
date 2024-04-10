Imprimindo por nome:

	find <diretório/> -name Linux

	find <diretório/> -iname Linux

Imprimindo arquivos de um usuário:

	find <diretório/> -user liveuser

Imprimindo por tamanho:
		
	find <diretório/> -type f -size +1G

	find <diretório/> -type d -size +100M
	
	find . -type d -size -5M

Imprimindo por extensão/string:

	find . -type f -name "*.pst"

	find <diretório/> -name "arq*csv"

Imprimindo por tempo:

	find <diretório/> -ctime -1

	find . -type f -mtime +120 -exec ls -lha {} \;

	find <diretório/> -atime -7 -user muller -name "*.pdf"
	
	find <diretório/> -type f -mtime +30 -mtime -90 -group vendas

	find <diretório/> -type f -name "*.gz" -mtime -2

	find <diretório/> -type d -name "*config*"

	find <diretório/> -type f -name "*.pdf" | xargs ls -l

Deletando:

	find <diretório/> -type f -size +500M -delete

	find <diretório> -type f -mtime +120 -exec rm -f {} \;

	find . -ctime +2 -exec rm -f {} \;

	find . -size +100M -exec truncate -s 50M {} \;

    find . -type f -mtime +30 -exec rm -v {} +

    find . -type d -empty -delete

	find <diretório/> -type f -size +1G | xargs rm -v
