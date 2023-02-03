### Em Linux Debian 11

Instalando o PHP:

    apt-get install php

    php -v

Testando e verificando as informações:

    cd /var/www/html/

    touch info.php

    vim info.php

        <?php
        phpinfo();
        ?>

        :wq

Abrir no navegador <IP>/info.php

Instalando phpMyAdmin:

    apt-get install phpmyadmin

        [*] apache2

Abrir no navegador <IP>/phpmyadmin

### Em Linux CentOS 7

Instalando os repositórios:

    rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

Instalando o PHP:

    yum install php70w

    systemctl restart hhtpd

    php -v

O PHP automaticamente se integra com o serviço do apache!

Testando e verificando as informações:

    cd /var/www/html/

    vim info.php

        <?php
        phpinfo();
        ?>

        :wq

Abrir no navegador <IP>/info.php

Integrando o PHP ao mysql:

    yum install php70w-mysql

Instalando phpMyAdmin:

    yum install epel-release

    yum update

    yum install phpmyadmin

Configurando o httpd:

    cd /etc/httpd/conf.d

    cp phpMyAdmin.conf phpMyAdmin.conf.bkp

    vim phpMyAdmin.conf

        :set number

Linha 17:

    Require ip 127.0.0.1 192.168.0.10/24

Linha 25:

    Allow from 127.0.0.1 192.168.0.10/24

        :wq

    systemctl restart httpd

Abrir no navegador <IP>/phpmyadmin