WordPress é um sistema de gerenciamento de conteúdo (CMS) baseado em PHP e MySQL, utilizado para criar e gerenciar websites e blogs. É open-source, o que significa que é de código aberto e pode ser baixado e modificado gratuitamente. Com uma ampla gama de temas e plugins disponíveis, o WordPress é altamente personalizável e pode ser usado para criar uma variedade de sites, desde blogs pessoais até sites corporativos e e-commerces.

### Em Linux Debian 11

Instale previamente o banco de dados de sua preferência, no caso o MySQL Server.

Entrando no MySQL:

    mysql -h localhost -u root -p

        show databases;

Crie um banco de dados chamado 'wordpress':

        create database wordpress;

        show databases;

        CTRL + D

Instalando o WordPress:

Baixe a versão mais recente em pt-br: https://br.wordpress.com/

    cd /var/www/html/

    wget http://br.wordpress.org/latest-pt_BR.tar.gz

    tar xvzf wordpress.tar.gz

    chmod -R 777 wordpress

Abrir no navegador IP/wordpress

Após as configurações pela interface web o serviço já está pronto.

Para acessar o painel de configuração no navegador é: IP/wordpress/wp-admin

Um ajuste:

    cd /var/www/html/wordpress/

    vim wp-config.php

Inserir a linha:

    define ( 'FS_METHOD', 'direct' );

    :wq