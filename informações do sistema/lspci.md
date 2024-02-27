O dispositivo de audio que está sendo utilizado pelo sistema:

	lspci | grep Audio
	
O IRQ utilizado pelo dispositivo de áudio/multimídia:

	lspci -s 01:00.1 -v
