Criando os diretórios que vão receber os dispositivos:

    cd /mnt/

    mkdir pendrive

    mkdir hd_externo

Descobrindo os dispositivos:

    fdisk -l

Montando:

    mount /dev/sdb1 /mount/pendrive

Caso o sistema de arquivos seja NTFS:

    apt-get install ntfs-3g

    mount -t ntfs-3g /dev/sdc1 /mnt/hd_externo

Desmontando:

    umount /dev/sdb1 && umount /dev/sdc1

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
