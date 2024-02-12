Os módulos que estão carregados no momento:

	lsmod

Mais informações sobre o módulo:

	modinfo <módulo>

Para remover um módulo carregado:

	rmmod <módulo>

O dispositivo de audio que está sendo utilizado pelo sistema:

	lspci | grep Audio
	
O IRQ utilizado pelo dispositivo de áudio/multimídia:

	lspci -s 01:00.1 -v

Informações sobre os dispositivos USB conectados ao sistema:

	lsusb

	lsusb -s 001:001 -v

Quantidade de devices conectados em seu barramento USB:

	lsusb | wc -l

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
