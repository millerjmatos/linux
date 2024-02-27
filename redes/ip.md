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
