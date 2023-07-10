O MariaDB é um sistema de gerenciamento de banco de dados de código aberto que é uma bifurcação (fork) do MySQL, criado por seus desenvolvedores originais após a sua aquisição pela Oracle. O MariaDB é altamente compatível com o MySQL. O MariaDB é usado por muitas empresas e organizações para armazenar e gerenciar dados, e é conhecido por sua escalabilidade, segurança e confiabilidade.

### Em CentOS 7

Instalando o banco de dados:

        yum install mariadb-server

        systemctl status mariadb

        systemctl start mariadb

        systemctl enable mariadb

        mysql_secure_installation

Defina a senha do root do banco de dados.

Remover o acesso de usuários anônimos? sim.

Permitir que o usuário root do banco de dados acesse remotamente? sim.

Remover o banco de dados teste? sim.

Recarregar o sistema e aplicar as alterações de segurança? sim.

Acessando o banco de dados:

        mysql -h localhost -u root -p

        show databases;

Crie um banco de dados chamado 'wordpress':

        create database wordpress;

        show databases;

Criando o usuário do banco de dados:

        use wordpress;

        create user 'admin'@'localhost' identified by 'P@ssword';

Amarrando o usuário ao banco de dados desejado, ex.:

        grant all privileges on wordpress.* to 'admin'@'localhost';

        flush privileges;

Para sair:

        CTRL + D

Configurando o mariadb para acesso de cliente remoto:

Fonte: https://mariadb.com/kb/en/configuring-mariadb-for-remote-client-access/

Edite o arquivo de configuração:

        /etc/my.cnf.d/server.cnf

                [mysqld]
                skip-networking=0
                skip-bind-address

                :x

Criando um usuário que tenha permissão para se conectar de algo diferente de 'localhost':

É comum criarem um usuário "admin" que possa se conectar de qualquer lugar da LAN..

        create user 'admin'@'172.22.22.%' identified by 'P@ssword';

        grant all privileges on *.* to 'admin'@'172.22.22.%';

Liberando no firewalld:

        firewall-cmd --add-service=mysql --permanent