Imprimindo...

Os módulos que estão carregados no momento:

	lsmod

Mais informações sobre o módulo:

	modinfo <módulo>

Para remover um módulo carregado:

	rmmod <módulo>

O dispositivo de audio que está sendo utilizado pelo sistema:

	lspci | grep Audio
	
O IRQ utilizado pelo dispositivo de áudio/multimídia:

	lspci -s 01:00.1 -v

Informações sobre os dispositivos USB conectados ao sistema:

	lsusb

	lsusb -s 001:001 -v

Quantidade de devices conectados em seu barramento USB:

	lsusb | wc -l
