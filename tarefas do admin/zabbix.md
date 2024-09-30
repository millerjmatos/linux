O Zabbix é uma plataforma de monitoramento de rede de código aberto que permite monitorar o desempenho e a disponibilidade de redes, servidores, aplicativos e serviços em tempo real. Ele usa uma abordagem centralizada para coletar dados de diferentes dispositivos em uma rede, permitindo que os administradores visualizem e analisem informações sobre o desempenho da rede em um único painel. O Zabbix oferece uma ampla gama de recursos, incluindo monitoramento de rede, coleta de dados, alertas e relatórios personalizados.

### Em Rocky Linux 9

Definindo um FQDN (Fully Qualified Domain Name) para o servidor de monitoramento:

    hostnamectl set-hostname srv-zabbix.intra

Atualizando o sistema:

    dnf makecache --refresh && dnf update -y

ATENÇÃO: se no procedimento acima ocorrer atualização de Kernel, você deverá reiniciar o sistema com a versão mais atual!

    cat /etc/redhat-release
    Rocky Linux release 9.1 (Blue Onyx)

    uname -r
    5.14.0-162.18.1.el9_1.x86_64

Instalando o banco de dados:

    dnf install -y mariadb-server mariadb

    systemctl start mariadb && systemctl enable mariadb

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

Acessando o banco mariaDB para criar a base de dados que será usada pelo zabbix:

    mysql -u root -p

        create database zabbixdb character set utf8mb4 collate utf8mb4_bin;

        create user zabbixuser@localhost identified by 'P@ssword';

        grant all privileges on zabbixdb.* to zabbixuser@localhost;

        flush privileges;

        quit;

Importando o esquema de banco de dados do zabbix no mysql com suporte a caracteres unicode:

    zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -u zabbixuser -p zabbixdb

Editando o arquivo de configuração do zabbix:

    vim /etc/zabbix/zabbix_server.conf

        DBPassword=P@ssword

        DBName=zabbixdb

        DBUser=zabbixuser

Editando o arquivo de configuração do PHP:

    vim /etc/php.ini

        post_max_size = 16M

        max_execution_time 300

        max_input_time = 300

        date.timezone = America/Sao_Paulo

        :x

Consulte o seu timezone ideal em: https://www.php.net/manual/en/timezones.php

Reiniciando o Apache daemon para refletir as alterações:

    systemctl restart httpd.service

Ativando os serviços:

    systemctl enable --now zabbix-server zabbix-agent httpd php-fpm

Liberação no firewall:

    firewall-cmd --permanent --add-service=http

    firewall-cmd --reload

Acessando a console, ex.:

    http://server_ip/zabbix

Na console: 

    Configure DB connection

        Database host: localhost

        Database port: 0 (default)

        Database name: zabbixdb

        User: zabbixuser

        Password: P@ssword

Credencial padrão:

    Admin
    zabbix

---

#!/bin/bash

# Definir FQDN para o servidor de monitoramento
sudo hostnamectl set-hostname srv-zabbix.intra

# Atualizar o sistema
sudo dnf makecache --refresh && sudo dnf update -y

# Verificar a versão do sistema e do Kernel
echo "Sistema Operacional:"
cat /etc/redhat-release
echo "Kernel Atual:"
uname -r

# Verificar se houve atualização do Kernel e informar para reiniciar o sistema se necessário
new_kernel=$(sudo dnf list kernel --showduplicates | grep installed | awk '{print $2}' | tail -1)
current_kernel=$(uname -r)
if [[ "$new_kernel" != "$current_kernel" ]]; then
    echo "ATENÇÃO: O Kernel foi atualizado. Por favor, reinicie o sistema para usar a versão mais recente!"
fi

# Instalar MariaDB
sudo dnf install -y mariadb-server mariadb

# Iniciar e habilitar MariaDB
sudo systemctl start mariadb && sudo systemctl enable mariadb

# Configurar a senha do root no MariaDB
sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY 'P@ssword';
FLUSH PRIVILEGES;
EOF

# Configurar a segurança do MariaDB automaticamente
sudo mariadb-secure-installation <<SECURE_EOF

y
P@ssword
P@ssword
y
y
y
y
SECURE_EOF

# Verificar versão do MariaDB
sudo mysql -u root -p'P@ssword' -e "SELECT VERSION();"

# Instalar o repositório Zabbix 6.0 LTS
sudo rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/9/x86_64/zabbix-release-6.0-4.el9.noarch.rpm
sudo dnf clean all

# Construir cache dos novos repositórios
sudo dnf makecache

# Instalar Zabbix e pacotes relacionados
sudo dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-selinux-policy zabbix-agent

# Configurar o banco de dados do Zabbix
sudo mysql -u root -p'P@ssword' <<MYSQL_SCRIPT
CREATE DATABASE zabbixdb CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER 'zabbixuser'@'localhost' IDENTIFIED BY 'P@ssword';
GRANT ALL PRIVILEGES ON zabbixdb.* TO 'zabbixuser'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

# Importar esquema de banco de dados Zabbix
sudo zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | sudo mysql --default-character-set=utf8mb4 -u zabbixuser -p'P@ssword' zabbixdb

# Configurar arquivo do Zabbix
sudo sed -i 's/# DBPassword=/DBPassword=P@ssword/' /etc/zabbix/zabbix_server.conf
sudo sed -i 's/# DBName=/DBName=zabbixdb/' /etc/zabbix/zabbix_server.conf
sudo sed -i 's/# DBUser=/DBUser=zabbixuser/' /etc/zabbix/zabbix_server.conf

# Configurar arquivo php.ini
sudo sed -i 's/post_max_size =.*/post_max_size = 16M/' /etc/php.ini
sudo sed -i 's/max_execution_time =.*/max_execution_time = 300/' /etc/php.ini
sudo sed -i 's/max_input_time =.*/max_input_time = 300/' /etc/php.ini
sudo sed -i 's/;date.timezone =/date.timezone = America\/Sao_Paulo/' /etc/php.ini

# Reiniciar Apache para aplicar mudanças no PHP
sudo systemctl restart zabbix-server zabbix-agent httpd php-fpm

# Ativar e iniciar serviços Zabbix, Apache e PHP-FPM
sudo systemctl enable --now zabbix-server zabbix-agent httpd php-fpm

# Configurar firewall para permitir acesso HTTP
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

echo "Instalação do Zabbix concluída com sucesso!"
