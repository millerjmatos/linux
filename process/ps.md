Imprimindo os processos ativos nesse terminal:

	ps

Incluindo os processos associados ao usuário atual:

	ps -u

Incluindo processos não associados ao terminal:

	ps -ux | less

Incluindo todos os processos do sistema:

	ps aux | less

Imprimindo os processos em formato de "árvore":

	ps -auxf | less

	pstree

	pstree -p

Filtrando processos:

	ps -aux | grep java

Imprimindo o ID do processo:

	pgrep bash

	pgrep bash -u root

	pgrep --help
