Instalando o utilitário ifconfig:

	apt install net-tools

Reiniciando uma interface:

	ifconfig <nome-da-interface> down
    
    ifconfig <nome-da-interface> up

Definindo um IP para a interface:

	ifconfig <nome-da-interface> 192.168.100.88 netmask 255.255.255.0
