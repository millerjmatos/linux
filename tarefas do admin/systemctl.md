Imprimindo todos os serviços disponíveis:

	systemctl -t service

	systemctl list-units --type=service --state=running

	service --status-all

	service --status-all | grep "running"
