OpenMediaVault é um sistema operacional de rede baseado em Linux que fornece um ambiente de servidor de armazenamento de rede. Ele é projetado para gerenciar o armazenamento de dados, compartilhamento de arquivos, backup de dados e outras funções relacionadas à rede em um ambiente de servidor. Ele é frequentemente usado em sistemas domésticos ou pequenas empresas para gerenciar o armazenamento e compartilhamento de arquivos em uma rede local. O sistema é altamente configurável e oferece suporte a vários protocolos de rede, como CIFS, NFS, FTP e SFTP. 

Site oficial: https://www.openmediavault.org/

    Requisitos do exemplo: 1 disco SSD (system) e 2 discos HD (storage).

    O processo de instalação é semelhante ao do Debian.

    É importante observar que a senha do root não é a mesma usada para o acesso da console. Essa senha é usada para acessar o terminal do seu servidor OMV.

    Você precisará de, no mínimo, 3 discos, pois uma unidade será usada para a instalação e as outras duas serão usadas para armazenar os arquivos.

    Após reiniciar o servidor, você poderá visualizar algumas informações, como o endereço IP da console.

Credencial padrão:

    admin
    openmediavault

Configuração básica..

Selecionar as unidades de disco para criar 1 (uma) unidade de armazenamento:

    Storage > Software RAID > Create

    Apply

Nomeando e selecionando o nível:

    Mirror > Create

Caso esteja com 3 discos disponíveis você pode selecionar a opção RAID5, com 4 ou mais discos pode usar a opção RAID6. Leitura: https://www.datastorage.com.br/post/tudo-sobre-raid

Unidade de armazenamento criada, devemos configurar o file system, selecione a unidade RAID criada anteriormente:

    Storage > File system > Ok
    
    Mount > Apply

Habilitando o servidor samba:

    Services > SMB/CIFS

    Active: Enable

Criando diretório:

    Gestão de Direito de Acesso > Pastas Partilhadas > Add

    Keep > Apply

Compartilhando:

Preencha as informações indicando a pasta que foi criada anteriormente e determine os privilégios.

    Services > SMB/CIFS > Partilhas > Add

    Keep > Apply