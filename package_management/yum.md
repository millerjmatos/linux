Imprimindo os pacotes disponíveis para atualização:

	yum check-update

Atualizando o sistema:

	yum update

Atualizando o sistema e removendo pacotes obsoletos:

	yum upgrade

	yum update --obsolete

Diretório do yum que armazena o cache de repositórios:

	ll /var/cache/yum

Removendo todo o cache de repositórios (libera mais espaço):

	yum clean all

Removendo apenas os pacotes desatualizados e obsoletos do cache de repositórios:

	yum clean packages

Removendo pacotes que se tornaram obsoletos, pois foram instalados como dependências de outros pacotes:

	yum autoremove

Pesquisando pacotes por nome: 

	yum search <pacote>

Instalando, removendo e pesquisando o pacote:

	yum <erase install remove> <pacote>

Arquivo de configuração principal:

	/etc/yum.conf

Arquivos de configuração dos repositórios:

	/etc/yum.repos.d

Verificando os pacotes instalados:

	yum list

	yum list installed | grep firewalld

O dnf é uma melhoria do yum e já vem como padrão no Fedora/Rocky Linux:

	which yum

	ls -l /usr/bin/yum

Os comandos dnf são praticamente os mesmos:

	dnf <install remove search> <arquivo>

	dnf --help

	dnf list

Removendo versões antigas de kernel:

	dnf remove -y --oldinstallonly --setopt installonly_limits=1 kernel