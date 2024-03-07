Este comando é utilizado para exibir as bibliotecas dinâmicas necessárias por um executável. Ele fornece informações sobre as dependências de bibliotecas do programa em questão.

Imprimindo quais/quantas bibliotecas são utilizadas por determinado programa:

	whereis vi

	ldd /usr/bin/vi

	ldd /usr/bin/vi | wc -l

Todos os arquivos terminados em .so são bibliotecas.
