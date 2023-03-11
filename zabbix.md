O Zabbix é uma plataforma de monitoramento de rede de código aberto que permite monitorar o desempenho e a disponibilidade de redes, servidores, aplicativos e serviços em tempo real. Ele usa uma abordagem centralizada para coletar dados de diferentes dispositivos em uma rede, permitindo que os administradores visualizem e analisem informações sobre o desempenho da rede em um único painel. O Zabbix oferece uma ampla gama de recursos, incluindo monitoramento de rede, coleta de dados, alertas e relatórios personalizados.

### Em Rocky Linux 9

    cat /etc/redhat-release
    Rocky Linux release 9.1 (Blue Onyx)

    uname -r
    5.14.0-162.18.1.el9_1.x86_64

Definindo um FQDN (Fully Qualified Domain Name) para o servidor de monitoramento:

    hostnamectl set-hostname srv-zabbix.intra

Atualizando o sistema:

    dnf makecache --refresh

    dnf update -y

Se no procedimento acima ocorrer atualização de Kernel, você deverá reiniciar o sistema!

Instalando o banco de dados:

    dnf install -y mariadb-server mariadb

    systemctl start mariadb
    
    systemctl enable mariadb

    mariadb-secure-installation

Alternar para autenticação unix_socket: Não

Defina a senha do root do banco de dados: Sim

Remover o acesso de usuários anônimos? Sim

Permitir que o usuário root do banco de dados acesse remotamente? Sim

Remover o banco de dados teste? Sim

Recarregar o sistema e aplicar as alterações de segurança? Sim

    mysql -V
    mysql  Ver 15.1 Distrib 10.5.16-MariaDB, for Linux (x86_64) using  EditLine wrapper

Instalando o zabbix:

Atualmente a versão mais recente é a 6.2, mas vamos utilizar a versão 6.0 LTS!
Site: https://www.zabbix.com/download

Instalando o repositório oficial zabbix:

    rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/9/x86_64/zabbix-release-6.0-4.el9.noarch.rpm

Construindo o cache com os novos repositórios:

    dnf makecache

Instalando o zabbix e os pacotes relacionados:

    dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-selinux-policy zabbix-agent

Acessando o banco mariaDB para criar a base de dados usada pelo zabbix:

    mysql -u root -p

        create database zabbixdb character set utf8mb4 collate utf8mb4_bin;

        create user zabbixuser@localhost identified by 'P@ssword';

        grant all privileges on zabbixdb.* to zabbixuser@localhost;

        flush privileges;

        quit;

Script para criar os objetos em seu armazenamento back-end, descompacta e encaminha a saída para a execução:

    zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -u zabbixuser -p zabbixdb

Editando o arquivo de configuração:

    vim /etc/zabbix/zabbix_server.conf

        DBPassword=P@ssword

Ativando os serviços:

    systemctl enable --now zabbix-server zabbix-agent httpd php-fpm

Liberação no firewall:

    firewall-cmd --permanent --add-service=http

    firewall-cmd --reload

Acessando a console, ex.:

    http://SERVER_IP/zabbix

Selecione o idioma; configure o banco; defina um nome.

A credêncial padrão é:

    Admin
    zabbix