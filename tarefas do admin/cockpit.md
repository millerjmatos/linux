O Cockpit é uma ferramenta de gerenciamento de sistemas para a distribuição Red Hat Enterprise Linux (RHEL). Ele fornece uma interface web intuitiva para gerenciar vários aspectos do sistema, incluindo configurações de rede, serviços, containers, sistemas de arquivos e usuários.

O Cockpit é uma ferramenta poderosa e fácil de usar para gerenciar sistemas baseados em RHEL, tornando mais fácil e conveniente realizar tarefas de administração de sistemas.

Instalando no CentOS..

Atualização dos repositórios:

    dnf update

Instalação do cockpit:

    dnf -y install cockpit

Ativação do serviço:

    systemctl enable --now cockpit.socket

Liberação do firewall:

    firewall-cmd --add-service=cockpit --permanent

    firewall-cmd --reload

Após a instalação você pode acessar o console web através do IP ou hostname do seu servidor, utilizando a porta 9090.