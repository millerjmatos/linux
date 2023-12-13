Imprimindo modificado a saída do texto utilizando strings:

	cat arquivo.txt | tr a-z A-Z

	cat arquivo.txt | tr -d A

	cat arquivo.txt | tr [:upper:] [:lower:]

	cat arquivo.txt | ' ' '_'

	cat arquivo.txt | tr -d [:upper:]

Imprimindo a saída sem repetições:

	echo "Curso Liiiiinux" | tr -s i

	echo "Curso        Linux" | tr -s " "

Gerando um arquivo de texto no formato Linux, sem CRLF:

	tr -d "\r" < ArquivoGeradoNoWindows.txt > NovoArquivoGerado.txt

	file Arqui* NovoA*
