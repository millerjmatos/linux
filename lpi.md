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

Imprimindo os processos ativos nesse terminal:

	ps

Incluindo os processos associados ao usuário atual:

	ps -u

Incluindo processos não associados ao terminal:

	ps -ux | less

Incluindo todos os processos do sistema:

	ps aux | less

Imprimindo os processos em formato de "árvore":

	ps -auxf | less

	pstree

	pstree -p

Filtrando processos:

	ps -aux | grep java

Imprimindo o ID do processo:

	pgrep bash

	pgrep bash -u root

	pgrep --help

Imprimindo todos os sinais que são possíveis enviar aos processos:

	kill -l

Ao se pressionar "CTRL + C" o sinal 2 é enviado, interromper e encerrar:

	SIGINT

Ao se pressionar "CTRL + Z" o sinal 20 (SIGSTP) é enviado, interromper sem encerrar:

	top

	CTRL + Z

	jobs

	fg

Encerrando um processo:

	pgrep firefox

	ps -aux | grep firefox

	kill -s SIGKILL <PID>

	kill -s 9 <PID>

	kill -9 <PID>

	kill -SIGKILL <PID>

	kill <PID>

Encerrando processos através do nome:

	killall firefox

	killall java

	pkill firefox

killall mata processos com base em seus nomes exatos.

pkill mata processos com base em seu nome ou outras propriedades, como o usuário que o iniciou ou o grupo de processos ao qual ele pertence.

Sem nenhum parâmetro o kill, killall e pkill enviam o sinal de código 15 SIGTERM.

Reiniciando um processo:

	kill -1 <PID>

	pkill -1 firefox -u muller

Imprimindo o tempo de atividade do sistema:

	uptime

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

Executando um programa em background:

	firefox &

	wget -q http://www.mullertec.com.br &

Imprimindo os programas rodando em background:

	jobs

	jobs -l

Parando um programa rodando em foreground:

	gnome-calculator

	CTRL+Z

	jobs

	jobs -l

Executando o último processo em background ou especificando:

	bg

	bg 2

Executando o último processo em forefround ou especificando:

	fg

	fg 2

Executando um programa desconectado do terminal atual:

	nohup firefox &

Executando um programa periódicamente:

	watch free -h

	watch "ps -aux | grep firefox"

	watch -n5 date

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

------------------------------------------------------------
	* * * * * 103.6 Modify process execution priorities * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Saber a prioridade padrão de um processo que é criado.
	Executar um programa com maior ou menor prioridade do que o padrão.
	Mudar a prioridade de um processo em execução.

Definindo a prioridade de um processo:

	nice -<-20 ~ 19> firefox

	nice -n 10 firefox &

	nice -n -15 qps &

	nice --20 watch -n5 free -m &

O nice vai de -20 até 19. Quanto < maior a prioridade!

O valor padrão é 0

Definindo a prioridade de um processo em execução:

	renice -n -16 17779

	renice -n -5 -u muller

	renice -n -10 -g diretoria

Usando o comando top:

	top

		r

			<PID>

				< -20 ~ 19 >

------------------------------------------------------------
	* * * * * 103.7 Search text files using regular expressions * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Criar expressões regulares contendo vários elementos.
	Entender a diferença entre expressões regulares básicas e estendidas.
	Entender os conceitos de caracteres especiais, classes de caracteres, quantificadores e âncoras.
	Usar ferramentas de expressão regular para realizar pesquisas pelo sistema de arquivos ou no conteúdo de um arquivo.
	Utilizar expressões regulares para apagar, alterar e substituir texto.

O comando fgrep apenas faz filtros por strings de texto, mas não interpreta expressões regulares. Todos os outros comandos aceitam expressões regulares.

Pesquisando em um arquivo de texto:

	grep Linux arquivo.txt

Contando a ocorrência:

	grep -c Linux arquivo.txt

Pesquisando em varios arquivos de texto:

	grep Linux *

	grep Linux arq*

Imprimindo a pesquisa ignorando diferenças entre maiúsculas/minúsculas:

	grep -i Linux *

Imprimindo todas as linhas que iniciam com a string:

	grep "^<STRING>" arquivo.txt

Imprimindo todas as linhas que terminam com a string:

	grep "<STRING>$" arquivo.txt

Imprimindo todas as linhas que NÃO correspondem com a string:

	grep -v Linux arquivo.txt

Imprimindo o número de linhas vazias em um arquivo:

	grep -c "^$" arquivo.txt

Imprimindo recursivamente:

	grep -r Linux *.txt

Imprimindo o nome e o caminho do arquivo que contenham "ethX":

	grep -lr ethX /etc/*

Definindo um string por outra com o sed:

	sed 's/Nome/NovoNome/' nomes.txt

Para não pular a linha ao fazer a alteração, utilizamos a flag global:

	sed 's/Nome/NovoNome/g' nomes.txt

	sed 's/Linux/LINUX/g' nomes.txt > nomes2.txt

Apagar linhas em um range:

	sed '3,5 d' nomes.txt

Apagar linhas com uma ocorrência de string específica:

	sed '/Nome/d' nomes.txt

	sed '/^#/d' nomes.txt

Pesquisando com o egrep:

	egrep "b[aei]g" arquivo.txt

	egrep "b[a-u]g" arquivo.txt

Imprimindo pelo final da linha:

	egrep "Linux$" arquivo.txt

Imprimindo pelo início da linha:

	egrep "^#" arquivo.txt

	egrep "^Linux" arquivo.txt

Imprimindo pelo início da linha e que não contém algo:

	egrep -v "^#" arquivo.txt

Não exige o caractere anterior ou que haja algo "*":

	egrep "b[a-i]g*" arquivo.txt

	egrep "b[a-i]g*e" arquivo.txt

Não exige o caractere anterior ou imprime se ele repetir mais vezes "?":

	egrep "b[a-i]g?" arquivo.txt

Exige com o caractere anterior uma ou mais vezes "+":

	egrep "b[a-i]g+" arquivo.txt

Imprime com ao menos um caractere após "." ou dois ".." ou três "...":

	egrep "b[a-i]g." arquivo.txt

Imprimindo linhas que contenham uma determinada palavra:

	egrep '\bLinux\b' arquivo.txt

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
	* * * * * 104.1 Create partitions and filesystems * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Gerenciar tabela de partição MBR e GPT
	Usar vários comandos mkfs para criar sistemas de arquivos tais como:
	ext2/ext3/ext4
	XFS
	VFAT
	exFAT
	Conhecimento básico dos recursos do Btrfs, incluindo sistema de arquivos em multidispositivos, compressão e subvolumes.

Imprimindo os discos e as partições de cada um deles:

	fdisk -l

	parted -l

	lsblk

	lsblk -f

É preciso estar como root.

Particionando o disco:

	fdisk /dev/sdb

		Command: F

		Command: n

		Partition type: p primary

		Partition number: 1

		First sector: "Enter" default

		Last sector: +2G

		Command: p

Tudo feito até aqui ainda não foi salvo!

		Command: n

		Partition type: p primary

		Partition number: 2

		First sector: "Enter" default

		Last sector: +1G

		Command: p

Terceira partição:

		Command: n

		Partition type: p primary

		Partition number: 3

		First sector: "Enter" default

		Last sector: +1G

		Command: p

Ao tentar criar uma nova partição o fdisk vai sugerir uma partição extendida!
O limite de partições primarias em um disco são 3.

Quarta partição:

		Command: n

		Partition type: e extended

		Partition number: 4

		First sector: "Enter" default

Lembrando que a partição extendida irá comportar as partições lógicas.
A próxima opção irá usar todo o restante do disco.

		Last sector: "Enter" default

		Command: p

Quinta partição:

		Command: n

		Adding logical partition 5

		First sector: "Enter" default

		Last sector: +500M

		Command: p

Sexta partição:

		Command: n

		Adding logical partition 6

		First sector: "Enter" default

		Last sector: +1G

		Command: p

		Command: w

	fdisk -l

Excluindo a partição 2:

	fdisk /dev/sdb

		Command: d

		Partition number: 2

		Command: w

Caso exclua a partição 4 as partições 5 e 6 serão excluídas também, pois são lógicas, dentro da extendida.

Mundando o tipo de uma partição:

	fdisk /dev/sdb

		Command: l

		Command: t

		Partition number: 5

		Partition type: 82

		Command: w

No padrão GPT, teoricamente, não há limitação no número de partições.
	
	cfdisk /dev/sdb

Formatando a partição e definindo o sistema de arquivos:

	mkfs -t ext4 /dev/sdb1
	
Montando a partição:

	mkdir  /mnt/media/pendrive
	
	mkfs -t ext4 /dev/sdb1 /mnt/media/pendrive

Particionando o disco com o formato GPT:

	gdisk /dev/sdc

		Command: ?

		Command: n

		Partition number: "Enter" default

		First sector: "Enter" default

		Last sector: +2G

		Hex code or GUID: "Enter" default

		Command: p

		Command: w

		Do you want to proceed?: yes

Verificando o sistema de arquivos de uma partição:

	lsblk -f

	parted -l

Formatando a partição e definindo como swap:

	mkswap /dev/sdb3

	swapon /dev/sdb3

	cat /proc/swaps

Utilizando o parted:

	parted /dev/sdc

		Listando as partições: p

Redimensionando uma partição em 1 gigabyte:

		resizepart <number> <new_end>

		resizepart 2 1GB

		p

		saindo: quit

	fdisk -l /dev/sdc

O gparted é a versão gráfica do parted:

	apt install gparted

	gparted &

Utilizando exFAT em um pendrive previamente montado:

	apt install exfat-fuse exfat-utils

	umount /dev/sdc1

	mkfs -t exfat /dev/sdc1

	mount /dev/sdc1 /media/pendrive

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

------------------------------------------------------------
	* * * * * 104.4 Removed * * * * *
------------------------------------------------------------
	* * * * * 104.5 Manage file permissions and ownership * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Gerenciar permissões de acesso a arquivos comuns e especiais, bem como aos diretórios.
	Usar os modos de acesso tais como suid, sgid e o sticky bit (bit de aderência) para manter a segurança.
	Saber como mudar a máscara de criação de arquivo.
	Usar o campo de grupo para conceder acesso para grupos de trabalho.

Definindo as permissões de acesso a um arquivo:

	ls -l /bin/ls

	chmod o-x /bin/ls

Efetue login em outro terminal com usuário comum.

Execute o comando ls e verifique que o user não tem permissão para executar o programa.

No tty1 como root:

	chmod o+x /bin/ls

Removendo escrita do grupo dono: -rwxrw-r-- user manager linux.txt

	chmod g-w linux.txt
ou
	chmod 744 linux.txt

Resultado = -rwxr--r-- user manager linux.txt
	
Adicionando execução a todos: -rwxr--r-- user manager linux.txt

	chmod a+x linux.txt
ou
	chmod 755 linux.txt

Resultado = -rwxr-xr-x user manager linux.txt

Adicionando escrita ao usuário e grupo dono: -rwxr-xr-x user manager linux.txt

	chmod ug+w linux.txt
ou
	chmod 775 linux.txt

Resultado = -rwxrwxr-x user manager linux.txt

Definindo a permissão recurssivamente no diretório:

	chmod 755 -R /home/user/diretorio
	
Executando um arquivo com as permissões do dono (user) SUID:

	ls -l /home/user/Linux/script.sh

		-rwxrwxr-x user manual script.sh
	
	chmod u+s script.sh

	chmod 4775 script.sh

	ls -l /home/user/Linux/script.sh

		-rwsrwxr-x user manual script.sh
		
Executando um arquivo com as permissões do grupo GUID:
	
	chmod g+s script.sh

	chmod 2775 script.sh

	ls -l /home/user/Linux/script.sh

		-rwsrwsr-x user manual script.sh

Definindo o grupo dos arquivos criados em um "diretório":

	chmod g+s /home/user/
	
	chmod 

	cd /home/user/Linux/

Entre com outro usuário e faça o teste:

	touch arquivo.txt

	ls -l /home/user/Linux/arquivo.txt

O sticky bit define que um diretório ou arquivo só pode ser excluído ou editado pelo dono:
	
	chmod o+t arquivo.txt
	
	chmod 5775 arquivo.txt

	ls -l arquivo.txt

		-rwsrwsr-t user manual arquivo.txt

s: possui permissão de execução.
S: não possui permissão de execução.
t: possui permissão de execução.
T: não possui permissão de execução.

Imprimindo a permissão padrão do sistema:

	umask

Definindo a permissão do sistema:

	umask <0000>

Em uma sessão em que o valor do umask é 0002:

777 - 002 = 775 (diretórios)

666 - 002 = 664 (arquivos)

	drwxrwxr-x

	-rw-rw-r--

Definindo o usuário e/ou o grupo dono do arquivo ou diretório:

	chown user arquivo.txt

	chown :suporte arquivo.txt

	chown .suporte arquivo.txt
	
	chown user:group -R /home/user/Linux

	chgrp suporte -R /home/user/Linux

	chgrp suporte arquivo.txt

------------------------------------------------------------
	* * * * * 104.6 Create and change hard and symbolic links * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Criar links.
	Identificar links simbólicos e/ou hardlinks.
	Copiar arquivos versus criar links de arquivos.
	Usar links para dar suporte a tarefas de administração do sistema.

Criando um link físico para o arquivo:

	ln script.sh link-hard

	ls -li script.sh link-hard

Note que ambos possuem o mesmo inode.

A edição de qualquer um refletirá no outro!

Não funciona em diretórios.

Criando um link simbólico para o arquivo:

	ln -s script.sh link-simbolico

	ls -li script.sh link-hard

Criando um link simbólico para um diretório:

	cd /home/

	ln -s /var/ atalho_var

Removendo o link simbólico, nome sem "/" no final:

	rm atalho_var
		
		y

Note a diferença no inode.

Similar a um atalho!

As permissões sempre são 777

Se deletar o link principal o simbólico estará quebrado.

------------------------------------------------------------
	* * * * * 104.7 Find system files and place files in the correct location * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Entender a localização correta dos arquivos dentro do FHS.
	Encontrar arquivos e comandos em um sistema Linux.
	Conhecer a localização e a finalidade de arquivos e diretórios importantes definidos no FHS.

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

O locate utiliza uma base de dados interna que contém a localização de todos os arquivos do sistema.

Imprimindo a busca com o locate:

	locate rpm *.pdf

Atualizando a base de dados do locate:

	updatedb

O comando whereis é mais restrito, e não pesquisa no /home:

	whereis fsck

	whereis ls

O whereis localiza os arquivos binarios, bibliotecas, códigos-fonte e manuais.

O comando type é utilizado para indicar se um determinado comando é interno ao shell, externo ou até mesmo se é um alias:

	type bash

------------------------------------------------------------

	* * * * * Topic 105: Shell e scripts de shell * * * * * 

------------------------------------------------------------
	* * * * * 105.1 Customize and use the shell environment * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Definir variáveis de ambiente (por exemplo, PATH) no início da sessão ou quando abrir um novo shell.
	Escrever funções Bash para sequências de comandos frequentemente usadas.
	Manter o esqueleto de diretórios (skeleton) para novas contas de usuários.
	Definir os caminhos de busca de comandos para apontar para os diretórios corretos.

O comando bash executa o script em um processo separado!

O comando source no Linux serve para executar um script dentro do shell atual. Outro comando equivalente:

	. script.sh

Todos os arquivos e diretórios presentes nesse diretório serão incluídos no diretório home de novos usuários criados no sistema, inclusive os arquivos de configuração locais, de cada usuário:

	/etc/skel/

Editando o arquivo para toda nova sessão de shell bash, aplicado a todos os usuários:

	vim /etc/bash.bashrc

		alias inet="ip -br -c a"

		alias dt="date +%H:%M"

		:wq

	source /etc/bash.bashrc

	inet

	dt

Imprimindo todos os alias do bash atual e do ambiente::

	alias

Usando o comando function, ex.:

	function f01 {
		date;
		uptime;
		uname -a;
		inet;
		cat /etc/os-release
		echo "fim da funcao"
	}

	f01

	set

------------------------------------------------------------
	* * * * * 105.2 Customize or write simple scripts * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Usar a sintaxe padrão sh (repetição, testes).
	Usar a substituição de comandos.
	Valores retornados por um sucesso ou falha de teste ou outra informação fornecida por um comando.
	Executar comandos encadeados.
	Enviar mensagens para o superusuário.
	Selecionar corretamente o interpretador de script através da linha shebang (#!).
	Gerenciar a localização, propriedade, permissão e permissão suid dos scripts.

Executando o script no bash atual:

	source script.sh

Executando em outro bash:

	chmod a+x script.sh

	.	script.sh

	./ /home/user/Scripts/script.sh

	bash ./script.sh

Executando e fechando a sessão atual:

	exec script.sh

Adicionando o script ao $PATH:

	vi ~/.profile

		PATH="$HOME/Scripts:$HOME/bin:$HOME/.local/bin:$PATH"

Essa edição precisa de um novo login para surgir efeito!

Caso queira o contrário:

	echo $PATH

	PATH=/home/user/Scripts:<colar saída do PATH>

Testando:

	script.sh

Definindo o bash/copilador no script com o shebang.

Na primeira linha do script:

	#!/bin/bash
ou
	#!/usr/bin/python2
	
------------------------------------------------------------

	* * * * * Topic 106: User Interfaces and Desktops * * * * * 

------------------------------------------------------------
	* * * * * 106.1 Install and configure X11 * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Entendimento da arquitetura do X11.
	Entendimento e conhecimento básico do arquivo de configuração do X Window.
	Substituir aspectos específicos da configuração do Xorg, como o layout de teclado.
	Entendimento dos componentes de um ambiente de desktop, como gerenciadores de display e gerenciadores de janelas.
	Controlar o acesso ao servidor X e exibir aplicativos em servidores X remotos.
	Noções do Wayland.

------------------------------------------------------------
	* * * * * 106.2 Graphical Desktops * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Noções dos principais ambientes de desktop.
	Noções dos protocolos utilizados para acessar sessões de desktop remoto.

O xrdp é uma alternativa para acessar estações Linux através do MS RDP. 
Site: http://xrdp.org/

Instalação:

	apt install xrdp

	systemctl enable xrdp

	ufw allow from any to any port 3389 proto tcp

------------------------------------------------------------
	* * * * * 106.3 Accessibility * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Conhecimento básico das configurações visuais e temas.
	Conhecimento básico das tecnologias assistivas.

------------------------------------------------------------

	* * * * * Topic 107: Administrative Tasks * * * * * 

------------------------------------------------------------
	* * * * * 107.1 Manage user and group accounts and related system files * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Adicionar, modificar e remover usuários e grupos.
	Gerenciar informações de usuários/grupos em banco de dados senhas/grupos.
	Criar e administrar contas com propósitos especiais e contas limitadas.

Adicionando um usuário no sistema:

	useradd -m user

	useradd -m user -s /bin/bash

	useradd -m name_user -d /home/user -s /bin/bash

	passwd <user>
	
Adicionando um grupo no sistema:

	groupadd <group>

Adicionando um usuário criado em um grupo:

	usermod -a -G <group> <user>
	
	adduser <user> <group>
	
	gpasswd -a <user> <group>

Removendo um usuário de um grupo:

	gpasswd -d <user> <group>

Definindo o grupo primário de um usuário:

	usermod -g <group> <user>

Adicionando um usuário sem diretório home:

	useradd -M <user>

	useradd -no-create-home <user>

Adicionando um usuário e seu diretório pessoal:

	useradd <user> -d /home/linux/

Removendo um usuário do sistema:

	userdel <user>

Removendo um usuário do sistema e o diretório home:

	userdel -r <user>

Removendo um grupo do sistema:

	groupdel <group>

Trocando a senha de um usuário:

	passwd <user>

Permitindo um usuário logar sem senha, pois remove a senha do mesmo:

	passwd -d <user>

Imprimindo as informações do usuário:

	finger <user>

Definindo as informações do usuário:

	chfn <user>

Bloqueando e desbloqueando um usuário:

	usermod -L <user>
		
	usermod -U <user>

Imprimindo os grupos e seus usuários:

	getent group

	groups <user>

------------------------------------------------------------
	* * * * * 107.2 Automate system administration tasks by scheduling jobs * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Gerenciar tarefas usando cron e at.
	Configurar o acesso dos usuários a serviços cron e at.
	Entender os unidades temporizadoras (timers) do systemd.

Definindo o arquivo de configuração do crontab:

	vim /etc/crontab

Agendando uma tarefa semanal de backup sábado às 19h:

	00 19 * * 6 root rsync -Cravzp --delete <origem> <destino>

	M<0-59> H<0-23> D<1-31> M<1-12> W<0-6> USER SCRIPT

A cada determinado tempo, horas ou minutos:

	*/10

Editando o arquivo de configuração:

Em /etc/crontab

	crontab -e

Listando os agendamentos:

	crontab -l

Editando o arquivo:

	:r! cat /etc/crontab

Confirmando o horário:

	:! date

Permitindo e bloqueando usuários:

	vim /etc/cron.allow

	vim /etc/cron.deny

		user

		:x

Agendando apenas uma vez:

	at -h

	at HH:MM DD/MM/AAAA

		cat /usr/bin/date >> data.txt

		CTRL + D

	atq

------------------------------------------------------------
	* * * * ** 107.3 Localisation and internationalisation * * * * **
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Configurar idioma e variáveis de ambiente.
	Configurar fuso horário e variáveis de ambiente.

------------------------------------------------------------

 * * * * * Topic 108: Essential System Services * * * * *

------------------------------------------------------------
	* * * * * 108.1 Maintain system time * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Definir a data e a hora do sistema.
	Definir o relógio do hardware com a hora correta em UTC.
	Configurar o fuso horário correto.
	Configuração básica do NTP usando o ntpd e o chrony.
	Conhecimento de como usar o serviço pool.ntp.org.
	Noções do comando ntpq.

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

------------------------------------------------------------
	* * * * * 108.2 System logging * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Configuração básica do rsyslog.
	Entendimento das facilidades (facilities), prioridades (priorities) e ações padrão.
	Consultar o diário (journal) do systemd.
	Filtrar o diário (journal) do systemd utilizando critérios como data, serviço ou prioridade.
	Apagar informações antigas do diário (journal) do systemd.
	Recuperar as informações do diário (journal) do systemd a partir de um sistema em manutenção ou uma cópia do sistema de arquivos.
	Entender a interação entre o rsyslog e o systemd-journald.
	Configuração do logrotate.
	Noções do syslog e do syslog-ng.

------------------------------------------------------------
	* * * * * 108.3 Mail Transfer Agent (MTA) basics * * * * *
------------------------------------------------------------
------------------------------------------------------------
	* * * * * 108.4 Manage printers and printing * * * * *
------------------------------------------------------------
------------------------------------------------------------

	* * * * * Topic 109: Networking Fundamentals * * * * *

------------------------------------------------------------
	* * * * * 109.1 Fundamentals of internet protocols * * * * * 
------------------------------------------------------------

------------------------------------------------------------
	* * * * * 109.2 Persistent network configuration * * * * *
------------------------------------------------------------

------------------------------------------------------------
	* * * * * 109.3 Basic network troubleshooting * * * * *
------------------------------------------------------------

Principais Áreas de Conhecimento:

	Configuração manual de interfaces de rede, incluindo verificar e alterar a configuração de interfaces de rede usando o iproute2.
	Configuração manual de tabelas de roteamento, incluindo verificar e alterar a tabela de rotas e definir a rota padrão usando o iproute2.
	Solucionar problemas associados com a configuração da rede.
	Noções dos comandos legados do net-tools.

Instalando o utilitário ifconfig:

	apt install net-tools

Reiniciando uma interface:

	ip link set ethX down ; ip link set ethX up

	ifconfig ethX down ; ifconfig ethX up

Imprimindo o IP/MAC da interface:
	
	ip a show

	ifconfig

Definindo um IP para a interface:

	ip a <add del> 192.168.100.200/24 dev enp0s8

	ifconfig enp0s8 192.168.100.88 netmask 255.255.255.0

	ip a flush dev enp0s8

Imprimindo a tabela de roteamento:

	route

	ip r

	ip route show

Definindo a rota default manualmente:

	ip route del default

	ip route add default via 192.168.1.1/24

Definindo uma rota:

	ip route <add del> 172.16.30.0/24 via 10.0.0.1 dev ethX

Informando a rota dos pacotes:

	<tracepath traceroute> mullertec.com.br

	<tracepath traceroute> -n lpi.org

Definindo MAC:

	ip link set ethX down
	
	ip link set dev ethX address 1A:2B:3C:55:66:00
	
	ip link set ethX up

Definindo o IP DHCP com arquivo de configuração /etc/network/interfaces:

		auto lo
		iface lo inet loopback

Definindo IP fixo:

		auto ethX
		iface ethX inet static
		address 192.168.x.x
		netmask 255.255.x.x
		gateway 192.168.x.x
		dns-nameservers 8.8.8.8 8.8.4.4

Um socket é uma interface de comunicação bidirecional entre processos, que permite que dois processos em uma rede se comuniquem. Ele é identificado por um endereço IP e um número de porta.

------------------------------------------------------------
	* * * * * 109.4 Configure client side DNS * * * * *
------------------------------------------------------------
------------------------------------------------------------

	* * * * * Topic 110: Security * * * * * 

------------------------------------------------------------
	* * * * * 110.1 Perform security administration tasks * * * * *
------------------------------------------------------------
------------------------------------------------------------
	* * * * * 110.2 Setup host security * * * * *
------------------------------------------------------------
------------------------------------------------------------
	* * * * * 110.3 Securing data with encryption * * * * *
------------------------------------------------------------
