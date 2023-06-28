Podman é uma ferramenta de linha de comando para gerenciar containers no Linux, sem a necessidade de um daemon. Ele permite criar, gerenciar e executar containers de forma segura e confiável. Com Podman, é possível trabalhar com containers de forma semelhante a trabalhar com imagens podman, mas sem a necessidade de um daemon ou um servidor de gerenciamento de containers. Podman suporta a maioria das funcionalidades do podman, incluindo imagens, contêineres, volumes, rede, etc.

Realizando o login para utilizar as imagens do registry:

    podman login registry.redhat.io

Pesquisando imagens por nome:

	podman search httpd

Criando um container e executando:

	podman run centos

Criando e executando um comando em modo interativo:

	podman run -it centos /bin/bash

Criando um container e executando em background (detached):

	podman run -d dockersamples/static-site

Criando um container em background e mapeando todas as portas:

	podman run -d -P dockersamples/static-site

Criando um container em background e mapeando portas específicas:

	podman run -d -p 6000:80 dockersamples/static-site --name container_name

Imprimindo as portas mapeadas do container:

	podman port nginx

Imprimindo os containers ativos:

	podman ps

    podman container ls

Imprimindo todos os containers:

	podman ps -a

Parando um container:

	podman stop nginx

Parando um container imediatamente:

	podman stop -t=0 nginx

Iniciando:

	podman start nginx

Executando um comando com o container:

	podman exec -it nginx /bin/bash

	exit

Menos agressivo que o stop:

	podman <pause unpause> nginx

Removendo o container:

	podman rm nginx

Removendo o container em execução:

	podman rm nginx --force

Imprimindo as imagens locais:

	podman images

Imprimindo informações de uma imagem:

	podman <inspect history> nginx

Removendo uma imagem:

	podman rmi nginx

Removendo vários containers:

	podman container rm $(podman container ls -aq)

Removendo várias imagens:

	podman rmi $(podman image ls -aq)