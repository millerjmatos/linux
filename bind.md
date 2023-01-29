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


