WordPress é um sistema de gerenciamento de conteúdo (CMS) baseado em PHP e MySQL, utilizado para criar e gerenciar websites e blogs. É open-source, o que significa que é de código aberto e pode ser baixado e modificado gratuitamente. Com uma ampla gama de temas e plugins disponíveis, o WordPress é altamente personalizável e pode ser usado para criar uma variedade de sites, desde blogs pessoais até sites corporativos e e-commerces.

##### Em Linux Debian 11

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