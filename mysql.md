### Em Linux Debian 11

MySQL Community Server 8.0.32
Site: https://dev.mysql.com/downloads/mysql/

    apt install wget

    wget https://repo.mysql.com/mysql-apt-config_0.8.24-1_all.deb -O mysql-apt-config.deb

    apt install lsb-release gnupg

    dpkg -i mysql-apt-config.deb

Se precisar selecionar uma versão específica e precisar alterar a configuração:

    dpkg-reconfigure mysql-apt-config

Instalando o MySQL:

    apt-get update

    apt-get upgrade

    apt-get install mysql-server mysql-client

    systemctl status mysql

    systemctl start mysql

    systemctl enable mysql

Verificando a versão:

-> Server:

    mysqld --version

-> Client:

    mysql --version

Acessando o banco de dados:

    mysql -h localhost -u root -p

        show databases;

Para sair:

        CTRL + D

### Em CentOS 7

Instalando o MySQL:

    apt update && upgrade

    yum install -y mysql-server mysql-client

    service mysql status

Acessando o banco de dados:

    mysql -h localhost -u root -p

        show databases;

Para sair:

        CTRL + D