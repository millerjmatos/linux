RAID (Redundant Array of Independent Disks) é uma tecnologia de armazenamento que usa vários discos rígidos para melhorar a confiabilidade, desempenho e/ou capacidade de armazenamento de um sistema.

Existem diferentes níveis RAID, cada um com seu próprio conjunto de vantagens e desvantagens. Os níveis mais comuns são RAID 0, RAID 1, e RAID 5.

O RAID 0 combina dois ou mais discos rígidos em uma única unidade de armazenamento, o que aumenta o desempenho e a capacidade, mas não oferece proteção contra falhas de disco.

O RAID 1 usa dois ou mais discos rígidos idênticos para criar uma cópia exata dos dados em cada disco. Se um disco falhar, os dados ainda estão disponíveis no outro.

O RAID 5 usa pelo menos três discos rígidos para dividir os dados em blocos e distribuí-los entre os discos, com um bloco de paridade adicional usado para proteger contra falhas de disco.

#### RAID 1:

Instalando a ferramenta:

	dnf in mdadm

Discos do exemplo: 

	/dev/sdb
	
	/dev/sdc

Criando as novas partições primárias com tamanhos iguais e tipo raid (fd):

	fdisk /dev/sdb
	
	fdisk /dev/sdc

Criando o dispositivo RAID /dev/md0:

	mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sd[b-c]1

Verificando o RAID:

	cat /proc/mdstat

	mdadm --detail /dev/md0

Formatando e montando o RAID:

	mkfs -t xfs /dev/md0
	
	mkdir /raid
	
	mount -t xfs /dev/md0 /raid
	
	df -h

Atualizando o arquivo de configuração:

	mdadm --detail --scan --verbose >> /etc/mdadm.conf

#### RESOLVENDO FALHA NO DISCO:

Verificar o status do array:

	mdadm --detail /dev/md0 ; cat /proc/mdstat

Simulando uma falha no array (via software):

	mdadm --manage --set-faulty /dev/md0 /dev/sdc1

Remover um disco com falha:

	mdadm /dev/md0 -r /dev/sdc1

Adicionar disco novo substituto ao array:

	mdadm /dev/md0 -a /dev/

#### DESFAZENDO O RAID:

Desmontando o array:

	umount /raid

Parar o array:

	mdadm --stop /dev/md0

Remover o array:

	mdadm --remove /dev/md0

Excluir o superbloco em todos os drives do array:

	mdadm --zero-superblock /dev/sd[bc]1

Editar o arquivo:

	/etc/mdadm/mdadm.conf