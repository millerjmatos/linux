RAID (Redundant Array of Independent Disks) é uma tecnologia de armazenamento que usa vários discos rígidos para melhorar a confiabilidade, desempenho e/ou capacidade de armazenamento de um sistema.

Existem diferentes níveis RAID, cada um com seu próprio conjunto de vantagens e desvantagens. Os níveis mais comuns são RAID 0, RAID 1, e RAID 5.

O RAID 0 combina dois ou mais discos rígidos em uma única unidade de armazenamento, o que aumenta o desempenho e a capacidade, mas não oferece proteção contra falhas de disco.

O RAID 1 usa dois ou mais discos rígidos idênticos para criar uma cópia exata dos dados em cada disco. Se um disco falhar, os dados ainda estão disponíveis no outro.

O RAID 5 usa pelo menos três discos rígidos para dividir os dados em blocos e distribuí-los entre os discos, com um bloco de paridade adicional usado para proteger contra falhas de disco.

#### RAID 1:

Instalando a ferramenta:

	apt-get install mdadm

	systemctl reboot

Criando as novas partições primárias com tamanhos iguais e tipo raid (fd):

	fdisk /dev/sdb
	
	fdisk /dev/sdc

Criando o dispositivo RAID /dev/md0:

	mdadm -C /dev/md0 -l 1 -n 2 /dev/sd[b-c]1

	cat /proc/mdstat

Formatando e montando o RAID:

	mkfs -t ext4 /dev/md0
	
	mkdir /raid
	
	mount -t ext4 /dev/md0 /raid
	
	df -h

Tornando persistente:

	vim /etc/fstab

		/dev/md0		/raid		ext4		defaults		0	0	

Salvando a configuração:

	mdadm -D --scan >> /etc/mdadm/mdadm.conf

Imprimindo informações:

	mdadm -D /dev/md0

Simulando uma falha no array (via software):

	mdadm --manage /dev/md0 -f /dev/sdc1

Removendo um disco com falha:

	mdadm --manage /dev/md0 -r /dev/sdc1

Recomendado desligar o sistema e remover o disco com falha:

	systemctl poweroff

Adicionando novo disco substituto ao array:

O disco deve ser particionado com o tipo RAID (fd), e ter o mesmo tamanho e sistema de arquivos.

	mdadm --manage /dev/md0 -a /dev/sdd1

	mdadm -D /dev/md0

É possível adicionar mais discos ao array!

Desmontando:

	umount /raid

Removendo:

	mdadm -r /dev/md0

Excluindo o superbloco em todos os drives do array:

	mdadm --zero-superblock /dev/sd[bc]1