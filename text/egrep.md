Pesquisando com o egrep:

	egrep "b[aei]g" arquivo.txt

	egrep "b[a-u]g" arquivo.txt

Imprimindo pelo final da linha:

	egrep "Linux$" arquivo.txt

Imprimindo pelo início da linha:

	egrep "^#" arquivo.txt

	egrep "^Linux" arquivo.txt

Imprimindo pelo início da linha e que não contém algo:

	egrep -v "^#" arquivo.txt

Não exige o caractere anterior ou que haja algo "*":

	egrep "b[a-i]g*" arquivo.txt

	egrep "b[a-i]g*e" arquivo.txt

Não exige o caractere anterior ou imprime se ele repetir mais vezes "?":

	egrep "b[a-i]g?" arquivo.txt

Exige com o caractere anterior uma ou mais vezes "+":

	egrep "b[a-i]g+" arquivo.txt

Imprime com ao menos um caractere após "." ou dois ".." ou três "...":

	egrep "b[a-i]g." arquivo.txt

Imprimindo linhas que contenham uma determinada palavra:

	egrep '\bLinux\b' arquivo.txt
