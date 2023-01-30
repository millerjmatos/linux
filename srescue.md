SystemRescueCD é um sistema operacional de recuperação de sistema baseado em Linux. Ele é projetado para ajudar os usuários a solucionar problemas no sistema, recuperar dados ou realizar manutenção em sistemas baseados em Linux. O SystemRescueCD vem com uma ampla gama de ferramentas, incluindo programas de recuperação de dados, verificação de disco, ferramentas de backup e gerenciamento de partições.

------------------------------------------------------------
_	MUDANDO SENHA DE ADMINISTRADOR DO WINDOWS USANDO O LINUX
------------------------------------------------------------

Baixe o SystemRescue: https://www.system-rescue-cd.org/
Dê boot por ele na máquina que tem o Windows.

Liste as partições do HD com: 

	fdisk -l

Localize a partição do Windows. Por exemplo: "/dev/sda1".

Monte o dispositivo na partição apropriada:

	ntfs-3g /dev/sda1 /mnt/windows

Liste o sistema: 

	df -hm

Perceba se vai aparecer o "/mnt/windows".
Se sim, entre no diretório "config":

	cd /mnt/windows/Windows/System32/config

Liste os usuários: 

	chntpw -l sam

Manipule o usuário desejado, no caso, o Administrador (ou Administrator, se aparecer assim na lista).

	chntpw -u administrador sam

Siga as opções para limpar a senha..

Opção número 1. 
            
Reinicie o computador, inicie pelo Windows e faça login como Administrador sem usar senha. 

Depois crie uma nova senha.