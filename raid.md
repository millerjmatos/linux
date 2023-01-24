------------------------------------------------------------
### _	RAID 1:
------------------------------------------------------------

### Instalando a ferramenta:

	apt-get install mdadm

### Discos do exemplo: 

	/dev/sdb & /dev/sdc

### Criando as novas partições primárias com tamanhos iguais e tipo raid (fd):

	fdisk /dev/sdb
	
	fdisk /dev/sdc

### Criando o dispositivo RAID /dev/md0:

	mdadm --create /dev/md0 --verbose --level=1 --raid-devices=2 /dev/sdb1 /dev/sdc1

### Verificando o RAID:

	cat /proc/mdstat

	mdadm --detail /dev/md0

### Adicionando o RAID ao arquivo de configuração do mdadm:

	mdadm -Es | grep md >> /etc/mdadm/mdadm.conf

### Formatando e montando o RAID:

	mkfs -t ext4 /dev/md0
	
	mkdir /raid
	
	mount -t ext4 /dev/md0 /raid
	
	df -h
------------------------------------------------------------
### _	RESOLVENDO FALHA NO DISCO:
------------------------------------------------------------

### Verificar o status do array:

	mdadm --detail /dev/md0 ; cat /proc/mdstat

### Simulando uma falha no array (via software):

	mdadm --manage --set-faulty /dev/md0 /dev/sdc1

### Remover um disco com falha:

	mdadm /dev/md0 -r /dev/sdc1

### Adicionar disco novo substituto ao array:

	mdadm /dev/md0 -a /dev/

------------------------------------------------------------
### _	DESFAZENDO O RAID:
------------------------------------------------------------

### Desmontando o array:

	umount /raid

### Parar o array:

	mdadm --stop /dev/md0

### Remover o array:

	mdadm --remove /dev/md0

### Excluir o superbloco em todos os drives do array:

	mdadm --zero-superblock /dev/sd[bc]1

### Editar o arquivo: "/etc/mdadm/mdadm.conf"