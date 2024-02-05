Imprimindo o IP/MAC da interface:
	
	ip a show

Reiniciando uma interface:

	ip link set <nome-da-interface> <down|up>

Definindo um IP para a interface:

	ip a <add del> 192.168.100.200/24 dev enp0s8

    ip a flush dev <nome-da-interface>

Imprimindo a tabela de roteamento:

	route

	ip r

	ip route show

Definindo a rota default manualmente:

	ip route del default

	ip route add default via 192.168.1.1/24

Definindo uma rota:

	ip route <add|del> 172.16.30.0/24 via 10.0.0.1 dev <nome-da-interface>

Definindo MAC:

	ip link set <nome-da-interface> down
	
	ip link set dev <nome-da-interface> address 1A:2B:3C:55:66:00
	
	ip link set <nome-da-interface> up

Definindo o IP DHCP com arquivo de configuração /etc/network/interfaces:

		auto lo
		iface lo inet loopback

Definindo IP fixo:

		auto <nome-da-interface>
		iface <nome-da-interface> inet static
		address 192.168.x.x
		netmask 255.255.x.x
		gateway 192.168.x.x
        dns-nameservers 8.8.8.8 8.8.4.4

Um socket é uma interface de comunicação bidirecional entre processos, que permite que dois processos em uma rede se comuniquem. Ele é identificado por um endereço IP e um número de porta.
