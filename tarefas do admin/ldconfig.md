Esse comando é utilizado para atualizar o cache do sistema das bibliotecas compartilhadas. Ele é fundamental para garantir que o sistema possa localizar e carregar corretamente as bibliotecas dinâmicas quando um programa é executado.

Imprimindo todas as bibliotecas utilizadas pelo sistema:

	ldconfig -p |less

O comando ldconfig atualiza as configurações em:

	/etc/ld.so.cache

É possível configurar temporariamente a localização de uma biblioteca utilizando o seguinte formato, por exemplo, para a biblioteca localizada em /home/user/my_library:

    export LD_LIBRARY_PATH=/home/user/my_library
