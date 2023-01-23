# Imprimindo informações dos volumes físicos:

    df -h

    pvdisplay

# Implimindo informações dos grupos de volumes:

    vgdisplay

# Imprimindo informações dos volumes lógicos:

    lvdisplay

# Acrescente uma nova mídia vazia no sistema!

    fdisk -l

    fdisk /desv/sdb

        Command: n

		Partition type: p primary

		Partition number: 1

		First sector: "Enter" default

		Last sector: "Enter" default

		Command: p

        Command: w

    fdisk /desv/sdb

        Command: t

        Command: L

        Command: 8E

# O tipo da partição "Linux" foi alterado para "Linux LVM".

        Command: w

    pvdisplay

    fdisk -l

# Criando o volume físico:

    pvcreate /dev/sdb1

# Physical volume "/dev/sdb1" successfully created.

    pvdisplay

# Expandindo o grupo de volume lógico:

    vgdisplay

    vgextend <VG NAME> /dev/sdb1

# Volume group "webserver-vg" successfully extended.

    vgdisplay

    df -h

# Vamos aumentar o espaço do diretório /var como ex.:

    vgdisplay

# Procurar o LV Path que queremos expandir:

    lvresize -L +5GB /dev/webserver-vg/var  

# Size of logical volume webserver-vg/var changed from 1,65 GiB (423 extents) to 6,65 GiB (1703 extents).
# Logical volume webserver-vg/var successfully resized.

    df -h

    resize2fs /dev/webserver-vg/var 

# Filesystem at /dev/webserver-vg/var is mounted on /var; on-line resizing required
# old_desc_blocks = 1, new_desc_blocks = 1
# The filesystem on /dev/webserver-vg/var is now 1743872 (4k) blocks long.