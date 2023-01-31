### Em CentOS 7

Instalando o ftp no CentOS:

    dnf install vsftpd

    systemctl status vsftpd

    systemctl start vsftpd

    systemctl enable vsftpd

Configurando o vsftpd:

    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.bkp

    vim vsftpd.conf

        :set number

        Linha 12: anonymous_enable=NO

        Linha 60: idle_session_timeout=600

        Linha 101: chroot_local_user=YES

        Linha 115: listen=YES

        Linha 124: listen_ipv6=NO

        Linha 129: allow_writeable_chroot=YES

        :wq

Liberando o vsftpd no firewalld:

    firewall-cmd --add-service=ftp --permanent

    firewall-cmd --reload

Após alterações, reiniciar o serviço:

    systemctl restart vsftpd

Imprimindo se o SELinux (Security-Enhanced Linux) está ativado ou desativado:

    sestatus

Imprimindo os booleans disponíveis e seus estados atuais:

    dnf install policycoreutils-python

    semanage boolean -l

Criando a regra de liberação no SELinux:

    setsebool -P ftpd_full_access on