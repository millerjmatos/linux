Firewalld é um firewall dinâmico para o sistema operacional Linux. Ele é projetado para substituir o firewall tradicional iptables e oferecer recursos adicionais, como regras de firewall baseadas em zones (zonas) e suporte para interfaces de rede dinâmicas. o Firewalld é padrão nos sistemas Red Hat, CentOS e Fedora.

Verificando se o firewalld está ativo:

    firewall-cmd --state

    systemctl status firewalld

    systemctl enable firewalld

Verificando as regras existentes:

    firewall-cmd --permanent --list-all

Removendo um serviço:

    firewall-cmd --remove-service=dhcpv6-client --permanent

    firewall-cmd --reload

Adicionando um serviço:

    firewall-cmd --add-service=<NOME DO SERVIÇO> --permanent

Listando todos os serviços disponíveis:

    firewall-cmd --get-services

Listando a zona padrão atual:

    firewall-cmd --get-default-zone