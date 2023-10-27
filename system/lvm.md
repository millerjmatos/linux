LVM, ou Logical Volume Manager, é um software de gerenciamento de armazenamento para sistemas operacionais Linux que permite criar e gerenciar partições lógicas em discos rígidos ou dispositivos de armazenamento em rede. O LVM funciona como uma camada de abstração entre o sistema de arquivos e o hardware de armazenamento, permitindo que as partições sejam facilmente redimensionadas, movidas e combinadas sem a necessidade de formatar ou desmontar o sistema de arquivos. O LVM também oferece recursos avançados, como espelhamento de disco para maior redundância e segurança, e snapshot para backups rápidos e consistentes. Com o LVM, os administradores de sistemas têm mais controle e flexibilidade sobre o gerenciamento de armazenamento em seus servidores Linux, permitindo a fácil expansão ou redução de partições sem interrupções no serviço.

Imprimindo informações dos volumes físicos:

    pvdisplay

    pvs

Imprimindo informações dos grupos de volumes:

    vgdisplay

    vgs

Imprimindo informações dos volumes lógicos:

    lvdisplay

    lvs

### Redimensionar volume lógico

Particionando uma nova mídia vazia:

    fdisk -l

    fdisk /dev/sdb

        Command: n

		Partition type: p primary

		Partition number: 1

		First sector: "Enter" default

		Last sector: "Enter" default

		Command: p

        Command: w

    fdisk /dev/sdb

        Command: t

        Command: L

        Command: 8E

O tipo da partição "Linux" foi alterado para "Linux LVM".

        Command: w

    pvdisplay

    fdisk -l

Criando volume físico:

    pvcreate /dev/sdb1

Physical volume "/dev/sdb1" successfully created.

    pvdisplay

Expandindo grupo de volume:

    vgdisplay

    vgextend nome_do_volume_group_existente /dev/nome_do_pv

Volume group "nome_do_volume_group" successfully extended.

    vgdisplay

    df -h

Expandindo o LV, como ex. /data, referenciando o LV Path:

    lvresize -L +5GB /dev/mapper/nome_do_logical_volume

    lvextend -L +5GB -r /dev/mapper/nome_do_logical_volume

O parâmetro -r é específico para o comando lvextend. Isso permite aproveitar o espaço adicional no LV sem a necessidade dos comandos a seguir para redimensionamento manual.

Size of logical volume nome_do_logical_volume changed from 1,65 GiB (423 extents) to 6,65 GiB (1703 extents).
Logical volume nome_do_logical_volume successfully resized.

    df -h

Redimensionando o sistema de arquivos:

    resize2fs /dev/mapper/nome_do_logical_volume 

Em sistema de arquivos xfs:

    xfs_growfs /dev/mapper/nome_do_logical_volume

Filesystem at /dev/mapper/nome_do_logical_volume is mounted on /data; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 1
The filesystem on /dev/mapper/nome_do_logical_volume is now 1743872 (4k) blocks long.

### Adicionar área swap em novo grupo de volume

Particionar o disco com o fdisk e tipo 8e.

Criando volume físico:

    pvcreate /dev/sdc1

    pvs

Criando grupo de volume referenciando o volume físico:

    vgcreate memory_vg /dev/sdc1

    vgs

Criar LV requer um conjunto de informações ao aplicar o comando lvcreate:

    lvcreate -L 4G -n swap2_lv memory_vg

    lvs

Montagem:

    mkswap /dev/mapper/memory_vg-swap2_lv

    swapon /dev/mapper/memory_vg-swap2_lv

    swapon -s

Edite o fstab:

    vim /etc/fstab

        /dev/mapper/memory_vg-swap2_lv        none    swap    sw      0       0

Se houver espaço livre em um volume físico (PV), você pode usá-lo para criar um novo LV ou redimensionar um LV existente!

Interface gráfica para família Debian:

    apt install system-config-lvm

Família RHEL o cockpit permite gerenciar todos os aspectos do LVM.