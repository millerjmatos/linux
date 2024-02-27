Imprimindo os hosts da rede:

	nmap -sP 192.168.0.0/24

	nmap -sP 192.168.0.*

Imprimindo as portas abertas de um alvo: 

	nmap -sT 192.168.0.10

	nmap -Pn 192.168.0.20

Imprimindo se uma porta específica está aberta:

	nmap -p 80 192.168.0.0/24

	nmap -p 80 localhost

	nmap -p 21 192.168.1.1

Imprimindo o SO de um alvo:

	nmap -0 192.168.1.5
