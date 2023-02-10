Podman é uma ferramenta de linha de comando para gerenciar containers no Linux, sem a necessidade de um daemon. Ele permite criar, gerenciar e executar containers de forma segura e confiável. Com Podman, é possível trabalhar com containers de forma semelhante a trabalhar com imagens podman, mas sem a necessidade de um daemon ou um servidor de gerenciamento de containers. Podman suporta a maioria das funcionalidades do podman, incluindo imagens, contêineres, volumes, rede, etc.

Realizando o login para utilizar as imagens do registry:

    podman login registry.redhat.io

Imprimindo contêineres ativos no sistema:

	podman ps

Imprimindo todos os contêineres do sistema:

    podman ps -a

Pesquisando por um conteiner:

    podman search ubuntu

Iniciando uma imagem como um container:

	podman run -it -d docker.io/library/ubuntu:latest

Opção -d: inicia em segundo plano.

Acessando o conteiner:

    podman run -it docker.io/library/ubuntu:latest /bin/bash

        exit

Removendo, parando e inciando um conteiner:

    podman <rm stop start> <CONTAINER ID>

    podman rm -f <CONTAINER ID>

    podman ps

    podman ps -a

Removendo uma imagem do sistema:

	podman images

	podman rmi <IMAGE ID>

Baixando uma imagem:

    podman pull <IMAGE>