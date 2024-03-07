Imprimindo quais/quantas bibliotecas são utilizadas pelo programa:

	whereis vi

	ldd /usr/bin/vi

	ldd /usr/bin/vi | wc -l

Todos os arquivos terminados em .so são bibliotecas.

O comando ldconfig atualiza as configurações em:

	/etc/ld.so.cache

Principais arquivos de configuração:

	ls -ld /etc/ld.so*

A variável LD_LIBRARY_PATH é geralmente configurada no arquivo de configuração do sistema:

	/etc/environment
	
	/etc/ld.so.conf

Essa variável é usada pelo sistema operacional Linux para encontrar bibliotecas compartilhadas (arquivos com extensão .so) que são necessárias para executar um determinado programa. 

Pode ser configurada para definir temporariamente a localização de uma biblioteca.

Se a biblioteca está localizada em /home/user/my_library:

	export LD_LIBRARY_PATH=/home/user/my_library

Imprimindo todas as bibliotecas utilizadas pelo sistema:

	ldconfig -p |less

Adicionando o diretório e as bibliotecas contidas em: 

	ls -l /etc/ld.so.cache

	mkdir /tmp/lib

	ldconfig -p |grep "/tmp/lib"

	vim /etc/ld.so.conf

		include /etc/ld.so.conf.d/*.conf
		/tmp/lib/

		:wq

	ldconfig

	ldconfig -p |grep "/tmp/lib"

	ls -l /etc/ld.so.cache

Adicionando o diretório e as bibliotecas contidas na sessão atual:

	export LD_LIBRARY_PATH=/tmp/lib/

	env | grep LIBRARY
