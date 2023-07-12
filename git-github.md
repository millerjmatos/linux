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

Clonando um repositório do github localmente:

	git clone https://github.com/user/<nome_do_repositorio>.git

Atualizando o repositório local:

	git pull

Imprimindo todas as modificações:

	git status

Adicionando as mudanças ao repositório local:

	git add .

Salvando o estado atual do repositório:

	git commit -m "mensagem"

Enviando os dados para o repositório remoto:

	git push

Imprimindo os logs:

	git log --oneline

	git log -p

Descartando todas as alterações locais:

	git restore .

Voltando para um determinado momento e enviando:

	git restore --source <commit_code> .

	git commit . -m "mensagem" && git push