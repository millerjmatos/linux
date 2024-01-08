Agrupando através de uma saída:

	find /home/ -type f -name "*.pdf" | cpio -o > backup.cpio

Desagrupando o conteúdo do aqruivo .cpio no diretório local:

	cpio -i < backup.cpio

Agrupando e comprimindo através de uma saída ao mesmo tempo com xz:

	find /home/ -type f -name "*.pdf" | cpio -o | xz > backup.cpio.zx

Descomprimindo o arquivo cpio.xz:

	xz -c backup.cpio.zx | cpio -i
