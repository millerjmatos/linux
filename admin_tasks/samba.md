O Samba é um software livre que permite compartilhar arquivos e impressoras entre sistemas operacionais Linux e Windows em uma rede. Ele implementa o protocolo SMB/CIFS (Server Message Block / Common Internet File System), que é usado pelo Windows para compartilhar arquivos e recursos em redes locais.

O Samba pode ser usado em um servidor Linux para compartilhar arquivos com computadores Windows em uma rede, permitindo que os usuários acessem e modifiquem arquivos em um ambiente Windows usando as mesmas ferramentas e interfaces que usariam em um ambiente Windows.

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
        create mask = 0777    
        directory mask = 0777    
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