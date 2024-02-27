O pacote nfs-utils é um conjunto de utilitários que permitem que um sistema Linux atue como um cliente ou servidor do protocolo Network File System (NFS). O NFS é um protocolo que permite que sistemas operacionais compartilhem arquivos e diretórios em uma rede.

Instale o pacote nfs-utils:

    yum search nfs

    yum install nfs-utils

Verificando se o firewalld está ativo:

    firewall-cmd --state

    systemctl status firewalld.service

Verificando as regras existentes:

    firewall-cmd --permanent --list-all

    firewall-cmd --list-services

Adicionando um serviço:

    firewall-cmd --add-service=nfs --permanent

    firewall-cmd --reload

Verificando o deamon do nfs server:

    systemctl status nfs-server.service

    systemctl enable --now nfs-server.service

Criando um compartilhamento:

    mkdir -p /nfs{1,2,3}

    vim /etc/exports

        /nfs1        192.168.10.20(rw,no_root_squash)    
        /nfs2       192.168.10.222(rw,no_root_squash) 
        /nfs3       192.168.10.0/24(rw,no_root_squash) 

        :wq

Utilitário que exporta diretórios para acesso NFS:

    exportfs -rav

Utilitário que mostra quais sistemas de arquivos estão exportados por um servidor NFS:

    showmount -e 192.168.10.2

> Configurando o cliente.

Instale o pacote nfs-utils ou nfs-common

Montando o compartilhamento exportado no servidor:

    mkdir -p /mnt/nfs

    mount -t nfs 192.168.10.2:/nfs3    /mnt/nfs

    df -hT

    mount |grep nfs

Ideal realizar a montagem manual antes de colocar no fstab!

> Deixando a configuração persistente.

Editando o arquivo fstab, ex.:

    vim /etc/fstab

        192.168.10.2:/nfs3/        /nfs_publico/        nfs        rw,sync        0 0        

        :wq

    systemctl daemon-reload

    mount -a

    systemctl reboot

> Editando o arquivo de configuração.

Arquivo de configuração:

    /etc/nfs.conf

Pode editá-lo utilizando o utilitário:

    nfsconf 

Algumas configurações:

    nfsconf --set nfsd vers2 n

    nfsconf --set nfsd vers3 n

    nfsconf --set nfsd vers4 y

    nfsconf --set nfsd vers4.0 y

    nfsconf --set nfsd vers4.1 y

    nfsconf --set nfsd vers4.2 y

    nfsconf --set nfsd udp n    

    nfsconf --set nfsd tcp y    