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

    mkdir -p /nfs

    








