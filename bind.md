### Em CentOS 7

Instando o bind:

    yum install bind

Configurando o serviço:

    cd /var/named/ && ls

    cat mamed.ca

    cd /etc/ && ls /etc/named*

    cp named.conf named.conf.bkp

    vim named.conf

        :set number

        Linha 13: listen-on port 53 { 127.0.0.1; 192.168.0.20; };

        Linha 19: allow-query     { any; };

        :wq

    named-checkconf /etc/named.conf

    systemctl status named

    systemctl start named

    systemctl enable named

Liberando o serviço no firewall:

    firewall-cmd --permanent --list-all

    firewall-cmd --remove-service=dhcpv6-client --permanent

    firewall-cmd --add-service=dns --permanent

    firewall-cmd --reload

    nmtui

        Editar uma conexão > Editar

            CONFIGURAÇÃO IPv4: Manual
        
            Endereços: 192.168.0.20/24

            Gateway: 192.168.0.1

            Servidores DNS: 192.168.0.20
                            208.67.222.222

            CONFIGURAÇÃO IPv6: Ignorar

            OK > Voltar

        Cancelar

    reboot

    cat /etc/resolv.conf

    systemctl status named

Criando as zonas de dominio, ex.:

    vim /etc/named.conf

Linha 60:

    zone "mullertec.com.br" {
        type master;
        file "/var/named/db.mullertec.com.br";
    };

    :wq

Editando o arquivo db.:

    cd /var/named/ && ls && pwd

    vim db.mullertec.com.br

        $TTL                86400
        @                   IN SOA  ns1.mullertec.com.br. webmaster.mullertec.com.br. (
                            1       ; Serial
                            86400   ; Refresh
                            86400   ; Retry
                            86400   ; Expire
                            86400 ) ; Negative Cache TTL
        ;
        @                   IN NS       ns1.mullertec.com.br.
        ns1                 IN A        192.168.0.20
        webserver           IN A        192.168.0.10
        mullertec.com.br.   IN A        192.168.0.10
        www                 IN CNAME    webserver

    :wq

Conferindo:

    named-checkconf /etc/named.conf

    named-checkzone mullertec.com.br /var/named/db.mullertec.com.br
    
    systemctl restart named