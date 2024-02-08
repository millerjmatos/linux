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