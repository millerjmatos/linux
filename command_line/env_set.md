Imprimindo os diretórios de consulta do seu PATH:

	env | grep "$PATH"

Imprimindo apenas variáveis globais:

	env | less

Imprimindo variáveis locais e globais:

	set | less

Excluindo uma variável:

	unset <NOME_VARIÁVEL>

Algumas variáveis de ambiente definidas pelo sistema:

	$HISTFILE, $HOSTNAME, $LANG, $LOGNAME, $PATH, $SHELL, $TERM