OpenMediaVault é um sistema operacional de rede baseado em Linux que fornece um ambiente de servidor de armazenamento de rede. Ele é projetado para gerenciar o armazenamento de dados, compartilhamento de arquivos, backup de dados e outras funções relacionadas à rede em um ambiente de servidor. Ele é frequentemente usado em sistemas domésticos ou pequenas empresas para gerenciar o armazenamento e compartilhamento de arquivos em uma rede local. O sistema é altamente configurável e oferece suporte a vários protocolos de rede, como CIFS, NFS, FTP e SFTP. 

Site oficial: https://www.openmediavault.org/

    Requisitos do exemplo: 1 disco SSD (system) e 2 discos HD (storage).

    O processo de instalação é semelhante ao do Debian.
    
    Você precisará de, no mínimo, 3 discos, pois uma unidade será usada para a instalação e as outras duas serão usadas para armazenar os arquivos.

    É importante observar que a senha do root não é a mesma usada para o acesso da console. Essa senha é usada para acessar o terminal do seu servidor OMV.

    Após reiniciar o servidor, você poderá visualizar algumas informações, como o endereço IP da console.

Credencial padrão:

    admin
    openmediavault

Configuração básica, criando a unidade de armazenamento:

    Storage > Software RAID > Create

    Level: Mirror

    Devices: Selecione os dispositivos que serão usados ​​para criar o dispositivo RAID.

    Save > Apply

Caso esteja com 3 discos disponíveis você pode selecionar a opção RAID5, com 4 ou mais discos pode usar a opção RAID6. Leitura: https://www.datastorage.com.br/post/tudo-sobre-raid

Unidade de armazenamento criada, devemos configurar o file system, selecione a unidade RAID criada anteriormente:

    Storage > File System > + Create and mount a file system.

    Type: EXT4

    Device: Software RAID omv:0 [/dev/md0, raidX, 99,93 GiB]
    
    Save > Apply

    Storage > File System > Mount an existing file system.

    File system: /dev/md0 [EXT4, /dev/md0]

    Save > Apply

Habilitando o servidor samba:

    Services > SMB/CIFS > Settings

    Enabled: OK
    
    Save > Apply

Criando diretório:

    Storage > Shared Folders > Create

    Name: Shared_Linux

    File system: /dev/md0 [EXT4, 40,00 KiB (1%) used, 99,93 GiB available]

    Relative path: Shared_Linux/

    Permissions: Administrator: read/write, Users: read/write, Others: read-only (default)

    Save > Apply

Compartilhando:

Preencha as informações indicando a pasta que foi criada anteriormente e algumas configurações.

    Services > SMB/CIFS > Shares > Create

    Enabled: OK

    Shared folder: [on /dev/mdo, Shared_Linux/]

    Save > Apply

O controle de acesso é feito em:

    Storage > Shared Folders > ACL