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

Demontando:

    umount /dev/sdb1 && umount /dev/sdc1