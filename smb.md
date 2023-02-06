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

        :wq

Reiniciando o serviço:

    systemctl restart smbd

    systemctl status smbd