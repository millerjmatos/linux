Imprimindo a permissão padrão do sistema:

	umask

Definindo a permissão do sistema:

	umask <0000>

Em uma sessão em que o valor do umask é 0002:

777 - 002 = 775 (diretórios)

666 - 002 = 664 (arquivos)

	drwxrwxr-x

	-rw-rw-r--
