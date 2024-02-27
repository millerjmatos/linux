Imprimindo o gerenciador de serviços/inicialização do sistema (systemd ou SysVinit):

	ps -p 1

	stat /proc/1/exe

Contém scripts de inicialização do sistema (SysVinit):

	/etc/init.d/

Definindo o status/operação de algum serviço:

	/etc/init.d/cups status

	/etc/init.d/cups restart

O equivalente (systemd) em:

	/usr/lib/systemd/system/

Arquivo de configuração onde é definido o runlevel do sistema (SysVinit):

	 /etc/inittab

Imprimindo o runlevel atual do sistema:

	runlevel

		0: halt.

		1: rescue mode.

		5: multi user with X Windows System service.

		6: reboot.

Para trocar o runlevel (SysVinit):

	telinit <runlevel>

	init <runlevel>

	telinit --help

Imprimindo todas as unidades carregadas na memória:

	systemctl list-unit-files

Imprimindo os pontos de montagem ativos pelo systemd:

	systemctl list-units --type=mount	

Imprimindo o target atual do sistema:

	systemctl get-default

Definindo target default (systemd):

	systemctl set-default multi-user.target

Trocando o target para o modo de segurança:

	ls -l /usr/lib/systemd/system/ | grep runlevel

	systemctl isolate rescue.target

	systemctl isolate runlevel1.target

Imprimindo a quantidade de targets existentes:

	ls -l /lib/systemd/system/*target | wc -l

	systemctl list-unit-files --type=target
