Definindo o arquivo /etc/ntp.conf:

		pool st1.ntp.br
		pool st2.ntp.br
		pool st3.ntp.br
		pool gps.ntp.br

		ou

		servers pool.ntp.br

	/etc/init.d ntp restart

Verificando o status do serviço:

	ntpq -p
		
	date
