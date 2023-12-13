Dividindo o arquivo:

	wc -l arquivo.txt

	split -l20 arquivo.txt

	ls -l
 
	split -l20 arquivo.txt novo_arquivo_

	wc -l novo_arquivo_*

Sem nenhum parâmetro, o split dividirá um arquivo em outros arquivos de 1000 linhas cada!
