Comando que informa o número de linhas, palavras e bytes do arquivo:

	wc arquivo.txt

	wc -l arquivo.txt

O número de linhas do arquivo /etc/passwd sem contar linhas que contenham a palavra "daemon":

	grep -v "daemon" /etc/passwd | wc -l

O * imprime o resultado de todos os arquivos do diretório atual ou desejado:

	cd /var/log && wc * | sort
