Definindo o arquivo de configuração do crontab:

	vim /etc/crontab

Agendando uma tarefa semanal de backup sábado às 19h:

	00 19 * * 6 root rsync -Cravzp --delete <origem> <destino>

	Ver: https://crontab.guru/

Editando o arquivo de configuração:

Em: /etc/crontab

	crontab -e

Listando os agendamentos:

	crontab -l

Permitindo e bloqueando usuários:

	vim /etc/cron.allow

	vim /etc/cron.deny

		user
