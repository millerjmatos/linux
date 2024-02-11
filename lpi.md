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

------------------------------------------------------------

	* * * * * Topic 102: Linux Installation and pacoteage Management * * * * * 

------------------------------------------------------------
	* * * * * 102.1 Design hard disk layout * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Distribuir os sistemas de arquivos e o espaço de swap para separar partições ou discos.
	Adaptar o projeto para o uso pretendido do sistema.
	Garantir que a partição /boot esteja em conformidade com os requisitos de arquitetura de hardware para a inicialização.
	Conhecimento das características básicas do LVM.

------------------------------------------------------------
	* * * * * 102.2 Install a boot manager * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Fornecer locais de boot alternativos e backup das opções de boot.
	Instalar e configurar um gerenciador de inicialização como o GRUB Legacy.
	Realizar mudanças na configuração básica do GRUB 2.
	Interagir com o carregador de boot.

Imprimindo as imagens do kernel:

	cd /boot/

	ls -l

Imprimindo os arquivos de configuração do grub:

	cd /boot/grub/

	ls -l

Lembre-se de que modificar diretamente o arquivo /boot/grub/grub.cfg não é recomendado.

Imprimindo a versão do grub:

	update-grub --version

Atualizando o grub:

	update-grub

	update-grub > /boot/grub/grub.cfg

	grub.mkconfig > /boot/grub/grub.cfg

	grub.mkconfig -o /boot/grub/grub.cfg

Após o uso dos comandos update-grub ou grub-mkconfig é que o arquivo grub.cfg será atualizado:

	/boot/grub/grub.cfg

	ls -l /boot/grub/grub.cfg

E são obtidos as informações nos arquivos de configuração em:

	/etc/default/grub

	/etc/grub.d/*

O parâmetro que indica o kernel que deve ser utilizado durante o boot:

	linux

O parâmetro que indica ao kernel que não exiba mensagens durante o boot:

	quiet

O parâmetro que indica o caminho do initial ramdisk que o GRUB deve carregar:

	initrd

Realizando o backup do grub:

	dd if=/dev/sda of=copia.mbr bs=1 count=512

Restaurando o backup:

	dd if=copia.mbr of=/dev/sda

------------------------------------------------------------
	* * * * * 102.3 Manage shared libraries * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Identificar as bibliotecas compartilhadas.
	Identificar onde geralmente essas bibliotecas se localizam no sistema.
	Carregar as bibliotecas compartilhadas.

Imprimindo quais/quantas bibliotecas utilizadas pelo programa:

	whereis vi

	ldd /usr/bin/vi

	ldd /usr/bin/vi | wc -l

Todos os arquivos terminados em .so são bibliotecas!

O comando ldconfig atualiza as configurações em:

	/etc/ld.so.cache

Principais arquivos de configuração:

	ls -ld /etc/ld.so*

A variável LD_LIBRARY_PATH é geralmente configurada no arquivo de configuração do sistema:

	/etc/environment
	
	/etc/ld.so.conf

Essa variável é usada pelo sistema operacional Linux para encontrar bibliotecas compartilhadas (arquivos com extensão .so) que são necessárias para executar um determinado programa. 

Pode ser configurada para definir temporariamente a localização de uma biblioteca.

Se a biblioteca está localizada em /home/user/my_library:

	export LD_LIBRARY_PATH=/home/user/my_library

Imprimindo todas as bibliotecas utilizadas pelo sistema:

	ldconfig -p |less

Adicionando o diretório e as bibliotecas contidas em: 

	ls -l /etc/ld.so.cache

	mkdir /tmp/lib

	ldconfig -p |grep "/tmp/lib"

	vim /etc/ld.so.conf

		include /etc/ld.so.conf.d/*.conf
		/tmp/lib/

		:wq

	ldconfig

	ldconfig -p |grep "/tmp/lib"

	ls -l /etc/ld.so.cache

Adicionando o diretório e as bibliotecas contidas na sessão atual:

	export LD_LIBRARY_PATH=/tmp/lib/

	env | grep LIBRARY
-
------------------------------------------------------------
	* * * * * 102.6 Linux as a virtualization guest * * * * *
------------------------------------------------------------

Imprimindo informações detalhadas sobre o hardware do sistema:

	dmidecode -t system

	lshw -class system
