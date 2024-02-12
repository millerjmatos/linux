Copiando um arquivo para o diretório tmp:

	cp arquivo.txt /tmp/

Perguntando antes de sobrescrever um arquivo no destino:

	cp -i arquivo.txt /tmp/

O cp por padrão não copia diretórios. Para isso:

	cp -r Diretorio/ /tmp/

Copiando e preservando as características:

	cp -p arquivo.txt /tmp/

Copiando um arquivo para um novo arquivo:

	cp arquivo1.txt arquivoNovo.txt

	cp arquivo1.txt /tmp/arquivoNovo2.txt
