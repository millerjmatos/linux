Imprimindo as portas que estão ouvindo no seu servidor:

	lsof -i -n

	lsof -i -P -n | grep LISTEN

Imprimindo os arquivos abertos por um processo específico:

	lsof -p <PID>

Imprimindo os arquivos abertos em um diretório específico e subdiretórios:

	lsof +D /caminho/do/diretório

Imprimindo os arquivos abertos por um usuário específico:

	lsof -u user

Verificando uma porta específica:

	lsof -i :80
