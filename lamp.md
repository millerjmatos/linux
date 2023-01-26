Instalando o banco de dados (no Debian 11):

    apt install wget

    wget https://repo.mysql.com/mysql-apt-config_0.8.24-1_all.deb -O mysql-apt-config.deb

    apt install lsb-release gnupg

    dpkg -i mysql-apt-config.deb

Se precisar selecionar uma versão específica e precisar alterar a configuração:

    dpkg-reconfigure mysql-apt-config

Instalando o MySQL:

    apt update && upgrade

    apt-get install mysql-server mysql-client

    service mysql status

Acessando o banco de dados:

    mysql -h localhost -u root -p

        show databases;

Para sair:

        CTRL + D

Instalando o servidor HTTP:

    apt-get install apache2

    service apache2 status

    cd /var/www/html/ && ls

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

Entrando no MySQL:

    mysql -h localhost -u root -p

        show databases;

Instalando o WordPress:

Primeiro crie um banco de dados chamado 'wordpress'.

Vamos baixar a versão mais recenete e em português em:

https://br.wordpress.com/

    cd /var/www/html/

    wget http://br.wordpress.org/latest-pt_BR.tar.gz

    tar xvzf wordpress.tar.gz

    chmod -R 777 wordpress

Abrir no navegador <IP>/wordpress

Após as configurações pela interface web o serviço já está pronto.

Para acessar o painel de configuração no navegador é: <IP>/wordpress/wp-admin

Um último ajuste:

    cd /var/www/html/wordpress/

    vim wp-config.php

Inserir a linha a seguir:

        define ( 'FS_METHOD', 'direct' );

        :wq