Verificando a versão do vi e abrindo com um buffer vazio:

	vi --version

	vim

	vi

Definindo o arquivo com o vim:

	vim arquivo.txt

Pesquisando Linux dentro do arquivo:

	/Linux

A cada Enter o cursor irá a próxima ocorrência.

Busca uma ocorrência no sentido do início (baixo para cima):

	SHIFT+N

	?Linux

Entrando no modo de inserção no local do cursor:

	i

Saindo do modo de inserção:

	ESC

Entrando no modo de inserção na linha abaixo:

	o

Recortando uma linha e entrando no modo de inserção:

	cc

Colando o recorte no local do cursor:

	p

Recortando uma ou mais linhas sem entrar no modo de inserção:

	dd

	20dd

	d3d

Copiando uma ou mais linhas:

	yy

	y3y

Salvando e saindo do arquivo:

	:wq

	:x

	ZZ

Posicionando o cursor no início da última linha:

	:$

Numerando as linhas do arquivo:

	:set number

Para sair e salvar o arquivo:

	:wq nome_do_arquivo.txt

Definindo o editor padrão do sistema:

	select-editor

	export EDITOR=vim
