Instalando o ftp:

    apt-get install proftpd

    service proftpd status

    cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.bkp

Alterando o arquivo de configuração:

    vim proftpd.conf

    :set number

Linha 11:

    off

Linha 17:

    "webserver"

Linha 39:

    DefaultRoot ~

Linha 43:

    RequireValidShell   off

    :wq

Após alterações, reiniciar o serviço:

    service proftpd restart

Usuário para administração do FTP:

    useradd webmaster -d /var/www/html/ -s /bin/false

    passwd webmaster

    chown webmaster -R /var/www/html/