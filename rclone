O rclone é uma ferramenta de linha de comando que permite gerenciar e sincronizar arquivos entre diferentes provedores de nuvem, como Google Drive, Dropbox, Amazon S3 e outros. Ele suporta várias operações comuns, como upload, download, cópia, exibição e edição de arquivos, bem como sincronização bidirecional entre fontes e destinos.

Download:

    wget https://downloads.rclone.org/v1.50.2/rclone-v1.50.2-linux-amd64.deb

    wget https://downloads.rclone.org/v1.57.0/rclone-v1.57.0-linux-amd64.deb

Configurando:

	rclone config

        n/r/c/s/q> n
        
        name> mullertec	
        
        Storage> 12
        
        client_id> "Enter"
        
        client_secret> "Enter"

        scope> 1
        
        root_folder_id> "Enter"

        service_account_file> "Enter"

        Edit advanced config? y/n> n
        
        Use auto config? y/n> n

        If your browser doesn't open automatically go to the following link: "Copy All to Clipboard"

        Enter verification code> "mouse1 + mouse2"

        Configure this as a team drive? y/n> n

        y) Yes this is OK

        y/e/d> y

    rclone sync /home/ mullertec:/mullertec/

    vim /etc/crontab
	
        00 12,18 * * * root rclone sync /home/ mullertec:/mullertec/