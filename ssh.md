Instalando o serviço:

    apt-get install openssh-server

Perminto acesso via usuário root:

    cd /etc/ssh/

    cp sshd_config ssh_config.bkp

    vim /etc/ssh/sshd_config

        PermitRootLogin yes

    :wq

Reiniciando o serviço:

    service ssh restart

Ativando o serviço na inicialização:

    systemctl status ssh

    systemctl enable ssh

    systemctl status ssh