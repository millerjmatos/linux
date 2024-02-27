Executando multiplas janelas de terminal simultaneamente:

	sudo apt install tmux

Criando uma nova tela:
	
	CTRL+B c

Renomeando um janela:

	CTRL+B ,

Navegando para a janela específica, anterior, próxima e última:

	CTRL+B 2

	CTRL+B p

	CTRL+B n

	CTRL+B l

O asterisco representa a janela atual.

Procurando uma janela:

	CTRL+B f

Listando todas as janelas abertas:

	CTRL+B w

Criando um painel:

	CTRL+B %

	CTRL+B "

Navegando entre os paineis:

	CTRL+B "seta para direira ou esquerda"

	CTRL+B o

Redimensionando um painel:

	CTRL+B CTRL+"seta para direira ou esquerda"

Encerrando o tmux:

	exit

	CTRL+B d

	CTRL+B $

	tmux ls

	tmux kill-session -t number_connection

Acessando um tmux bg ou criando um novo:

	tmx new -s new_connection

	tmux attach -t new_connection
