Imprimindo os pacotes instalados na máquina:

	rpm -qa

	rpm -qa bash

Imprimindo as dependências necessárias para instalar o pacote:

	rpm -qR bash

Se o pacote não estiver instalado (avulso):

	rpm -qpR file-2.5.90.x86.rpm

Imprimindo informações de um pacote:

	rpm -q kernel

	rpm -qi bash

	rpm -qip <arquivo.rpm>

Imprimindo os arquivos que pertencem/instalados pelo pacote:

	rpm -ql bash

Imprimindo o programa que instalou determinando pacote:

	rpm -qf /etc/skel/.bashrc

Imprimindo os arquivos de configuração da instalação:

	rpm -qc bash

Imprimindo os arquivos de documentação da instalação:

	rpm -qd bash

Imprimindo quais são os arquivos de um determinado pacote:

	rpm -qlp <arquivo.rpm>

Instalando um pacote:

	rpm -i <arquivo.rpm>

Atualizando uma versão de um pacote já instalado:

	rpm -U <arquivo.rpm>

As opções -i e -U são geralmente acompanhadas de -vh.

Instalando um pacote com dependências:

	rpm -ivh --nodeps <arquivo.rpm>

Forçando a instalação:

	rpm -ivh --force <arquivo.rpm>

Simulando uma instalação antes de realizar:

	rpm -ivh --test <arquivo.rpm>

Verificando a integridade de um pacote:

	rpm -V <arquivo.rpm>

Se retornar mensagem, há algum erro!

Desinstalando um programa:

	rpm -evh <nome_do_programa>

Ignorando dependências usadas por outro programa:

	rpm -evh --nodeps <nome_do_programa>

Descomprimindo arquivos .RPM:

	rpm2cpio linux-5.x86_64.rpm > linux-5.cpio

	cpio -id < linux-5.cpio