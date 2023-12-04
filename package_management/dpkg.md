Imprimindo informações de pacotes instalados: 

	dpkg -l

	dpkg --list

	dpkg --list | grep <nome>

	dpkg --get-selections

	dpkg --get-selections | wc -l

Imprimindo informações do pacote: 

	apt-cache show <pacote>

	dpkg -l firefox

	dpkg -s firefox

Imprimindo informações de um pacote não instalado:

	dpkg -I firefox_amd64.deb

	dpkg --contents <pacote.deb>

Instalando um pacote .deb: 

	dpkg -i <pacote.deb>

	dpkg -i --force-all <pacote.deb>

Imprimindo os arquivos instalados por um pacote (--listfiles):

	dpkg -L bash

Imprimindo as origens de um pacote (--search):

	dpkg -S bash

Removendo um pacote: 

	dpkg -r <pacote>

Removendo todos os arquivos e rastros de um pacote (--purge):

	dpkg -P <pacote>

Configurando e corrigindo erros causados por dependências:

	dpkg --configure -a

Atualizando configurações de um pacote instalado:

	dpkg -l | grep tzdata

	dpkg-reconfigure tzdata

	dpkg-reconfigure keyboard-configuration