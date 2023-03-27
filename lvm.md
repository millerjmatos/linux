LVM, ou Logical Volume Manager, é um software de gerenciamento de armazenamento para sistemas operacionais Linux que permite criar e gerenciar partições lógicas em discos rígidos ou dispositivos de armazenamento em rede. O LVM funciona como uma camada de abstração entre o sistema de arquivos e o hardware de armazenamento, permitindo que as partições sejam facilmente redimensionadas, movidas e combinadas sem a necessidade de formatar ou desmontar o sistema de arquivos. O LVM também oferece recursos avançados, como espelhamento de disco para maior redundância e segurança, e snapshot para backups rápidos e consistentes. Com o LVM, os administradores de sistemas têm mais controle e flexibilidade sobre o gerenciamento de armazenamento em seus servidores Linux, permitindo a fácil expansão ou redução de partições sem interrupções no serviço.

Layout, ex.:

    LVM {

        File Systems -> /home (ext3)        /data (xfs)        /var (ext4)

            Logical Volume (LV) -> /dev/primeiro_vg/home_lv        /dev/primeiro_vg/data_lv        

                Volume Groups (VG) -> primeiro_vg        segundo_vg

                    Physical Volume (PV) -> /dev/sdb1        /dev/sdb2        /sdc1
    
        }
    
        Partições -> /dev/sdb1        /dev/sdb2        /sdc1

            Discos -> /dev/sdb        /dev/sdc

Imprimindo informações dos volumes físicos:

    pvdisplay

    pvs

Imprimindo informações dos grupos de volumes:

    vgdisplay

    vgs

Imprimindo informações dos volumes lógicos:

    lvdisplay

    lvs

---

Expandindo um diretório (LV)..

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

Criando o volume físico:

    pvcreate /dev/sdb1

Physical volume "/dev/sdb1" successfully created.

    pvdisplay

Expandindo o grupo de volume lógico:

    vgdisplay

    vgextend <VG NAME> /dev/sdb1

Volume group "webserver_vg" successfully extended.

    vgdisplay

    df -h

Vamos aumentar o espaço do diretório /var como ex.:

    vgdisplay

Procurar o LV Path que queremos expandir:

    lvresize -L +5GB /dev/webserver_vg/var  

Size of logical volume webserver_vg/var changed from 1,65 GiB (423 extents) to 6,65 GiB (1703 extents).
Logical volume webserver_vg/var successfully resized.

    df -h

Atualizando:

    resize2fs /dev/webserver_vg/var 

Filesystem at /dev/webserver_vg/var is mounted on /var; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 1
The filesystem on /dev/webserver_vg/var is now 1743872 (4k) blocks long.

---

Adicionando uma área swap de 4GB em um segundo (VG)..

Criando uma unidade de volume físico (PV):

    pvcreate /dev/sdc1

    pvs

Adicionando o (PV) ao grupo de volume (VG):

    vgcreate memory_vg /dev/sdc1

    vgs

A criação do (LV) requer um conjunto de informações que serão solicitadas ao aplicar o comando lvcreate:

    lvcreate -L 4G -n swap2_lv memory_vg

    lvs

Montagem:

    mkswap /dev/mapper/memory_vg/swap2_lv

    free -h

    swapon /dev/mapper/memory_vg/swap2_lv

    free -h

    swapon -s