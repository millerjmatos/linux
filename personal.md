Editando o arquivo issue:

    cd /etc/

    ls issue*

    cp issue issue.bkp

    apt-get install linuxlogo

    ls issue*

    cat issue.linuxlogo > issue

    reboot

Editando o arquivo motd:

Mensagem exibida após o login.

    cd /etc/

    ls motd*

    cp motd motd.bkp

    vim motd

        Olá, seja bem vindo!

    :wq

Identificando e selecionando os serviços que carregam na inicialização:

    apt-get install rcconf

    rcconf