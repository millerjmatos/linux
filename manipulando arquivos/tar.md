Agrupando conteúdo do /tmp/ no diretório atual:

	tar cpfv backup.tar /tmp/

Exibindo o conteúdo do backup.tar:

	tar tf backup.tar

Agrupando conteúdo do /tmp/ em outro diretório:

	cd /tmp/

	tar cf /home/user/dir/arquivo.tar *

Desagrupando o conteúdo do aqruivo .tar no diretório local:

	tar xvf backup.tar

Agrupando e comprimindo ao mesmo tempo com gzip:

	tar zcpfv backup.tgz /tmp/

Descomprimindo tar.gz com o tar para o diretório local:

	tar zxpfv backup.tgz -C .

Agrupando e comprimindo ao mesmo tempo com bzip2:

	tar jcpfv backup.tbz /tmp/

Agrupando e comprimindo ao mesmo tempo com xz:

	tar Jcpfv backup.txz /tmp/
