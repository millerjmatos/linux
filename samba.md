### Em Linux Debian 11

Instalando o samba:

    apt-get install samba

Arquivo de configuração:

    /etc/samba/smb.conf

Configuração básica:

    cp smb.conf smb.conf.bkp

    rm smb.conf

Editando:

    vim smb.conf

        [global]
        browseable = yes 
        create mask = 2770    
        directory mask = 2770   
        encrypt passwords = yes 
        log file = /var/log/samba/samba-log-%m  
        max log size = 500  
        preserve case = yes 
        public = no 
        security = user 
        server string = servidor de arquivos    
        username level = 0  
        workgroup = workgroup   

        [homes]
        browseable = no		
        comment = meus dados    
        path = /home/%U 
        valid users = %S
        writable = yes  

        [publica]
        browseable = yes       
        comment = livre acesso  
        path = /home/publica    
        writable = yes  

        [java]
        browseable = yes	
        comment = dados da equipe java
        path = /home/java	
        valid users = @muller %S    
        writable = yes

        :wq

A seção [publica] está em um diretório que precisa ser criado e com permissão total:

    chmod ugo=rwx /home/publica

A seção [java] é um diretório visível por usuários autenticados, e também acessível ao usuário muller.

Reiniciando o serviço:

    systemctl restart smbd

    systemctl status smbd

Crie os usuários do banco de dados samba com o comando:

    smbpasswd -a <USER>

Verifique os usuários criados no samba do sistema:

    pdbedit -L