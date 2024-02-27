Diretórios que sempre devem estar na mesma partição (/):

	/etc	/sbin	/bin	/proc	/sys	/dev	

São partições virtuais que são montadas dinamicamente pelo sistema:

	/proc	/sys	/dev	

Diretórios que podem ser montados em outras partições:

	/root	/boot	/tmp
	
	/home

		/home/user/.local/share/Trash/ -> lixeira

	/opt -> outras instalações, third-party apps
	
	/usr -> programas não críticos

		/usr/bin -> comandos não essenciais dos usuários comuns

		/usr/lib -> biblioteca de programas

		/usr/local -> programas instalados pelo sysadmin

		/usr/sbin -> comandos não essenciais

		/usr/share/man -> fontes do man de todos os programas instalados

	/var -> arquivos de log e dinâmicos

		/var/log

		/var/mail
