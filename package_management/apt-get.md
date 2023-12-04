Arquivo com as fontes de onde o apt obterá os pacotes: 

	/etc/apt/sources.list

Atualizando a lista de pacotes disponíveis nos repositórios: 

	apt-get update

Atualizando o sistema: 

	apt-get upgrade

Atualizando e reparando a base dados:

	apt-get -f install

Removendo o pacote "embirrento":

	apt-get -f remove

Diretório que armazena o cache de repositórios:

    /var/cache/apt/archives

Pesquisando pacotes por nome: 

	apt-cache search <pacote>

	apt search youtube

Imprimindo as dependências de um pacote: 

	apt-cache depends <pacote>

Realizando o download, sem a instalação:

	apt-get install <pacote> --download-only

    ls -l /var/cache/apt/archives

Imprimindo informações do pacote: 

	apt-cache show <pacote>

Pesquisando por repositórios mais rápidos: 

	apt-get install netselect-apt

Removendo um pacote instalado: 

	apt-get remove <pacote>

Removendo um pacote e sua base de dados:

	apt-get purge <pacote>

Removendo todo o cache de repositórios (libera mais espaço):

	apt-get clean

Removendo apenas os pacotes desatualizados e obsoletos do cache de repositórios:

	apt-get autoclean

Removendo pacotes que se tornaram obsoletos, pois foram instalados como dependências de outros pacotes:

	apt-get autoremove

Imprimindo um menu gerenciador do apt:

	apt-get install dselect

	dselect