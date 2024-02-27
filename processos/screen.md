Executando novas abas no mesmo terminal:

	apt-get install screen

	screen

	top

	CTRL+A c 

	ls -l /tmp/

	CTRL+A c

	echo "terceira aba"

Para alternar entre as abas:

	CTRL+A n

Saindo do screen:

	CTRL+A d

	screen -ls

Voltando para a sessão ativa do screen:

	screen -r

Fechando uma aba dentro do screen:

	exit

Abrindo uma sessão do screen diretamente com o comando:

	screen top
