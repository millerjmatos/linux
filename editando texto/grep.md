Pesquisando em um arquivo de texto:

	grep Linux arquivo.txt

Contando a ocorrência:

	grep -c Linux arquivo.txt

Pesquisando em varios arquivos de texto:

	grep Linux *

	grep Linux arq*

Imprimindo a pesquisa ignorando diferenças entre maiúsculas/minúsculas:

	grep -i Linux *

Imprimindo todas as linhas que iniciam com a string:

	grep "^<STRING>" arquivo.txt

Imprimindo todas as linhas que terminam com a string:

	grep "<STRING>$" arquivo.txt

Imprimindo todas as linhas que NÃO correspondem com a string:

	grep -v Linux arquivo.txt

Imprimindo o número de linhas vazias em um arquivo:

	grep -c "^$" arquivo.txt

Imprimindo recursivamente:

	grep -r Linux *.txt

Imprimindo o nome e o caminho do arquivo que contenham "ethX":

	grep -lr ethX /etc/*
