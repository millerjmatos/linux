	* * * * * Topic 101: System Architecture * * * * * 

------------------------------------------------------------
	* * * * * 101.1 Determine and configure hardware settings * * * * * 
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Habilitar e desabilitar periféricos integrados.
	Diferenciar entre vários tipos de dispositivos de armazenamento.
	Determinar os recursos de hardware para os dispositivos.
	Ferramentas e utilitários para a listar várias informações de hardware (por exemplo, lsusb, lspci, etc...).
	Ferramentas e utilitários para manipular dispositivos USB.
	Compreensão conceitual de sysfs, udev e dbus.

Onde ficam os módulos:

	/lib/modules/*

Cada conjunto de módulos é associado a uma versão de kernel:

	uname -r

	cd /lib/modules/4.8.0-46-generic/kernel/

	cd sound/pci/

Todos os arquivos terminados com a extensão *.ko são módulos/drivers para algum dispositivo de hardware.

Arquivo onde podemos definir módulos a serem carregados pelo sistema manualmente:

	/etc/modules/*

	/lib/modules/*

Ele consulta as informações que estão em:

	cat /proc/modules

Nesse momento o mouse não funciona mais na máquina. Para reverter:

	insmod <caminho completo informado no campo filename do comando modinfo psmouse>

O insmod não carrega as dependências! O comando modprobe o faz:

	lsmod | grep blue

	modprobe bluecard_cs

	lsmod | grep blue

Carregando e removendo um módulo:

	modprobe batman-adv

	lsmod |grep batman

	modprobe -r batman-adv

O modprobe é uma ferramenta mais avançada do que insmod e rmmod, usados para gerenciar módulos do kernel no Linux. 

O modelo da CPU:

	cat /proc/cpuinfo

Imprimindo os IRQ associados aos dispositivos de hardware:

	cat /proc/interrupts

A IRQ 1 é geralmente associada ao teclado devido à sua prioridade na entrada de dados.

Imprimindo informações dos dispositivos SCSI:

	cat /proc/scsi/scsi

	lsblk -d

Dameon responsável por tratar eventos relacionados ao gerenciamento de energia:

	acpid

------------------------------------------------------------
	* * * * * 101.2 Boot the system	* * * * * 
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Fornecer os comandos e opções mais comuns para o gerenciador de inicialização e para o kernel durante a inicialização.
	Demonstrar conhecimento sobre a sequência de inicialização do BIOS/UEFI até sua conclusão.
	Entendimento do SysVinit e do systemd.
	Noções do Upstart.
	Conferir os arquivos de log dos eventos de inicialização.

Em sistemas que utilizam a BIOS, as informações utilizadas durante a fase do boot estão em:

	MBR (Master Boot Record)

Inclui as informações das tabelas de partições e do bootloader (GRUB).

O particionamento MBR permite no máximo 4 partições primárias, ou 3 primárias e 1 estendida. Na partição estendida são associadas as partições lógicas.

Durante o processo de inicialização de um Linux, o processo responsável por selecionar e executar o kernel e o initrd é o bootloader:

	Bios > MBR > Bootloader > Kernel > Initrd, Init > Runlevel

O UEFI obtém as informações dos BootLoader diretamente da partição ESP (EFI System Partition), que é por padrão montada em:

	 /boot/efi/*
	 
Ele é utilizado no lugar da BIOS e não utiliza MBR.

Imprimindo os logs de boot do sistema em systemd-journal:

	journalctl -b

	dmesg

Identificando o kernel carregado no boot:

	dmesg | head

	dmesg | grep BOOT_IMAGE

	journalctl -b | grep BOOT_IMAGE

O arquivo do /proc que contém os parâmetros enviados ao kernel no momento do boot:

	cmdline

------------------------------------------------------------
	* * * * * 101.3 Change runlevels / boot targets and shutdown or reboot system * * * * * 
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Definir o runlevel padrão e o alvo de boot padrão.
	Alternar entre os runlevels/targets de boot, incluindo o modo single user (usuário único).
	Desligar e reiniciar através da linha de comando.
	Alertar os usuários antes de mudar o runlevel/target de boot ou outro evento de sistema que acarrete uma mudança significativa.
	Terminar apropriadamente os processos.
	Noções de acpid.

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

Definindo o status/operação de algum serviço (systemd):

	systemctl <status start stop reload restart enable disable is-enabled> <service>

Agendando o reboot para daqui 10m:

	shutdown -r +10

Agendando o reboot para 19h:

	shutdown -r 19:00

Agendando o desligamente para 20h:

	shutdown -rP 20:00

Cancelar o comando shutdown:

	shutdown -c

Enviando uma mensagem para todos os usuários do sistema:

	wall "Olá!"
