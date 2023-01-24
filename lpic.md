------------------------------------------------------------

	* * * * * Topic 101: System Architecture * * * * *

------------------------------------------------------------
	* * * * * 101.1 Determine and configure hardware settings * * * * *
------------------------------------------------------------

Questões: 2

/sys/
/proc/
/dev/
modprobe
lsmod
lspci
lsusb

Onde ficam os módulos:

	cd /lib/modules/

Cada conjunto de módulos é associado a uma versão de kernel:

	uname -r

	cd /lib/modules/4.8.0-46-generic/kernel/

	cd sound/pci/

Todos os arquivos terminados com a extensão *.ko são módulos/drivers para algum dispositivo de hardware.

Arquivo onde podemos definir módulos a serem carregados pelo sistema manualmente:

	cat /etc/modules

Lista os módulos que estão carregados no momento:

	lsmod

Ele consulta as informações que estão em:

	cat /proc/modules

Para saber detalhes de um módulo:

	lsmod

	modinfo <módulo>

Para remover um módulo carregado:

	ls | grep mouse

	modinfo psmouse

	rmmod psmouse

	modprobe -r psmouse

Nesse momento o mouse não funciona mais na máquina. Para reverter:

	insmod <caminho completo informado no campo filename do comando modinfo psmouse>

O insmod não carrega as dependências! O comando modprobe o faz:

	lsmod | grep blue

	modprobe bluecard_cs

	lsmod | grep blue

------------------------------------------------------------
	* * * * * 101.2 Boot the system * * * * *
------------------------------------------------------------

Questões: 3

dmesg
journalctl
BIOS
UEFI
bootloader
kernel
initramfs
init
SysVinit
systemd

------------------------------------------------------------
	* * * * * 101.3 Change runlevels / boot targets and shutdown or reboot system * * * * *
------------------------------------------------------------

Questões: 3

/etc/inittab
shutdown
init
/etc/init.d/
telinit
systemd
systemctl
/etc/systemd/
/usr/lib/systemd/
wall

------------------------------------------------------------

	* * * * * Topic 102: Linux Installation and pacoteage Management * * * * * 

------------------------------------------------------------
	* * * * * 102.1 Design hard disk layout * * * * *
------------------------------------------------------------

Questões: 2

/ (root) filesystem
/var filesystem
/home filesystem
/boot filesystem
EFI System Partition (ESP)
swap space
mount points
partitions

------------------------------------------------------------
	* * * * * 102.2 Install a boot manager * * * * *
------------------------------------------------------------

Questões: 2

menu.lst, grub.cfg and grub.conf
grub-install
grub-mkconfig
MBR

Imprimindo as imagens do kernel:

	cd /boot/

	ls -l

Imprimindo os arquivos de configuração do grub:

	cd /boot/grub/

	ls -l

Imprimindo a versão do grub:

	update-grub --version

Editando os arquivos de configuração do grub:

	cd /etc/default/

	ls -l

	vi grub

Após edição é necessário atualizar o grub:

	update-grub

	ls -l /boot/grub/grub.cfg

Realizando o backup do grub:

	dd if=/dev/sda of=copia.mbr bs=1 count=512

Restaurando o backup:

	dd if=copia.mbr of=/dev/sda

------------------------------------------------------------
	* * * * * 102.3 Manage shared libraries * * * * *
------------------------------------------------------------

Questões: 1

ldd
ldconfig
/etc/ld.so.conf
LD_LIBRARY_PATH

Imprimindo quais as bibliotecas utilizadas pelo programa:

	whereis vi

	ldd /usr/bin/vi

Todos os arquivos terminados em .so são bibliotecas!

O comando ldconfig atualiza as configurações em /etc/ld.so.cache

Principais arquivos de configuração:

	ls -ld /etc/ld.so*

Imprimindo todas as bibliotecas utilizadas pelo sistema:

	ldconfig -p |less

Adicionando o diretório e as bibliotecas contidas; em /etc/ld.so.cache:

	mkdir /tmp/lib

	ldconfig -p |grep "/tmp/lib"

	vi /etc/ld.so.conf

		include /etc/ld.so.conf.d/*.conf
		/temp/lib/

		:wq

	ldconfig

	ldconfig -p |grep "/tmp/lib"

	ls -l /etc/ld.so.cache

Adicionando o diretório e as bibliotecas contidas, na sessão atual:

	export LD_LIBRARY_PATH=/tmp/lib/

	env | grep LIBRARY

------------------------------------------------------------
	* * * * * 102.4 Use Debian package management * * * * *
------------------------------------------------------------	

Questões: 3

Arquivo que lista as fontes de onde o apt obterá os pacotes: 

	/etc/apt/sources.list

Atualizando a lista de pacotes disponíveis nos repositórios: 

	apt-get update

Atualizando o sistema: 

	apt-get upgrade

Atualizando e reparando a base dados:

	apt-get -f install

Removendo o pacote "embirrento":

	apt-get -f remove

Esvaziando o diretório de cache "/var/cache/apt/archives":

	apt-get clean

Pesquisando pacotes por nome: 

	apt-cache search <pacote>

	apt search youtube

Imprimindo informações do pacote: 

	apt-cache show <pacote>

Imprimindo as dependências de um pacote: 

	apt-cache depends <pacote>

Pesquisando por repositórios mais rápidos: 

	apt-get install netselect-apt

Removendo um pacote instalado: 

	apt-get remove <pacote>

Removendo um pacote e sua base de dados:

	apt-get purge <pacote>

Removendo pacotes desnecessários (limpar dependências não utilizadas): 

	apt-get autoremove

Removendo todos os arquivos em seu cache que estão desatualizados no repositório:

	apt-get autoclean

Imprimindo os pacotes instalados: 

	dpkg -l

	dpkg --get-selections

Para obter informações sobre o pacote:

	dpkg -l brave-browser

	dpkg --get-selections | grep brave-browser

	dpkg -s brave-browser

Imprimindo informações de um pacote não instalado:

	dpkg -I brave-browser_amd64.deb

	dpkg --contents <pacote.deb>

Instalando um pacote .deb: 

	dpkg -i <pacote.deb>

	dpkg -i --force-all <pacote.deb>

Imprimindo os arquivos instalados por um pacote específico:

	dpkg -L bash

Para saber a origem de um pacote:

	dpkg -S /user/share/menu/bash

Removendo um pacote: 

	dpkg -r <pacote>

Removendo todos os arquivos e rastros de um pacote:

	dpkg -P <pacote>

	dpkg --purge <pacote>

Configurando e corrigindo erros causados por dependências:

	dpkg --configure -a

Encontrando um pacote instalado:

	dpkg --list

	dpkg --list | grep <nome>

Atualizando configurações de um pacote instalado:

	dpkg -l | grep tzdata

	dpkg-reconfigure tzdata

	dpkg-reconfigure keyboard-configuration

Imprimindo um menu gerenciador do apt:

	apt install dselect

	dselect

------------------------------------------------------------
	* * * * * 102.5 Use RPM and YUM pacoteage management * * * * *
------------------------------------------------------------

Weight： 3

rpm
rpm2cpio
/etc/yum.conf
/etc/yum.repos.d/
yum
zypper

Imprimindo os pacotes instalados na máquina:

	rpm -qa

	rpm -qa bash

Imprimindo as dependências necessárias para instalar o pacote:

	rpm -qR bash

Se o pacote não estiver instalado (avulso):

	rpm -qpR file-2.5.90.x86.rpm

Imprimindo informações de um pacote:

	rpm -qi bash

Imprimindo os arquivos que pertencem a instalação:

	rpm -ql bash

Imprimindo os arquivos de configuração da instalação:

	rpm -qc bash

Imprimindo os arquivos de documentação da instalação:

	rpm -qd bash

Imprimindo o programa que instalou determinando pacote:

	rpm -qf /etc/skel/.bashrc

Imprimindo quais são os arquivos de um determinado pacote:

	rpm -qlp arquivo.rpm

Imprimindo informações de um pacote:

	rpm -qip arquivo.rpm

Instalando um pacote:

	rpm -i arquivo.rpm

Atualizando uma versão de um pacote já instalado:

	rpm -U arquivo.rpm

As opções -i e -U são geralmente acompanhadas de -vh.

Instalando um pacote com dependências:

	rpm -ivh --nodeps arquivo.rpm

Forçando a instalação:

	rpm -ivh --force arquivo.rpm

Simulando uma instalação antes de realizar:

	rpm -ivh --test arquivo.rpm

Verificando a integridade de um pacote:

	rpm -V arquivo.rpm

Se retornar alguma mensagem, há algum erro.

Desisntalando um programa:

	rpm -evh NomeDoPrograma

Ignorando dependências usadas por outro programa:

	rpm -evh --nodeps NomeDoPrograma

Descompactando arquivos .RPM:

	rpm2cpio linux-5.x86_64.rpm > linux-5.cpio

	cpio -id < linux-5.cpio
 
Imprimindo os pacotes disponíveis para atualização:

	yum check-update

Atualizando o sistema:

	yum update

Atualizando o sistema e removendo pacotes obsoletos:

	yum upgrade

	yum update --obsolete

Instalando, removendo e pesquisando o pacote:

	yum <install remove search> <arquivo>

Arquivo de configuração principal:

	/etc/yum.conf

Arquivos de configuração dos repositórios:

	/etc/yum.repos.d

Verificando os pacotes instalados:

	yum list

	yum list installed | grep firewalld

O dnf é uma melhoria do yum e já vem como padrão no Fedora:

	which yum

	ls -l /usr/bin/yum

Os camandos são praticamente os mesmos:

	dnf <install remove search> <arquivo>

	dnf --help

	dnf list

O gerenciador de pacotes no Suse é o zypper:

	zypper --help

Atualizando a base de dados dos repositórios:

	zypper refresh

Atualizando o sistema:

	zypper update

------------------------------------------------------------
	* * * * * 102.6 Linux as a virtualization guest * * * * *
------------------------------------------------------------

Questões: 1

Virtual machine
Linux container
Application container
Guest drivers
SSH host keys
D-Bus machine id

------------------------------------------------------------

	* * * * * Topic 103: GNU and Unix Commands * * * * *

------------------------------------------------------------
	* * * * * 103.1 Work on the command line * * * * *
------------------------------------------------------------

Questões: 4

bash
echo
env
export
pwd
set
unset
type
which
man
uname
history
.bash_history
Quoting

Imprimindo o resultado na saída padrão:

	echo Linux

	echo "Linux"

Imprimindo o conteúdo de uma variável:

	echo $SHELL

Trocando o shell para o bash:

	bash

Para desobrir o tipo de um comando:

	type echo

	type ls

	type pwd

Localizando os diretórios de consulta do seu PATH:

	echo $PATH

	env | grep "$PATH"

Executando um arquivo no mesmo diretório, que não pertence ao $PATH ou shell:

	./arquivo.sh

Ou digitando o caminho absoluto de qualquer lugar do sistema:

	/home/linux/documentos/arquivo.sh

Como carregar uma variável de ambiente:

	NOME_VARIAVEL=valor

	echo $NOME_VARIAVEL

	bash

	echo $NOME_VARIAVEL

Tornando a variável global:

	export NOME_VARIAVEL

	export NOME_VARIAVEL=valor

Imprimindo variáveis locais e globais:

	set | less

Imprimindo apenas variáveis globais:

	env | less

Definindo uma variável no momento de execução do shell atual:

	env TESTE=Linux ./script.sh

	echo $TESTE

Excluindo uma variável:

	unset NOME_VARIAVEL

Algumas variáveis de ambiente definidas pelo sistema:

	$HISTFILE, $HOSTNAME, $LANG, $LOGNAME, $PATH, $SHELL, $TERM

Saiba o diretório home do usuário atual:

	echo $HOME

	echo ~

	echo ~root

Saiba o PID do shell atual:

	$$

	ps | grep bash

Saiba o PID do último processo executado em background:

	$!

Saiba o exit code do último processo executado:

	ls /tmp

	$?

Se retornar 0 significa um comando correto e diferente disso deve ser um erro.

Executando comandos em sequencia:

	date ; ls ; clear

Executando sem pular erros:

	ls /tmp/ && date && echo $USER

Executando a sequência mesmo com erros:

	ls /tmp/test || echo Linux

Histórico dos últimos comandos da sessão:

	history

	!19

Repetindo o último comando:

	!!

	ls /tmp/

	!!

Limpando o arquivo de histórico:

	history -c

Localizando o arquivo de histórico:

	set | grep HISTFILE

	cat /home/user/.bash_history

Localizando um comando no history através de pesquisa:

	CTRL+R

Utilizando o manual do sistema para consultar comandos do sistema:

	type cp

	type cd

	man cp

	man cd

	info cp

	whatis ls

Caso não haja manual o comando é do próprio bash:

	man bash

Pesquisando por manuais baseado na descrição:

	man -k "system info"

	apropos "system info"

Comando que informa várias informações do sistema:

	uname --help

Criando um atalho para um comando:

	alias

	alias lt="ls /tmp"

	lt

	unalias lt

Localiza o diretório onde está o comando:

	which echo

	which tar

Imprimindo todos os arquivos do diretório local:

	echo *

Protegendo caracteres especiais, quoting:

	echo "*"

	echo "$NOME_VARIAVEL"

Lembre-se que "" NÃO protege $ ` \

Já '' e \ protegem todos os caracteres sem excessão:

	echo '$NOME_VARIAVEL'

	echo \$NOME_VARIAVEL

	echo "Curso     Linux   LPI1"

	echo Curso\ \ \ \ \ Linux\ \ \ LPI1

------------------------------------------------------------
	* * * * * 103.2 Process text streams using filters * * * * *
------------------------------------------------------------

Questões: 2

bzcat
cat
cut
head
less
md5sum
nl
od
paste
sed
sha256sum
sha512sum
sort
split
tail
tr
uniq
wc
xzcat
zcat

Gerando o hash de um arquivo:

	sha256sum linux-debian-amd64.iso

	sha512sum linux-debian-amd64.iso

	md5sum linux-debian-amd64.iso

O código gerado é único, e garante que aquele arquivio é identico ao original.

Para testar se o download de uma .iso não foi corrompido:

	sha512sum -c SHA256SUMS

É preciso estar no mesmo diretório do aquivo hash e da .iso.

Para imprimir o conteúdo de um arquivo texto compactado:

	bzcat arquivo.txt.bz2

	xzcat arquivo.txt.xz

	zcat arquivo.txt.gz

O comando cat imprime o conteúdo de um texto na saída padrão:

	cat -n file.txt

	cat --help

Imprime na ordem inversa:

	tac file.txt

Comando que mostra por padrão as 10 primeiras linhas do arquivo:

	head file.txt

	head -n2 file.txt

Imprime o inverso do head:

	tail file.txt

	tail -n5 file.txt

Com essa opção o tail aguarda e imprime o final do arquivo em tempo real, útil para logs:

	tail -f file.txt

Imprimindo o conteúdo de um texto de modo paginado:

	less longfile.txt

	cat longfile.txt | less

A barra de espaço pula a página.

Para realizar uma pesquisa com uma palavra:

	/pesquisa

O n busca a nova ocorrência. SHIFT+N busca a anterior.

CTRL+G informa onde você está no arquivo.

Comando que informa o número de linhas, palavras e bytes do arquivo:

	wc file.txt

	wc -l file.txt

O * imprime o resultado de todos os arquivos do diretório atual ou desejado:

	cd /var/log && wc * | sort

O sort ordena alfabeticamente, para inverter:

	sort -r

Ordenando pelo campo específico:

	sort -k2 file.txt

O delimitador é o espaço vazio.

Ordenando pelo campo e especificando um delimitador:

	sort -t: -k2 -g

O -g ordena como números ao invés de como caracteres.

Imprime as linhas numeradas, descartando as linhas em branco:

	nl file.txt

	cat -b file.txt

Imprime apenas os dados que ocorreram uma única vez:

	uniq file.txt

Como é preciso que estejam em ordem sequêncial, podemos usar outra opção para resolver:

	sort file.txt | uniq

Se quiser imprimir apenas o que estiver duplicado:

	sort file.txt | uniq -d

Para informar a quantidade de cada ocorrência:

	sort file.txt | uniq -c

Imprimindo o conteúdo de um texto em formato octal:

	od file.txt

Em hexa:

	od -tx file.txt

	od --help

Para juntar dois arquivos de texto utilizando uma coluna como índice:

	join codigo-aluno.txt notas-aluno.txt

Juntando os dois arquivos linha por linha:

	paste codigo-aluno.txt notas-aluno.txt

Dividindo o arquivo:

	wc -l longfile.txt

	split -l20 longfile.txt

	ls -l
 
	split -l20 longfile.txt novo_arquivo_

	wc -l novo_arquivo_*

Imprimindo modificado a saída do texto utilizando strings:

	cat file.txt | tr a-z A-Z

	cat file.txt | tr -d A

	tr --help

	cat file.txt | tr [:upper:] [:lower:]

	cat file.txt | ' ' '_'

	cat file.txt | tr -d [:upper:]

Imprimindo a saída sem repetições:

	echo "Curso Liiiiinux" | tr -s i

	echo "Curso        Linux" | tr -s " "

Gerando um arquivo de texto no formato Linux, sem CRLF:

	tr -d "\r" < ArquivoGeradoNoWindows.txt > NovoArquivoGerado.txt

	file Arqui* NovoA*

Imprimindo o arquivo removendo os 5 primeiros caracteres:

	cut -c1-5 file.txt

Caracteres em posições específicos:

	cut -c1,2,5 file.txt

De um caracter específico em diante:

	cut -c5- file.txt

Definindo um delimitador:

	cut -d" " -f1 file.txt

Logins de todos os usuários do sistema contidos no arquivo passwd:

	cut -d: -f1 /etc/passwd

Definindo um string por outra com o sed:

	sed 's/Nome/NovoNome/' nomes.txt

Para não pular a linha ao fazer a alteração, utilizamos a flag global:

	sed 's/Nome/NovoNome/g' nomes.txt

Apagar linhas em um range:

	sed '3,5 d' nomes.txt

Apagar linhas com uma ocorrência de string específica:

	sed '/Nome/d' nomes.txt

	sed '/^#/d' nomes.txt

------------------------------------------------------------
	* * * * * 103.3 Perform basic file management * * * * *
------------------------------------------------------------

Questões: 4

cp
find
mkdir
mv
ls
rm
rmdir
touch
tar
cpio
dd
file
gzip
gunzip
bzip2
bunzip2
xz
unxz
file globbing

Navegando para o home do usuário atual:

	cd ~

Imprimindo os arquivos ocultos do diretório:

	ls -a

	ls -la

Imprimindo recursivamente o conteúdo de cada diretório:

	ls -lR

Imprimindo o tipo do arquivo:

	file arquivo.txt

Tem seu nome iniciado por ponto.

Copiando um arquivo para o diretório tmp:

	cp arquivo.txt /tmp/

Perguntando antes de sobrescrever um arquivo no destino:

	cp -i arquivo.txt /tmp/

O cp por padrão não copia diretórios. Para isso:

	cp -r Diretorio/ /tmp/

Copiando e preservando as características:

	cp -p arquivo.txt /tmp/

Copiando um arquivo para um novo arquivo:

	cp arquivo1.txt arquivoNovo.txt

	cp arquivo1.txt /tmp/arquivoNovo2.txt

Movendo um arquivo:

	mv arquivo.txt /tmp/

Note que o arquivo foi removido da origem.

Renomeando um arquivo:

	mv arquivo.txt nomeNovo.txt

Criando um arquivo vazio:

	touch arquivovazio.txt

	file arquivovazio.txt

Definindo o rótudo de tempo de um arquivo já existente:

	touch arquivovazio.txt

Definindo a data de acesso de um arquivo já existente:

	touch -a arquivovazio.txt

Definindo a data de modificação de um arquivo já existente:

	touch -m arquivovazio.txt

Especificando a data de modificação no formato AAAAMMDDhhmm:

	touch -t 202209220925 arquivovazio.txt

Removendo um arquivo:

	rm arquivo

	rm -i arquivo

Removendo um diretório:

	rm -r diretorio/

	rmdir diretorio/

Removendo todos os arquivos do diretório local:

	rm -rf . *

O rmdir só remove diretório vazio.

Criando um diretório:

	mkdir Linux

	mkdir Linux/Distros

Criando uma estrutura de diretórios:

	mkdir -p Cursos/Linux/Distros/Suse

Imprimindo arquivos por nome:

	find /home/ -name Linux

Imprimindo arquivos de um usuário:

	find /home/ -user liveuser

Imprimindo arquivos por tamanho:
		
	find /home/ -type f -size +1G

Imprimindo diretórios por tamanho:

	find /home/ -type d -size +100M
	
	find . -type d -size -5M

Imprimindo arquivos por extensão:

	find . -type f -name '*.pst'

Deletando arquivos e diretórios:

	find /home/ -type f -size +500M -delete

Imprimindo arquivos acessados há 7 dias pelo usuário por extensão:

	find /home/ -atime -7 -user muller -name '*.pdf'

Imprimindo arquivos alterados a 1 dia:

	find /home/ -ctime -1

Imprimindo arquivos modificados entre 30 e 90 dias pelo grupo vendas:
	
	find /home/ -type f -mtime +30 -mtime -90 -group vendas

Agrupando o conteúdo do /tmp/ no diretório atual:

	tar cpvf backup.tar /tmp/

	tar tf backup.tar

Desagrupando o conteúdo do aqruivo .tar no diretório local:

	tar xvf backup.tar

Compactando com o gzip:

	gzip backup.tar

	gzip -k backup.tar

Descompactando o arquivo tar.gz:

	gunzip backup.tar.gz

	gzip -d backup.tar.gz

Agrupando e compactando ao mesmo tempo com gzip:

	tar zcpvf backup.tgz /tmp/

Compactando com o bzip2:

	bzip2 backup.tar

	bzip2 -k backup.tar

Descompactando o arquivo tar.bz2:

	bunzip2 backup.tar.bz2

	bzip2 -d backup.tar.bz2

Agrupando e compactando ao mesmo tempo com bzip2:

	tar jcpvf backup.tbz /tmp/

Compactando com o xz:

	xz backup.tar.xz

	xz -k backup.tar.xz

Descompactando o arquivo tar.xz

	unxz backup.tar.xz

	xz -d backup.tar.xz

Agrupando e compactando ao mesmo tempo com xz:

	tar Jcpvf backup.txz /tmp/

Agrupando através de uma saída:

	find /home/ -type f -name '*.pdf' | cpio -o > backup.cpio

Desagrupando o conteúdo do aqruivo .cpio no diretório local:

	cpio -i < backup.cpio

Agrupando e compactando através de uma saída ao mesmo tempo com xz:

	find /home/ -type f -name '*.pdf' | cpio -o | xz > backup.cpio.zx

Descompactando o arquivo cpio.xz:

	xz -c backup.cpio.zx | cpio -i

Copiando uma partição, byte a byte:

	dd if=/dev/sr0 of=imagem.iso

------------------------------------------------------------
	* * * * * 103.4 Use streams, pipes and redirects * * * * *
------------------------------------------------------------

Questões: 4

tee
xargs

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

Executando comandos recebidos pela entrada padrão:

	find /home/ -type f -name '*.pdf' | xargs ls -l

	find /home/ -type f -size +1G | xargs rm -v

Imprimindo na saída padrão o resultado de um comando:

	echo "A versão do kernel é: " `uname -r`

	echo "A versão do kernel é: $(uname -r)

------------------------------------------------------------
	 * * * * * 103.5 Create, monitor and kill processes  * * * * *
------------------------------------------------------------

Questões: 4

&
bg
fg
jobs
kill
nohup
ps
top
free
uptime
pgrep
pkill
killall
watch
screen
tmux

Imprimindo os processos ativos nesse terminal:

	ps

Incluindo usuários e horário do processo:

	ps -u

Incluindo processos não associados ao terminal:

	ps -ux | less

Incluindo todos os processos:

	ps -aux | less

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

Encerrando um processo:

	pgrep firefox

	ps -aux | grep firefox

	kill -s SIGKILL <PID>

	kill -s 9 <PID>

	kill -9 <PID>

	kill -SIGKILL <PID>

	kill <PID>

O kill sem nenhum parâmetro envia o sinal 15 SIGTERM.

Encerrando processos através do nome:

	killall firefox

	killall java

	pkill firefox

Reiniciando um processo:

	kill -1 samba

	pkill -1 firefox -u muller

Imprimindo o tempo de atividade do sistema:

	uptime

Imprimindo a quantidade de memória e swap utilizada pelo sistema:

	free -m

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

Questões: 2

nice
ps
renice
top 

Definindo a prioridade de um processo:

	nice -n 10 firefox &

	nice -n -15 qps &

O nice vai de -20 até 19. Quanto < maior a prioridade!

Definindo a prioridade de um processo em execução:

	renice -n -16 17779

	renice -n -5 -u muller

	renice -n -10 -g diretoria

------------------------------------------------------------
	* * * * * 103.7 Search text files using regular expressions * * * * *
------------------------------------------------------------

Questões: 3

grep
egrep
fgrep
sed
regex(7)

Pesquisando em um arquivo de texto:

	grep Linux arquivo.txt

Contando a ocorrência:

	grep -c Linux arquivo.txt

Pesquisando em varios arquivos de texto:

	grep Linux *

	grep Linux arq*

	grep -i Linux *

Imprimindo recursivamente:

	grep -r Linux *.txt

Pesquisando com o egrep:

	egrep "b[aei]g" arquivo.txt

	egrep "b[a-u]g" arquivo.txt

Imprimindo pelo final da linha:

	egrep "^Linux$" arquivo.txt

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

Questões: 3

vi
/, ?
h,j,k,l
i, o, a
d, p, y, dd, yy
ZZ, :w!, :q!
EDITOR

Verificando a versão do vi:

	vi --version

Instalando o vi melhorado:

	apt install vim

Definindo o arquivo com o vi:

	vi arquivo.txt

Pesquisando Linux dentro do arquivo:

	/Linux

A cada Enter o cursor irá a próxima ocorrência.

Buscabdi uma ocorrência no sentido do início:

	SHIFT+N

	?Linux

Entrando no modo de inserção no local do cursor:

	i

Saindo do modo de inserção:

	ESC

Recortando uma linha e entrando no modo de inserção:

	cc

Colando o recorte no local do cursor:

	p

Recortando uma ou mais linhas sem entrar no modo de inserção:

	dd

	d3d

Copiando uma ou mais linhas:

	yy

	y3y

Salvando e saindo do arquivo:

	:wq

	:x

	ZZ

Abrindo o vi/vim com um buffer vazio:

	vi

Para sair e salvar o arquivo:

	:wq nome_do_arquivo.txt

Definindo o editor padrão do sistema:

	select-editor

	export EDITOR=vim

	crontab -e

------------------------------------------------------------

	* * * * * Topic 104: Devices, Linux arquivosystems, arquivosystem Hierarchy Standard * * * * *

------------------------------------------------------------
	* * * * * 104.1 Create partitions and filesystems * * * * *
------------------------------------------------------------

Questões: 2

fdisk
gdisk
parted
mkfs
mkswap

Imprimindo os discos e as partições de cada um deles:

	fdisk -l

	parted -l

	lsblk

É preciso estar como root.

Particionando o disco:

	fdisk /dev/sdb

		Command: f

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

	file -s /dev/sdb1

	df -T /dev/sdb1

Formatando a partição e definindo como swap:

	mkswap /dev/sdb3

	cat /proc/swaps

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

Questões: 2

du
df
fsck
e2fsck
mke2fs
tune2fs
xfs_repair
xfs_fsr
xfs_db

Imprimindo as partições montadas:

	df -h

	df -hT

Imprimindo o espaço utilizado em disco por diretórios ou arquivos:

	du -sh *
		
	du -sh /home/user/
		
	du -shc *

	du -ah *

	du -shc /home/user/

Verificando a integridade do sistema de arquivos:

	parted -l

	fsck /dev/sdb1

	fsck -t ext4 /dev/sdb1

A partição não deve estar montada!

Imprimindo as informação sobre o sistema de arquivos:

	tune2fs -l /dev/sdb1 | less

Definindo um label para a partição com o tune2fs:

	tune2fs -L "Pendrive" /dev/sdb1

	dumpe2fs -h /dev/sdb1

Definindo o tempo de checagem (check interval):

	tune2fs -i 7d /dev/sdb1

O xfs_admin é o comando equivalente para sistema de arquivos XFS.
Os comandos são similares ao tune2fs.

Instalação e utilização:

	apt install xfs*

	mkfs -t xfs /dev/sdb1

	mount /dev/sdb1 /mnt/xfs/

	df -T /dev/sdb1

Verificando a integridade de um sistema de arquivos XFS:

	xfs_repair /dev/sdb1

Verificando bugs:	

	xfs_db /dev/sdb1

		help

		frag

		quit

Desfragmentando um sistema de arquivos XFS:

	xfs_fsr /dev/sdb1

	xfs_fsr

Funciona com o sistema de arquivos montado!

------------------------------------------------------------
	* * * * * 104.3 Control mounting and unmounting of filesystems * * * * *
------------------------------------------------------------

Questões: 3

/etc/fstab
/media/
mount
umount
blkid
lsblk

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

	/dev/sdb3	/mnt/pendrive	auto	defaults	0	<fsck>

ou

	UUID=9c5d6d45-74da-4932-be67-eb63a562c778 /mnt/pendrive	auto	defaults	0	3

A última opção é o número da ordem do fsck, no Linux é executado por padrão no boot!

A partição de swap não precisa ser montada, portanto none!

------------------------------------------------------------
	* * * * * 104.4 Removed * * * * *
------------------------------------------------------------
	* * * * * 104.5 Manage file permissions and ownership * * * * *
------------------------------------------------------------

Questões: 3

chmod
umask
chown
chgrp

Definindo as permissões de acesso a um arquivo:

	ls -l /bin/ls

	chmod o-x /bin/ls

Efetue login em outro terminal com usuário comum.
Execute o comando ls e verifique que o user não
tem permissão para executar o programa.

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

	chmod -R /home/user/diretorioLinux
	
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

Definindo a permissão padrão do sistema com o umask:

	umask

Definindo o usuário e/ou o grupo dono do arquivo ou diretório:

	chown user arquivo.txt

	chown :suporte arquivo.txt
	
	chown user:group -R /home/user/Linux

	chgrp suporte -R /home/user/Linux

------------------------------------------------------------
	* * * * * 104.6 Create and change hard and symbolic links * * * * *
------------------------------------------------------------

Questões: 2

Description: Candidates should be able to create and manage hard and symbolic links to a file.

Key Knowledge Areas:

Create links.
Identify hard and/or soft links.
Copying versus linking files.
Use links to support system administration tasks.
The following is a partial list of the used files, terms and utilities:

ln
ls

Criando um link físico para o arquivo:

	ln script.sh Link-hard

	ls -li script.sh Link-hard

Note que ambos possuem o mesmo inode.
A edição de qualquer um refletirá no outro!
Não funciona em diretórios.

Criando um link simbólico para o arquivo:

	ln -s script.sh Link-simbolico

	ls -li script.sh Link-hard

Note a diferença no inode.
Similar a um atalho!
As permissões sempre são 777.

------------------------------------------------------------
	* * * * * 104.7 Find system files and place files in the correct location * * * * *
------------------------------------------------------------

Questões: 2

find
locate
updatedb
whereis
which
type
/etc/updatedb.conf

Diretórios que podem ser montados:

	/root
	
	/boot
	
	/tmp
	
	/home

		/home/user/.local/share/Trash/ -> lixeira

	/opt -> outras instalações, third-party apps
	
	/usr -> programas não críticos

		/usr/bin -> comandos não essenciais dos usuários comuns

		/usr/lib -> biblioteca de programas

		/usr/local -> programas instalados pelo sysadmin

		/usr/sbin -> comandos não essenciais

		/usr/share/man -> fontes do man

	/var -> arquivos de log e dinâmicos

		/var/log

		/var/mail

Imprimindo a busca com o locate:

	locate rpm *.pdf

Atualizando a base de dados do locate:

	updatedb

O comando whreis é mais restrito, e não pesquisa no /home:

	whreis fsck

	whereis ls

O comando which pesquisa no PATH da sessão atual:

	env | grep PATH

	which tar

O comando type exibe algumas informações de comandos:

	type bash

------------------------------------------------------------

	* * * * * Topic 105: Shell e scripts de shell * * * * * 

------------------------------------------------------------
	* * * * * 105.1 Customize and use the shell environment * * * * *
------------------------------------------------------------

Questões: 4

.
source
/etc/bash.bashrc
/etc/profile
env
export
set
unset
~/.bash_profile
~/.bash_login
~/.profile
~/.bashrc
~/.bash_logout
function
alias

------------------------------------------------------------
	* * * * * 105.2 Customize or write simple scripts * * * * *
------------------------------------------------------------

Questões: 4

for
while
test
if
read
seq
exec
||
&&

Criando o primeiro script:

	vi script.sh

		clear
		echo "+++++++++++ Meu primeiro script +++++++++++"
		echo ""
		uptime
		free -m
		echo "fim do script"

		:wq

Executando o script no bash atual:

	source script.sh

Executando em outro bash:

	chmod a+x script.sh

	.	script.sh

	./ /home/user/Scripts/script.sh

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

Declarando variáveis:

	vi script.sh

		#!/bin/bash
		clear
		echo "+++++++++++ Meu primeiro script +++++++++++"
		echo " "
		echo "O meu script se chama $0"
		echo "Esse script recebeu $# parametros que sao: $1 e $2"
		echo " "
		uptime
		free -m
		echo "fim do script"

		:wq

	script.sh 2205 Muller

	script.sh 10

	vi script.sh

		#!/bin/bash
		clear
		echo "+++++++++++ Meu primeiro script +++++++++++"
		echo " "
		echo "O meu script se chama $0"
		echo "Esse script recebeu $# parametros que sao: $1 e $2"
		echo " "
		echo -n "Digite um numero de 0 a 10: "
		read VAR1
		echo "O valor digitado foi $VAR1"
		echo "fim do script!"

		:wq

	script.sh 1 2

	vi script.sh

		#!/bin/bash
		clear
		echo "+++++++++++ Meu primeiro script +++++++++++"
		echo " "
		echo "O meu script se chama $0"
		echo "Esse script recebeu $# parametros que sao: $1 e $2"
		echo " "
		echo -n "Digite um numero de 0 a 10: "
		read VAR1
		echo "O valor digitado foi $VAR1"
		echo "fim do script!"

		:wq

	script.sh 2 3

	vi script.sh

		#!/bin/bash
		clear
		echo "+++++++++++ Meu primeiro script +++++++++++"
		echo " "
		echo "O meu script se chama $0"
		echo "Esse script recebeu $# parametros que sao: $1 e $2"
		echo " "
		echo -n "Digite um numero de 0 a 10: "
		read VAR1
		echo "O valor digitado foi $VAR1"
		echo "fim do script!"

		:wq

	vi script.sh

		#!/bin/bash
		clear
		VAR2="Curso Linux"
		VAR3=10
		VAR4=`cat /etc/passwd |wc -l`
		VAR5=$(date +%H)
		echo "+++++++++++ Meu primeiro script +++++++++++"
		echo " "
		echo "O meu script se chama $0"
		echo "Esse script recebeu $# parametros que sao: $1 e $2"
		echo " "
		echo -n "Digite um numero de 0 a 10: "
		read VAR1
		echo "O valor digitado foi $VAR1"
		echo " "
		echo "O arquivo /etc/passwd possui $VAR4 linhas e a hora atual é $VAR5"
		echo " "
		echo "Esse curso é nota $VAR3"
		echo " "
		echo "fim do script!"

		:wq

	script.sh 3 4

	vi script.sh

		#!/bin/bash
		clear
		VAR2="Curso Linux"
		VAR3=10
		VAR4=`cat /etc/passwd |wc -l`
		VAR5=$(date +%H)
		echo "+++++++++++ Meu primeiro script +++++++++++"
		echo " "
		echo "O meu script se chama $0"
		echo "Esse script recebeu $# parametros que sao: $1 e $2"
		echo " "
		echo -n "Digite um numero de 0 a 10: "
		read VAR1
		echo "O valor digitado foi $VAR1"
		echo " "
		echo "O arquivo /etc/passwd possui $VAR4 linhas e a hora atual é $VAR5"
		echo " "
		echo "Esse curso é nota $VAR3"
		echo " "
		# TESTE DO IF
		if [ $VAR4 -gt $VAR3 ] ; then
			echo "O sistema tem mais de $VAR3 usuários!"
		else
			echo "O sistema tem menos de $VAR3 usuários!"
		fi

		echo "fim do script!"

		:wq

	./script.sh

	vi script.sh

		#!/bin/bash
		clear
		VAR2="Curso Linux"
		VAR3=10
		VAR4=`cat /etc/passwd |wc -l`
		VAR5=$(date +%H)
		echo "+++++++++++ Meu primeiro script +++++++++++"
		echo " "
		echo "O meu script se chama $0"
		echo "Esse script recebeu $# parametros que sao: $1 e $2"
		echo " "
		echo -n "Digite um numero de 0 a 10: "
		read VAR1
		echo "O valor digitado foi $VAR1"
		echo " "
		echo "O arquivo /etc/passwd possui $VAR4 linhas e a hora atual é $VAR5"
		echo " "
		echo "Esse curso é nota $VAR3"
		echo " "
		# TESTE DO IF
		if [ $VAR4 -gt $VAR3 ] ; then
			echo "O sistema tem mais de $VAR3 usuários!"
		else
			echo "O sistema tem menos de $VAR3 usuários!"
		fi

		echo "fim do script!"

		# TESTE DO CASE
		echo " "
		case $VAR1 in 
		0)
			echo "O valor digitado foi 0"
		;;
		1|2|3|4|5)
			echo "O valor digitado foi entre 1 e 5!"
		sleep 3
		;;
		*)
			echo "O valor digitado foi maior que 5!!"
		esac

		:wq

	./script.sh
	
------------------------------------------------------------

	* * * * * Topic 106: User Interfaces and Desktops * * * * * 

------------------------------------------------------------
	* * * * * 106.1 Install and configure X11 * * * * *
------------------------------------------------------------

Questões: 2

/etc/X11/xorg.conf
/etc/X11/xorg.conf.d/
~/.xsession-errors
xhost
xauth
DISPLAY
X

------------------------------------------------------------
	* * * * * 106.2 Graphical Desktops * * * * *
------------------------------------------------------------

Questões: 1

KDE
Gnome
Xfce
X11
XDMCP
VNC
Spice
RDP

O xrdp é uma alternativa para acessar estações Linux através do MS RDP. 
Site: http://xrdp.org/

Instalação:

	apt install xrdp

	systemctl enable xrdp

	ufw allow from any to any port 3389 proto tcp

------------------------------------------------------------
	* * * * * 106.3 Accessibility * * * * *
------------------------------------------------------------

Questões: 1

High Contrast/Large Print Desktop Themes.
Screen Reader.
Braille Display.
Screen Magnifier.
On-Screen Keyboard.
Sticky/Repeat keys.
Slow/Bounce/Toggle keys.
Mouse keys.
Gestures.
Voice recognition.

------------------------------------------------------------

	* * * * * Topic 107: Administrative Tasks * * * * * 

------------------------------------------------------------
	* * * * * 107.1 Manage user and group accounts and related system files * * * * *
------------------------------------------------------------

Questões: 5

/etc/passwd
/etc/shadow
/etc/group
/etc/skel/
chage
getent
groupadd
groupdel
groupmod
passwd
useradd
userdel
usermod

Adicionando um usuário no sistema:

	useradd <user>

Adicionando um grupo no sistema:

	groupadd <group>

Adicionando um usuário criado em um grupo:

	adduser <user> <group>
	
	gpasswd -a <user> <group>

	usermod -a -G <group> <user>

Adicionando um usuário sem diretório home:

	useradd -M <user>

	useradd -no-create-home <user>

Adicionando um usuário e seu diretório pessoal:

	useradd <user> -d /home/linux/

Definindo o grupo primário de um usuário:

	usermod -g <group> <user>

Removendo um usuário de um grupo:

	gpasswd -d <user> <group>

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

Questões: 4

/etc/cron.{d,daily,hourly,monthly,weekly}/
/etc/at.deny
/etc/at.allow
/etc/crontab
/etc/cron.allow
/etc/cron.deny
/var/spool/cron/
crontab
at
atq
atrm
systemctl
systemd-run

	Definindo o arquivo de configuração do crontab:

		vim /etc/crontab

	agendando uma tarefa semanal de backup sábado às 19h:

		00 19 * * 6 root rsync -Cravzp --delete <origem> <destino>

------------------------------------------------------------
	* * * * ** 107.3 Localisation and internationalisation * * * * **
------------------------------------------------------------

Questões: 3

/etc/timezone
/etc/localtime
/usr/share/zoneinfo/
LC_*
LC_ALL
LANG
TZ
/usr/bin/locale
tzselect
timedatectl
date
iconv
UTF-8
ISO-8859
ASCII
Unicode

------------------------------------------------------------

 * * * * * Topic 108: Essential System Services * * * * *

------------------------------------------------------------
	* * * * * 108.1 Maintain system time * * * * *
------------------------------------------------------------

Questões: 3

/usr/share/zoneinfo/
/etc/timezone
/etc/localtime
/etc/ntp.conf
/etc/chrony.conf
date
hwclock
timedatectl
ntpd
ntpdate
chronyc
pool.ntp.org

	instalando e configurando o servidor NTP:

		apt-get install ntp

	Definindo o arquivo /etc/ntp.conf:

		pool st1.ntp.br
		pool st2.ntp.br
		pool st3.ntp.br
		pool gps.ntp.br

		ou
		servers pool.ntp.br

		/etc/init.d ntp restart

	verificando o status do serviço:
		ntpq -p
		date

------------------------------------------------------------
	* * * * * 108.2 System logging * * * * *
------------------------------------------------------------

Questões: 4

/etc/rsyslog.conf
/var/log/
logger
logrotate
/etc/logrotate.conf
/etc/logrotate.d/
journalctl
systemd-cat
/etc/systemd/journald.conf
/var/log/journal/

------------------------------------------------------------
	* * * * * 108.3 Mail Transfer Agent (MTA) basics * * * * *
------------------------------------------------------------

Questões: 3

~/.forward
sendmail emulation layer commands
newaliases
mail
mailq
postfix
sendmail
exim

------------------------------------------------------------
	* * * * * 108.4 Manage printers and printing * * * * *
------------------------------------------------------------

Questões: 2

CUPS configuration files, tools and utilities
/etc/cups/
lpd legacy interface (lpr, lprm, lpq)

------------------------------------------------------------

	* * * * * Topic 109: Networking Fundamentals * * * * *

------------------------------------------------------------
	* * * * * 109.1 Fundamentals of internet protocols * * * * * 
------------------------------------------------------------

Questões: 4

Description: Candidates should demonstrate a proper understanding of TCP/IP network fundamentals.

Key Knowledge Areas:

Demonstrate an understanding of network masks and CIDR notation.
Knowledge of the differences between private and public "dotted quad" IP addresses.
Knowledge about common TCP and UDP ports and services (20, 21, 22, 23, 25, 53, 80, 110, 123, 139, 143, 161, 162, 389, 443, 465, 514, 636, 993, 995).
Knowledge about the differences and major features of UDP, TCP and ICMP.
Knowledge of the major differences between IPv4 and IPv6.
Knowledge of the basic features of IPv6.
The following is a partial list of the used files, terms and utilities:

/etc/services
IPv4, IPv6
Subnetting
TCP, UDP, ICMP

Protocolos importantes e suas portas:

	cat /etc/services

------------------------------------------------------------
	* * * * * 109.2 Persistent network configuration * * * * *
------------------------------------------------------------

Questões: 4

/etc/hostname
/etc/hosts
/etc/nsswitch.conf
/etc/resolv.conf
nmcli
hostnamectl
ifup
ifdown

Imprimindo o nome da máquina:

	cat /etc/hostname

	hostname

	hostnamectl

Definindo o nome da máquina:

	hostnamectl set-hostname novonome-pc

Criando uma relação estática entre ip e hostname:

	cat /etc/hosts

	vim /etc/hosts

		192.168.1.112 srv-linux

		192.168.1.100 pc01 pc01.minharede.local

	ping srv-linux

Criando uma relação de consulta quando uma informação é requisitada:

	cat /etc/nsswitch.conf

Arquivo Network Services Switch.

Criando uma relação estática de rede:

	vim /etc/networks

		rede-local	192.168.0.0

Definindo os servidores de DNS utilizados pelo sistema:

	cat /etc/resolv.conf

	vim /etc/resolv.conf

		nameserver 192.168.0.65
		nameserver 208.67.222.222
		nameserver 208.67.220.220
		nameserver 1.1.1.1

	ls -l /etc/resolv.conf

Nas distribuições atuais esse arquivo é dinâmico.
Antes de alterar manualmente precisa desativar o netconfig:

	vim /etc/sysconfig/network/config

		NETCONFIG_DNS_POLICY=""

Imprimindo o status das configurações de rede:

	systemctl status NetworkManager 

Arquivo de configuração:

	cat /etc/NetworkManager

Imprimindo informações das interfaces disponíveis:

	nmcli

	nmcli device

	nmcli connection

Derrubando e subindo uma conexão:

	nmcli connection down eth01

	nmcli device

	nmcli connection up eth01

Adicionando um nova conexão:

	nmcli connection add type ethernet con-name NovaRede ifname eth02 ip4 172.22.22.100/24 gw4 172.22.22.254

	cd /etc/NetworkManager/system-connections/

	ls -la

	cat NovaRede

Deletando uma conexão:

	nmcli connection del NovaRede

	nmcli connection --help

------------------------------------------------------------
	* * * * * 109.3 Basic network troubleshooting * * * * *
------------------------------------------------------------

Questões: 4

ip
hostname
ss
ping
ping6
traceroute
traceroute6
tracepath
tracepath6
netcat
ifconfig
netstat
route

Informando a rota dos pacotes:

	traceroute <url>

Informando a rota dos pacotes sem definir nomes:

	traceroute -n <url>

Visualizando o IP/MAC da interface:
	
	ip a show

	ifconfig

Reiniciando a placa de rede:

	ifconfig eth0 down
	
	ifconfig eth0 up

Definindo o /etc/network/interfaces:

		auto lo
		iface lo inet loopback

Definindo IP fixo:

		auto eth0
		iface eth0 inet static
		address 192.168.x.x
		netmask 255.255.x.x
		gateway 192.168.x.x
		dns-nameservers 8.8.8.8 8.8.4.4

Definindo MAC:

	ifconfig eth0 down
	
	ip link set dev eth0 address 1A:2B:3C:55:66:00
	
	ifconfig eth0 up

------------------------------------------------------------
	* * * * * 109.4 Configure client side DNS * * * * *
------------------------------------------------------------

Questões: 2

/etc/hosts
/etc/resolv.conf
/etc/nsswitch.conf
host
dig
getent

	configurando o cliente de DNS:
		/etc/resolv.conf

------------------------------------------------------------

	* * * * * Topic 110: Security * * * * * 

------------------------------------------------------------
	* * * * * 110.1 Perform security administration tasks * * * * *
------------------------------------------------------------

Questões: 3

find
passwd
fuser
lsof
nmap
chage
netstat
sudo
/etc/sudoers
su
usermod
ulimit
who, w, last

Descobrindo os hosts da rede:

	nmap -sP 192.168.0.0/24

	nmap -sP 192.168.0.*

Descobrindo as portas abertas de um alvo: 

	nmap -sT 192.168.0.10

	nmap -Pn 192.168.0.20

Descobrindo se uma porta específica está aberta:

	nmap -p 80 192.168.0.0/24

	nmap -p 80 localhost

	nmap -p 21 192.168.1.1

Descobrindo o SO de um alvo:

	nmap -0 192.168.1.5

------------------------------------------------------------
	* * * * * 110.2 Setup host security * * * * *
------------------------------------------------------------

Questões: 3

Description: Candidates should know how to set up a basic level of host security.

Key Knowledge Areas:

Awareness of shadow passwords and how they work.
Turn off network services not in use.
Understand the role of TCP wrappers.
The following is a partial list of the used files, terms and utilities:

/etc/nologin
/etc/passwd
/etc/shadow
/etc/xinetd.d/
/etc/xinetd.conf
systemd.socket
/etc/inittab
/etc/init.d/
/etc/hosts.allow
/etc/hosts.deny

------------------------------------------------------------
	* * * * * 110.3 Securing data with encryption * * * * *
------------------------------------------------------------

Questões: 4

Description: The candidate should be able to use public key techniques to secure data and communication.

Key Knowledge Areas:

Perform basic OpenSSH 2 client configuration and usage.
Understand the role of OpenSSH 2 server host keys.
Perform basic GnuPG configuration, usage and revocation.
Use GPG to encrypt, decrypt, sign and verify files.
Understand SSH port tunnels (including X11 tunnels).
The following is a partial list of the used files, terms and utilities:

ssh
ssh-keygen
ssh-agent
ssh-add
~/.ssh/id_rsa and id_rsa.pub
~/.ssh/id_dsa and id_dsa.pub
~/.ssh/id_ecdsa and id_ecdsa.pub
~/.ssh/id_ed25519 and id_ed25519.pub
/etc/ssh/ssh_host_rsa_key and ssh_host_rsa_key.pub
/etc/ssh/ssh_host_dsa_key and ssh_host_dsa_key.pub
/etc/ssh/ssh_host_ecdsa_key and ssh_host_ecdsa_key.pub
/etc/ssh/ssh_host_ed25519_key and ssh_host_ed25519_key.pub
~/.ssh/authorized_keys
ssh_known_hosts
gpg
gpg-agent
~/.gnupg/

Arquivo de configuração do cliente ssh:

	/etc/ssh/ssh_config

Instalando o ssh server:

	apt install openssh-server

	dpkg -l | grep ssh

Arquivo de configuração do servidor ssh:

	/etc/ssh/sshd_config

Conectando em um servidor ssh:

	ssh muller@192.168.222.50

	ssh manager@10.0.30.5:22

	ssh user@172.16.1.80 -p 22443

	ssh user@srv-linux -p 22

Arquivo que contém os hosts conhecidos:

	ls -la /home/user/.ssh/

	cat known_hosts

Gerando uma chave pública com o gpg:

	gpg --gen-key

	gpg --list-keys

	gpg --expert --full-gen-key

Arquivo que contém as informações das chaves:

	ls -la /home/user/.gnupg/

Exportando a chave pública:

	gpg --list-keys

	gpg --export "Muller Jorge" > key.muller.pub

	gpg --export --armor "Muller Jorge" > key.muller.pub.asc

	gpg --export --armor "Muller Jorge" --output key.muller.pub.asc

Exportando a chave pública através de um servidor:

	gpg --keyserver keys.openpgp.org --send-keys <ID>

Desfazendo:

	gpg --keyserver keys.openpgp.org --gen-revoke <ID>

Importando a chave pública (máquina cliente):

	gpg --import chave-muller.pub

	gpg --list-keys

Importando a chave pública através de um servidor (máquina cliente):

	gpg --keyserver keys.openpgp.org --recv-keys <ID>

	gpg --list-keys

Encriptando um arquivo (não necessita de chaves):

	gpg -c arquivo.txt

	gpg -ac arquivo.txt

Decriptando:

	gpg arquivo.txt.gpg
