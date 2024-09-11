Verificar se uma porta está aberta em um host:

    nc -vz <HOST> <PORTA>

Iniciar um listener (similar ao que netstat -l mostraria):

    nc -l -p <porta> -v
