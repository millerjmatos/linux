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

Conexão com chave pública.

No cliente:

    vim /etc/ssh/ssh_config

        IdentityFile ~/.ssh/id_rsa
        IdentityFile ~/.ssh/id_dsa
        IdentityFile ~/.ssh/id_ecdsa

        :x

    systemctl restart ssh

    systemctl status ssh

No servidor:

    vim /etc/ssh/sshd_config

        PubkeyAuthentication yes

        AuthorizedKeysFile      .ssh/authorized_keys

        :x

    systemctl restart sshd

    systemctl status sshd
    
Criando o par de chaves no lado cliente:

    ssh-keygen

    ll /home/muller/.ssh

O arquivo .pub deve ser exportado para o servidor ssh de destino.

Exportando, ex.:

    ssh-copy-id muller@192.168.0.100

O utilitário irá criar o arquivo ~/.ssh/authorized_keys com a chave pública do cliente.

---

Conectar sem senha:

    ssh user@ip_or_host

Conectando em um servidor ssh:

	ssh muller@192.168.222.50

	ssh manager@10.0.30.5:22

	ssh user@172.16.1.80 -p 22443

	ssh user@srv-linux -p 22

Arquivo que contém os hosts conhecidos:

	ls -la /home/user/.ssh/

	cat known_hosts

O SSH usa dois arquivos de configuração principais, ssh_config e sshd_config. O arquivo ssh_config é o arquivo de configuração do cliente SSH. O arquivo sshd_config é o arquivo de configuração do servidor SSH.