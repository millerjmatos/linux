O Netplan é uma ferramenta de configuração de rede para sistemas operacionais baseados em Linux, especialmente aqueles que utilizam o systemd para gerenciamento de serviços. Ele foi introduzido como parte do Ubuntu 17.10 e substituiu as ferramentas tradicionais de configuração de rede, como o ifupdown.

O Netplan permite aos administradores de sistemas definir configurações de rede por meio de arquivos YAML, que são mais humanamente legíveis e mais fáceis de entender do que as configurações baseadas em texto plano convencionais.

#### Configurando IP estático

No diretório netplan, você encontrará um ou mais arquivos YAML com extensão **.yaml** (exemplo, 01-netcfg.yaml).

Dentro do arquivo, exemplo:

    network:
    version: 2
    renderer: networkd
    ethernets:
        eth0:
        addresses:
            - 192.168.1.10/24
        gateway4: 192.168.1.1
        nameservers:
            addresses: [208.67.222.222, 208.67.220.220]

Aplique:

    sudo netplan apply

    ip a

Certifique-se de que as configurações de rede sejam corretas para o seu ambiente e, se necessário, substitua eth0, os endereços IP e outros valores com os apropriados em sua configuração de rede.