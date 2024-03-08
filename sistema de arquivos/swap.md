A área de swap (também chamada de espaço de troca, memória virtual ou arquivo de paginação) é uma região do disco rígido usada pelo sistema operacional para armazenar temporariamente dados que não cabem na memória RAM do computador. Quando a RAM está cheia, o sistema operacional move alguns dos dados da RAM para a área de swap para liberar espaço na memória RAM para novos dados.

Imprimindo as informações de swap e memória:

	cat /proc/swaps

	free -m

	swapon -s

> Incluindo área de swap em um sistema que não possui.

Criando um arquivo de 1 gigabyte no caminho especificado, onde cada bloco tem 1 megabyte de tamanho e o dd lê e grava a quantidade de 1024 blocos de dados na criação:

    dd if=/dev/zero of=/minha_area_swap bs=1M count=1024

    chmod 600 /minha_area_swap

Criando a área de swap:

    mkswap /minha_area_swap

Ativando:

    swapon /minha_area_swap

    swapon -s

Tornando a configuração permanente:

    vim /etc/fstab

        :$

        o

        /minha_area_swap    none    swap    sw  0 0        

        :wc

    reboot

> Redimensionado a área de swap.

Desativando a área de swap ativa:

    swapoff /minha_area_swap

Redimensionando:

    dd if=/dev/zero of=/minha_area_swap bs=1M count=4096

Formatando:

    mkswap /minha_area_swap

Ativando a área de swap:

    swapon /minha_area_swap

    free -mh

    swapon -s

    reboot

> Nesse caso no fstab a área de swap já estava referenciada, não foi preciso editá-lo.

O local recomendado para criar o arquivo de swap é em /var, que é geralmente reservado para dados variáveis, como logs, bancos de dados e arquivos temporários. O arquivo de swap em /var pode ser chamado de /var/swap ou /var/swapfile.

Desligando o swap temporariamente para transferir os dados para a memória principal, caso haja espaço disponível na memória principal:

    swapoff -a && swapon -a

Alterando o valor de swappiness. Para diminuir a utilização de swap:

    cat /proc/sys/vm/swappiness

    sysctl -w vm.swappiness=10

Para tornar permanente:

    echo 'vm.swappiness=10' >> /etc/sysctl.d/99-swappiness.conf

    systemctl reboot
