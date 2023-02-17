### Em Linux Debian 11

Instalando o serviço:

    apt-get install openssh-server

    ssh -V

Perminto acesso via usuário root:

    cd /etc/ssh/

    cp sshd_config ssh_config.bkp

    vim /etc/ssh/sshd_config

        :set number

Linha 34:

        PermitRootLogin yes

        :wq

Reiniciando o serviço:

    systemctl restart sshd

Ativando o serviço na inicialização:

    systemctl enable sshd

    systemctl status sshd