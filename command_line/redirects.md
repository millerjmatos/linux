Definindo a saída de erro:

	ls -l /tmp/arquivo_desconhecido 2> saida.out

Inserindo a saída de erro no final do arquivo:
	
	ls -l /tmp/arquivo_desconhecido 2>> saida.out

Redirecionando a saída padrão e de erro para o mesmo arquivo:

	ls -l {Linux,LINUX}2 > saida.out 2>&1 

	mail -s "Assunto" sysadmin@mullertec.com.br < conteudo_do_email.txt

Redirecionando o arquivo pela entrada:

	cat linux.txt | tr 'a-z' 'A-Z'

	tr 'a-z' 'A-Z' < linux.txt

Definindo o aquivo e imprimindo na saída padrão:

	ls -l /tmp/ | tee arquivo.log

	sort linux.txt | tee resultado.log

	ls -l ~ | tee list.out
