O ProFTPD é um servidor FTP de código aberto para sistemas operacionais Unix-like, como Linux e FreeBSD. Ele fornece um ambiente seguro e confiável para transferência de arquivos através de protocolos FTP, FTPS e SFTP. O ProFTPD é altamente configurável, permitindo que os sysadmins personalizem a autenticação, permissões de usuário, logins, mensagens de erro e outros aspectos do servidor.

ProFTPD é uma escolha para ambientes mais complexos e requer configurações avançadas já o vsftpd é uma boa escolha para ambientes menos complexos.

### Em Linux Debian 11

Instalando o servidor FTP:

    apt-get install proftpd

Iniciando o serviço:

    systemctl status proftpd

    systemctl start proftpd

    systemctl enable proftpd

Usuário para administração do FTP:

    useradd webmaster -m -d /var/www/html/ -s /bin/false

    passwd webmaster

    chown webmaster -R /var/www/html/

Alterando o arquivo de configuração:

    cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.bkp

    vim proftpd.conf

        :set number

        Linha 11: UseIPv6 off

        Linha 17: ServerName "webserver"

        Linha 39: DefaultRoot ~

        Linha 43: RequireValidShell off

        :wq

Após alterações, reiniciar o serviço:

    systemctl restart proftpd