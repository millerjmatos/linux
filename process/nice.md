Definindo a prioridade de um processo:

	nice -<-20 ~ 19> firefox

	nice -n 10 firefox &

	nice -n -15 qps &

	nice --20 watch -n5 free -m &

O nice vai de -20 até 19. Quanto < maior a prioridade!

O valor padrão é 0
