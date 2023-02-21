O SSH (Secure Shell) é um protocolo de rede criptografado usado para conexões seguras em uma rede não confiável, como a Internet. 

O OpenSSH é um software de código aberto que implementa o protocolo SSH. Ele é usado principalmente em sistemas Unix-like, como Linux e macOS, para fornecer acesso remoto seguro ao shell e transferência de arquivos segura (SFTP) entre computadores.

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