### Em CentOS 7

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