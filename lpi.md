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

------------------------------------------------------------
	* * * * * 102.5 Use RPM and YUM pacoteage management * * * * *
------------------------------------------------------------
------------------------------------------------------------
	* * * * * 102.6 Linux as a virtualization guest * * * * *
------------------------------------------------------------

Imprimindo informações detalhadas sobre o hardware do sistema:

	dmidecode -t system

	lshw -class system

------------------------------------------------------------

	* * * * * Topic 103: GNU and Unix Commands * * * * *

------------------------------------------------------------
	* * * * * 103.1 Work on the command line * * * * *
------------------------------------------------------------
------------------------------------------------------------
	* * * * * 103.2 Process text streams using filters * * * * *
------------------------------------------------------------
------------------------------------------------------------
	* * * * * 103.3 Perform basic file management * * * * *
------------------------------------------------------------
------------------------------------------------------------
	* * * * * 103.4 Use streams, pipes and redirects * * * * *
------------------------------------------------------------

Definindo a saída padrão:

	ls -l > saida.out

	ls -l 1> saida.out

	echo Linux > saida.out

Se o arquivo já existir ele será substituído.

Inserindo a saída no final do arquivo:

	echo Linux1 > saida.out
	
	echo Linux2 > saida.out

	cat saida.out

Definindo a saída de erro:

	ls -l /tmp/arquivo_desconhecido 2> saida.out

Inserindo a saída de erro no final do arquivo:
	
	ls -l /tmp/arquivo_desconhecido 2>> saida.out

Redirecionando a saída padrão e de erro para o mesmo arquivo:

	ls -l {Linux,LINUX}2 > saida.out 2>&1 

	mail -s "Assunto" sysadmin@mullertec.com.br < conteudo_do_email.txt

Redirecionando o arquivo pela entrada:

	cat linux.txt | tr 'a-z' 'A-Z'

	tr 'a-z' 'A-Z' < linux.txt

Definindo o aquivo e imprimindo na saída padrão:

	ls -l /tmp/ | tee arquivo.log

	sort linux.txt | tee resultado.log

	ls -l ~ | tee list.out

Imprimindo na saída padrão o resultado de um comando:

	echo "A versão do kernel é: " `uname -r`

	echo "A versão do kernel é: $(uname -r)

------------------------------------------------------------
	 * * * * * 103.5 Create, monitor and kill processes  * * * * *
------------------------------------------------------------
------------------------------------------------------------
	* * * * * 103.6 Modify process execution priorities * * * * *
------------------------------------------------------------
------------------------------------------------------------
	* * * * * 103.7 Search text files using regular expressions * * * * *
------------------------------------------------------------
------------------------------------------------------------
	* * * * * 103.8 Basic file editing * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Navegar pelo documento usando o vi.
	Usar os modos básicos do vi.
	Inserir, editar, deletar, copiar e encontrar texto.
	Noções de Emacs, nano e vim.
	Configurar o editor padrão.

Verificando a versão do vi e abrindo com um buffer vazio:

	vi --version

	vim

	vi

Definindo o arquivo com o vim:

	vim arquivo.txt

Pesquisando Linux dentro do arquivo:

	/Linux

A cada Enter o cursor irá a próxima ocorrência.

Busca uma ocorrência no sentido do início (baixo para cima):

	SHIFT+N

	?Linux

Entrando no modo de inserção no local do cursor:

	i

Saindo do modo de inserção:

	ESC

Entrando no modo de inserção na linha abaixo:

	o

Recortando uma linha e entrando no modo de inserção:

	cc

Colando o recorte no local do cursor:

	p

Recortando uma ou mais linhas sem entrar no modo de inserção:

	dd

	20dd

	d3d

Copiando uma ou mais linhas:

	yy

	y3y

Salvando e saindo do arquivo:

	:wq

	:x

	ZZ

Posicionando o cursor no início da última linha:

	:$

Numerando as linhas do arquivo:

	:set number

Para sair e salvar o arquivo:

	:wq nome_do_arquivo.txt

Definindo o editor padrão do sistema:

	select-editor

	export EDITOR=vim

------------------------------------------------------------

	* * * * * Topic 104: Devices, Linux arquivosystems, arquivosystem Hierarchy Standard * * * * *
------------------------------------------------------------
	* * * * * 104.2 Maintain the integrity of filesystems * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Verificar a integridade dos sistemas de arquivos.
	Monitorar os espaços livres e inodes.
	Reparar problemas simples dos sistemas de arquivos.

Imprimindo as partições montadas:

	df -h

	df -hT

Imprimindo a utilização de inodes na partição:

	df -i /var/

Imprimindo o espaço utilizado em disco por diretórios ou arquivos:

	du -sh *
		
	du -sh /home/*
		
	du -shc *

	du -ah *

A partição não deve estar montada!

Imprimindo as informações sobre o sistema de arquivos:

	tune2fs -l /dev/sdb1 | less

	tune2fs -l /dev/sdb1 | grep <"Block count" "created">

Definindo um label para a partição com o tune2fs:

	tune2fs -L "Pendrive" /dev/sdb1

	dumpe2fs -h /dev/sdb1

Definindo o tempo de checagem (check interval):

	tune2fs -i 7d /dev/sdb1

O xfs_admin é o comando equivalente para sistema de arquivos XFS. Os comandos são similares ao tune2fs.

Verificando a integridade do sistema de arquivos:

	fsck /dev/sdb1

	fsck -t ext4 /dev/sdb1

Sem fazer nenhum alteração:

	fsck -n /dev/sdb1

Aceitando todas as operações

	fsck -y /dev/sdb1

Instalação e utilização:

	apt install xfs*

	mkfs -t xfs /dev/sdb1

	mount /dev/sdb1 /mnt/xfs/

Para descobrir o sistema de arquivos de um diretório:

	df -T /dev/sdb1

Verificando a integridade de um sistema de arquivos XFS:

	xfs_repair /dev/sdb1

Verificando bugs:	

	xfs_db /dev/sdb1

		help

		frag

		quit

Desfragmentando um sistema de arquivos (FileSystem Reorganizer):

	xfs_fsr /dev/sdb1

	xfs_fsr

Funciona com o sistema de arquivos montado!

------------------------------------------------------------
	* * * * * 104.3 Control mounting and unmounting of filesystems * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Montar e desmontar manualmente sistemas de arquivos.
	Configurar a montagem dos sistemas de arquivos no início do sistema.
	Configurar sistemas de arquivos removíveis e montáveis pelo usuário.
	Utilização de etiquetas (labels) e UUIDs para identificar e montar sistemas de arquivos.
	Noções de unidades de montagem do systemd.

Arquivo de configuração das partições que serão montadas no boot:

	/etc/fstab

Comando para montar e desmontar tudo que está no /etc/fstab:

	mount -a

	umount -a

Apenas se não estiver em uso!

Montando e desmontando uma partição manualmente:

	mkdir /tmp/teste_mount

	mount /dev/sdb2 /tmp/teste_mount

ou

	blkid /dev/sdb2

	mount UUID=9c5d6d45-74da-4932-be67-eb63a562c778 /mnt/pendrive

	df -h

	umount /dev/sdb2

ou

	umount /tmp/teste_mount

Imprimindo o UUID de uma partição:

	blkid

	lsblk -f

	dumpe2fs -h /dev/sdb2

"Filesystem UUID:".

Definindo uma nova partição o /etc/fstab:

	/dev/sdb3	/mnt/pendrive	auto	defaults	0	0

ou

	UUID=9c5d6d45-74da-4932-be67-eb63a562c778 /mnt/pendrive	auto	defaults	0	0

A última opção é o número da ordem do fsck, no Linux é executado por padrão no boot!

A partição de swap não precisa ser montada, portanto none!
