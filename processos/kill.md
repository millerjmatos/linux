Imprimindo todos os sinais que são possíveis enviar aos processos:

	kill -l

Ao se pressionar "CTRL + C" o sinal 2 é enviado, interromper e encerrar:

	SIGINT

Ao se pressionar "CTRL + Z" o sinal 20 (SIGSTP) é enviado, interromper sem encerrar:

	top

	CTRL + Z

	jobs

	fg

Encerrando um processo:

	pgrep firefox

	ps -aux | grep firefox

	kill -s SIGKILL <PID>

	kill -s 9 <PID>

	kill -9 <PID>

	kill -SIGKILL <PID>

	kill <PID>

Encerrando processos através do nome:

	killall firefox

	killall java

	pkill firefox

killall mata processos com base em seus nomes exatos.

pkill mata processos com base em seu nome ou outras propriedades, como o usuário que o iniciou ou o grupo de processos ao qual ele pertence.

Sem nenhum parâmetro o kill, killall e pkill enviam o sinal de código 15 SIGTERM.

Reiniciando um processo:

	kill -1 <PID>

	pkill -1 firefox -u muller
