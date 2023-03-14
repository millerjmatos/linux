O Docker é uma plataforma de virtualização de contêineres que permite aos desenvolvedores empacotar, distribuir e executar aplicativos em ambientes isolados e portáteis. O Docker fornece uma maneira de empacotar um aplicativo e todas as suas dependências em um único objeto, chamado de contêiner, que pode ser facilmente transferido e executado em diferentes sistemas operacionais e infraestruturas. O uso de contêineres Docker torna o desenvolvimento, implantação e escalabilidade de aplicativos bem mais eficiente.

### Em Debian 11

    cat /etc/os-release
    PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
    NAME="Debian GNU/Linux"
    VERSION_ID="11"
    VERSION="11 (bullseye)"
    VERSION_CODENAME=bullseye
    ID=debian

    uname -r
    5.10.0-21-amd64

Realize todo o procedimento como root!

Atualize o sistema:

    apt-get update && apt-get upgrade -y

Instalando os pacotes necessários para permitir que o apt use um repositório HTTPS:

    apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y

Adicione a chave GPG oficial do docker ao sistema:

    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

Adicionando o repositório do docker ao sources.list.d:

    echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list

Atualizando o repositório:

    apt-get update

Instalando:

    apt-get install docker-ce docker-ce-cli containerd.io -y

Verificando o serviço:

    systemctl status docker

O Docker Compose não é necessário para executar contêineres do docker, mas é uma ferramenta útil para simplificar a orquestração de contêineres em ambientes de desenvolvimento e produção. Isso é útil para aplicativos que exigem vários contêineres trabalhando juntos, como aplicativos web que exigem um contêiner para o servidor web, um contêiner para o banco de dados e um contêiner para o serviço de cache.

Verifique a versão mais recente do docker compose disponível em https://github.com/docker/compose/releases e substitua a versão na URL:

    curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose

    chmod +x /usr/local/bin/docker-compose

    docker-compose --version