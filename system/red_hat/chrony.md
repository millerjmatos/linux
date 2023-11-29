Chrony é um software de sincronização de tempo para sistemas Linux e Unix que pode ser usado para manter o relógio do sistema preciso através da sincronização com servidores NTP. Ele oferece uma precisão de tempo melhor que outros programas NTP e é capaz de sincronizar rapidamente com servidores NTP, mesmo em redes com alta latência ou variação de tempo. O Chrony também pode ser usado como um servidor NTP para sincronizar outros dispositivos na rede.

Verifique se o chrony está instalado:

    rpm -qa |grep chrony

    yum install chrony

Edite o arquivo de configuração:

    vim /etc/chrony.conf

Para permitir consultas internas:

        Allow NTP client access from local network.
        allow 10.0.0.0/24

        :wq

    systemctl restart chronyd

    systemctl status chronyd

Opcional, servidores do Brasil:

    vim /etc/chrony.conf

        # Use public servers from the pool.ntp.org project.
        # Please consider joining the pool (https://www.pool.ntp.org/join.html).
        server a.st1.ntp.br iburst nts
        server b.st1.ntp.br iburst nts
        server c.st1.ntp.br iburst nts
        server d.st1.ntp.br iburst nts
        server gps.ntp.br iburst nts

        :wq 

Liberando o firewalld:

    firewall-cmd --add-service=ntp --permanent

    firewall-cmd --reload

Verificando o funcionamento:

    chronyc -N authdata

    chronyc sources

    chronyc tracking