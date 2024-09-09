Imprimindo os maiores processos em execução:

	ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -10

Imprimindo os processos de forma hierárquica:

	ps -ef

Incluindo os processos associados ao usuário atual:

	ps -u

Incluindo processos não associados ao terminal:

	ps -ux | less

Incluindo todos os processos do sistema:

	ps -aux | less

Imprimindo os processos em formato de "árvore":

	ps -auxf | less

	pstree

	pstree -p

Filtrando processos:

	ps -aux | grep java
