Git é um sistema de controle de versão distribuído, que permite que desenvolvedores gerenciem e acompanhem as alterações em um projeto de software ao longo do tempo. Ele permite que várias pessoas trabalhem no mesmo projeto simultaneamente, mantendo um histórico completo de todas as alterações e facilitando a colaboração.

O GitHub é uma plataforma de hospedagem de código-fonte baseada em git. Ela permite que desenvolvedores armazenem, gerenciem e compartilhem seus projetos de software. No GitHub, os projetos são armazenados em repositórios, que podem ser públicos ou privados. Os usuários podem clonar um repositório para o seu próprio computador, fazer alterações localmente e, em seguida, fazer o upload dessas alterações para o repositório original.

Instalando o git:

	apt install git

Checando a versão:

	git version

Configuração básica para os commits:

	git config --global user.name "Muller Jorge"

	git config --global user.email "contato@mullertec.com.br"

	git config user.name

	git config user.email

Configurando o editor:

	git config core.editor

	git config --global core.editor "<caminho_do_editor>"

Criando um repositório local:

	git init

	ls -a

		.git

> O conteúdo do projeto fica dentro do diretório .git

> O .git é o repositório onde ficam os containers. 

Imprimindo todas as modificações:

	git status

Criando os arquivos:

	touch a.txt b.txt

	git status

Adicionando arquivos ao container:

	git add a.txt b.txt

	git add .

	git status

Identificando e armazenando no repositório:

	git commit -m "01 - Criando os arquivos A e B."

	git status

	git log

	touch c.txt

	vim a.txt <TEXTO>

	git status

Adicionando o arquivo c.txt ao container:

	git add c.txt

Inserindo o commit ao projeto:

	git commit -m "02 - Criado o arquivo C e modificado o A."

	git status

Imprimindo as informações do repositório:

	git log

	git log --oneline

Imprimindo o grafo de commits:

	git log --graph

	git log --graph --oneline

	git log --graph --oneline --all

Adicionando ao container e inserindo o commit diretamente:

	vim a.txt <TEXTO2>

	git status

	git log

	git commit -am "03 - Alterando o arquivo A."

	git log --graph --oneline

Rastreando as mudanças pelo HEAD e retornando para uma versão anterior:

	git checkout <hash>

	git log --oneline

	git branch

Retornando para a última versão:

	git checkout master

	git log --oneline

	git branch

Desfazendo alterações:

	vim a.txt <TEXTO3>

	git diff

	git checkout a.txt

	vim a.txt <TEXTO4>

	git diff

	git status

	git add a.txt

	git status

> Agora a opção diff não imprime nenhuma alteração!

Verificando que arquivo foi adicionado (add) ao container:

	git diff

Desfazendo:

	git status

	git reset HEAD

	git reset HEAD <file>

	git status

	git diff

	git commit -am "04 - Removendo um commit."

	git log --oneline

Desfazendo um commit:

	git reset --hard <hash>

	git log --oneline

Criando uma nova ramificação do projeto:

	git checkout -b teste

	git branch

> Nesse momento todos os commits serão atribuidos a nova ramificação (ex. teste).

Mesclando a ramificação nova com a master:

	git merge <nome_do_ramo_a_fundir_com_o_ramo_master>

	git status

	git add .

	git commit -m "05 - Fusão dos ramos e resolução dos conflitos."

Verficiando se existe um repositório remoto:

	git remote

Acesse sua conta em https://github.com/

Crie um repositório através da interface em "+"

Enviando o projeto local para o Github:

	git remote add origin https://github.com/millerjmatos/nome_do_projeto.git
	
	git push -u origin main

Sicronizando as alterações:

	git status

	git add .

	git -m "new_commit"

	git push

> Vá até o repositório desejado no Github e em "Code" copie a url do campo https.

Clonando um repositório do Github localmente:

	git clone https://github.com/user/<nome_do_repositorio>.git

> Atentar para as informações do --global e credênciais da conta do Github.

Sicronizando as mudanças do Github para o repositório local:

	git pull