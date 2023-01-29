Instalando o banco de dados no CentOS 7
Kernel 3.10.0-1160.el7.x86_64

Instalando o servidor HTTP:

    yum install -y httpd

    systemctl status httpd

    systemctl start httpd

    systemctl enable httpd

    cd /var/www/ && ls

    firewall-cmd --permanent --list-all

    firewall-cmd --add-service=http --permanent
 
    systemctl restart firewalld

Criando a estrutura de pastas:

    cd /var/www/html/

    mkdir -p /var/www/html/mullertec/public_html

Usuário para administração do FTP:

    useradd -M webmaster

    passwd webmaster

    usermod -d /var/www/html/ webmaster

    chown webmaster -R /var/www/html/

Configurando IP fixo no servidor:

    nmtui

        Editar uma conexão > Editar

            CONFIGURAÇÃO IPv4: Manual
        
            Endereços: 192.168.0.10/24

            Gateway: 192.168.0.1

            Servidores DNS: 192.168.0.1
                            208.67.222.222

            CONFIGURAÇÃO IPv6: Ignorar

            OK > Voltar

        Cancelar

    reboot
    
    apt install wget

    wget https://repo.mysql.com/mysql-apt-config_0.8.24-1_all.deb -O mysql-apt-config.deb

    apt install lsb-release gnupg

    dpkg -i mysql-apt-config.deb

Se precisar selecionar uma versão específica e precisar alterar a configuração:

    dpkg-reconfigure mysql-apt-config

Instalando o MySQL:

    apt update && upgrade

    yum install -y mysql-server mysql-client

    service mysql status

Acessando o banco de dados:

    mysql -h localhost -u root -p

        show databases;

Para sair:

        CTRL + D

Instalando o PHP:

    yum install -y php

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

    yum install -y phpmyadmin

        [*] httpd

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