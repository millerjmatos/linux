Nas distribuições modernas é utilizado o gerenciador de redes NetWorkManager.

Imprimindo o status das configurações de rede:

	systemctl status NetworkManager 

Arquivo de configuração:

	cat /etc/NetworkManager/NetworkManager.conf	

Imprimindo informações das interfaces disponíveis:

	nmcli

	nmcli device

	nmcli connection

Derrubando e subindo uma conexão:

	nmcli connection down ethX ; nmcli connection up ethX

	nmcli device

Adicionando um nova conexão:

	nmcli connection add type ethernet con-name NovaRede ifname eth02 ip4 172.22.22.100/24 gw4 172.22.22.254

	nmcli connection up NovaRede

	nmcli device show eth2	

	cd /etc/NetworkManager/system-connections/

	cat NovaRede

Deletando uma conexão:

	nmcli connection del NovaRede

Recarregando todas as conexões:

	nmcli connection reload

Definindo o DNS da interface:

	nmcli con modify ethX +ipv4.dns 8.8.4.4 +ipv4.dns 208.67.222.222 +ipv4.dns 208.67.220.220 

	nmcli con reload 

	nmcli con down ethX ; nmcli con up ethX	

	nmcli device

	nmcli con modify ethX -ipv4.dns 8.8.4.4 

	nmcli con reload 

	nmcli con down ethX ; nmcli con up ethX	

	nmtui

Localizando redes Wi-Fi:

	nmcli device wifi list

	nmcli device wifi rescan

Ativando desativando redes Wi-Fi:

	nmcli radio wifi <on off>

Conectando desconectando no Wi-Fi:

	nmcli device wifi <SSID> password <PASS>

	nmcli device wifi disconnect <SSID>
