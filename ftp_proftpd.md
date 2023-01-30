### Em Linux Debian 11

ProFTPD é uma escolha para ambientes mais complexos e requer configurações avançadas já o vsftpd é uma boa escolha para ambientes menos complexos.

Instalando o ftp:

    apt-get install proftpd

    systemctl status proftpd

    cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.bkp

Alterando o arquivo de configuração:

    vim proftpd.conf

    :set number

    Linha 11: UseIPv6 off

    Linha 17: ServerName "webserver"

    Linha 39: DefaultRoot ~

    Linha 43: RequireValidShell off

    :wq

Após alterações, reiniciar o serviço:

    systemctl restart proftpd

Usuário para administração do FTP:

    useradd webmaster -m -d /var/www/html/ -s /bin/false

    passwd webmaster

    chown webmaster -R /var/www/html/