Em sistemas Linux, um "issue" é um arquivo que contém informações de identificação do sistema operacional, geralmente exibido na tela de login. O arquivo "issue" também pode ser usado para exibir uma mensagem personalizada para os usuários antes de efetuar login no sistema. Isso pode ser útil para exibir informações importantes ou para fornecer instruções para os usuários antes de acessarem o sistema.

Já o arquivo MOTD (Message of the Day) é um arquivo de texto que contém uma mensagem que é exibida aos usuários quando eles fazem login no sistema.

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