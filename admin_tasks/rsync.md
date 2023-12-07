O rsync é uma ferramenta de linha de comando usada para sincronizar arquivos e diretórios entre dois locais diferentes, seja em uma mesma máquina ou em máquinas diferentes através da rede. Ele é frequentemente usado em ambientes de backup e transferência de arquivos, pois é capaz de transferir somente as partes dos arquivos que foram modificadas ou adicionadas, tornando as transferências mais rápidas e eficientes. O rsync é capaz de preservar as permissões, as datas de modificação, as propriedades dos arquivos e diretórios e outros atributos dos arquivos durante a transferência.

Recomendado que em ambos, cliente e servidor, o openssh e rsync estajam instalados:

    whereis rsync

    apt install openssh-server rsync -y

    dnf in openssh-server rsync -y

Do lado cliente..

Enviando os arquivos do diretório atual para o servidor, ex.:

    rsync -ahv . muller@172.16.20.100:/backup/muller

-a (--arquive) copiar arquivos recursivamente, preservando as permissões, as datas de modificação, as propriedades dos arquivos e diretórios, etc.

-h (--human-readable) tamanhos de arquivos em formato legível.

-v (--verbose) informações detalhadas sobre o processo de transferência de arquivos.

Para enviar apenas as alterações:

    rsync -uahv . user@server_IP:/backup/user

-u (--update) faz com que o programa sincronize apenas os arquivos na origem que são mais recentes do que os arquivos correspondentes no destino.

Espelhamento:

    rsync -uahv --delete . user@server_IP:/backup/user

(--delete) exclui arquivos no destino que não estão mais presentes na origem.