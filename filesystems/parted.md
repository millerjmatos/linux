Utilizando o parted:

	parted /dev/sdc

		Listando as partições: p

Redimensionando uma partição em 1 gigabyte:

		resizepart <number> <new_end>

		resizepart 2 1GB

		p

		saindo: quit

	fdisk -l /dev/sdc

O gparted é a versão gráfica do parted:

	apt install gparted
