Para realizar uma pesquisa com uma palavra:

	/pesquisa

O n busca a nova ocorrência. SHIFT+N busca a anterior.

CTRL+G informa onde você está no arquivo.

Verificando a versão do vi e abrindo com um buffer vazio:

	vi --version

	vim

	vi

Definindo o arquivo com o vim:

	vim arquivo.txt

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

Recortando uma ou mais linhas sem entrar no modo de inserção:

	dd

	20dd

	d3d

Copiando uma ou mais linhas:

	yy

	3yy

Colando o recorte no local do cursor:

	p

Salvando e saindo do arquivo:

	:wq

	:x

	ZZ

Posicionando o cursor no início da última linha:

	:$

Numerando as linhas do arquivo:

	:set number

Definindo o editor padrão do sistema:

	select-editor

Substituir todas as ocorrências de uma string no arquivo:

	:%s/antiga/nova/g
