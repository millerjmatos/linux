##### Em Linux Debian 11

Instalando o PHP:

    apt-get install php

    php -v

Testando e verificando as informações:

    cd /var/www/html/

    touch info.php

    vim info.php

        <?php
        info.php();
        ?>

salvar e sair.

Abrir no navegador <IP>/info.php

Instalando phpMyAdmin:

    apt-get install phpmyadmin

        [*] apache2

Abrir no navegador <IP>/php.myadmin