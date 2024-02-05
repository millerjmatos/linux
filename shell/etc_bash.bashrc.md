Editando o arquivo para toda nova sessão de shell bash, aplicado a todos os usuários:

	vim /etc/bash.bashrc

		alias inet="ip -br -c a"

		alias dt="date +%H:%M"

		alias kgn="kubectl get nodes"

		:wq

    inet

    dt

	source /etc/bash.bashrc
