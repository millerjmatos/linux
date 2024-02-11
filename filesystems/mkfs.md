Formatando a partição e definindo o sistema de arquivos:

	mkfs -t ext4 /dev/sdb1
	
Montando a partição:

	mkdir  /mnt/media/pendrive
	
	mkfs -t ext4 /dev/sdb1 /mnt/media/pendrive

Utilizando exFAT em um pendrive previamente montado:

	apt install exfat-fuse exfat-utils

	umount /dev/sdc1

	mkfs -t exfat /dev/sdc1

	mount /dev/sdc1 /media/pendrive

Instalação e utilização com xfs:

	apt install xfs*

	mkfs -t xfs /dev/sdb1

	mount /dev/sdb1 /mnt/xfs/

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
