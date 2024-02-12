O xrdp é uma alternativa para acessar estações Linux através do MS RDP. 

Site: http://xrdp.org/

Instalação:

	apt install xrdp

	systemctl enable xrdp

	ufw allow from any to any port 3389 proto tcp
