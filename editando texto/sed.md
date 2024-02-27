Definindo um string por outra com o sed:

	sed 's/Nome/NovoNome/' nomes.txt

Para não pular a linha ao fazer a alteração, utilizamos a flag global:

	sed 's/Nome/NovoNome/g' nomes.txt

	sed 's/Linux/LINUX/g' nomes.txt > nomes2.txt

Apagar linhas em um range:

	sed '3,5 d' nomes.txt

Apagar linhas com uma ocorrência de string específica:

	sed '/Nome/d' nomes.txt

	sed '/^#/d' nomes.txt
