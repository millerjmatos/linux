O vsftpd é um software de servidor FTP (File Transfer Protocol) para sistemas Linux/Unix. Ele é amplamente utilizado para permitir a transferência de arquivos de um servidor para um cliente, seja na mesma rede ou na internet. O vsftpd é conhecido por sua segurança e estabilidade, e oferece recursos avançados, como criptografia SSL/TLS, e autenticação virtual de usuários.

ProFTPD é uma escolha para ambientes mais complexos e requer configurações avançadas já o vsftpd é uma boa escolha para ambientes menos complexos.

### Em Rocky Linux 9.2 
#### vsftpd: version 3.0.5

Instalando o ftp no CentOS:

    dnf install vsftpd -y

    vsftpd -version

Iniciando o serviço:

    systemctl status vsftpd

    systemctl start vsftpd

    systemctl enable vsftpd

Usuário para administração do FTP:

    useradd webadmin -M && usermod -d /var/www/html/ webadmin

    chown webadmin -R /var/www/html/

    passwd webadmin

Configurando o vsftpd:

    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.bkp

    vim vsftpd.conf

        :set number

        Linha 12: anonymous_enable=NO

        Linha 59: idle_session_timeout=600

        Linha 100: chroot_local_user=YES

        Linha 114: listen=YES

        Linha 123: listen_ipv6=NO

Incluir:

        Linha 129: allow_writeable_chroot=YES

        :wq

Após alterações, reiniciar o serviço:

    systemctl restart vsftpd

Liberando o vsftpd no firewalld:

    firewall-cmd --add-service=ftp --permanent

    firewall-cmd --reload
 
    firewall-cmd --permanent --list-all

Imprimindo se o SELinux (Security-Enhanced Linux) está ativado ou desativado:

    sestatus

Criando a regra de liberação no SELinux:

    setsebool -P ftpd_full_access on