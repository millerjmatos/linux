### Em CentOS 7

Instalando o banco de dados:

    yum install mariadb-server

    systemctl status mariadb

    systemctl start mariadb

    systemctl enable mariadb

    mysql_secure_installation

Defina a senha do *root do banco de dados*.

Remover o acesso de usuários anônimos? sim.

Permitir que o usuário *root do banco de dados* acesse remotamente? sim.

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

        grant all privileges on wordpress.*to 'admin'@'localhost';

        flush privileges;

Para sair:

        CTRL + D
    



