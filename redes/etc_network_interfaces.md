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