Podman é uma ferramenta de linha de comando para gerenciar containers no Linux, sem a necessidade de um daemon. Ele permite criar, gerenciar e executar containers de forma segura e confiável. Com Podman, é possível trabalhar com containers de forma semelhante a trabalhar com imagens podman, mas sem a necessidade de um daemon ou um servidor de gerenciamento de containers. Podman suporta a maioria das funcionalidades do podman, incluindo imagens, contêineres, volumes, rede, etc.

Realizando o login para utilizar as imagens do registry:

    podman login registry.redhat.io

Imprimindo contêineres ativos no sistema:

	podman ps

    podman container ls

Imprimindo todos os contêineres do sistema:

    podman ps -a

Pesquisando por um container:

    podman search ubuntu

Iniciando uma imagem como um container:

	podman run -it -d docker.io/library/ubuntu:latest

Opção -d: inicia em segundo plano.

Acessando o container:

    podman run -it docker.io/library/ubuntu:latest /bin/bash

    podman exec -it <NAMES CONTAINER ID > bash  

        exit

Removendo, parando e inciando um container:

    podman <rm stop start> <CONTAINER ID>

    podman rm -f <CONTAINER ID>

    podman rm -f $(podman ps -qa)

    podman ps

    podman ps -a

Baixando uma imagem:

    podman pull <IMAGE>

Removendo uma imagem do sistema:

	podman images

	podman rmi <IMAGE ID>

Redirecionando portas:

    podman run -it -d nginx

    podman ps

    podman run -it -d -p6001:80 --name my-nginx <IMAGE>

Executando um comando sem acessar o container:

    podman exec -it my-nginx cat /etc/passwd

    podman exec -it <CONTAINER ID> find / -name nginx

Mapeando um volume:

    podman run -it -d nginx

    podman run -it -d -p8003:80 -v /root/site/:/usr/share/nginx/html/ --name map-nginx nginx

