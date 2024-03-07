O comando pkill mata processos com base em seu nome ou outras propriedades, como o usuário que o iniciou ou o grupo de processos ao qual ele pertence.

Encerrando processos através do nome:

	pkill java

Reiniciando um processo:

	pkill -1 firefox -u <nome-do-usuário>

Encerrando a sessão de um usuário logado:

    pkill -u <nome-do-usuário>

Encerrando um processo específico de usuário:

    pkill -u <nome-do-usuário> <nome-do-processo>
