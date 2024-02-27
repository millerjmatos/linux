Imprime apenas os dados que ocorreram uma única vez:

	uniq arquivo.txt

Imprimindo as linhas duplicadas:

	uniq -d

Como é preciso que estejam em ordem sequêncial, podemos usar outra opção para resolver:

	sort arquivo.txt | uniq

Se quiser imprimir apenas o que estiver duplicado:

	sort arquivo.txt | uniq -d

Para informar a quantidade de cada ocorrência:

	sort arquivo.txt | uniq -c
