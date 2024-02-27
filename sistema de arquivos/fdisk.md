Imprimindo os discos e as partições de cada um deles:

	fdisk -l

	parted -l

	lsblk

	lsblk -f

É preciso estar como root.

Particionando o disco:

	fdisk /dev/sdb

		Command: F

		Command: n

		Partition type: p primary

		Partition number: 1

		First sector: "Enter" default

		Last sector: +2G

		Command: p

Tudo feito até aqui ainda não foi salvo!

		Command: n

		Partition type: p primary

		Partition number: 2

		First sector: "Enter" default

		Last sector: +1G

		Command: p

Terceira partição:

		Command: n

		Partition type: p primary

		Partition number: 3

		First sector: "Enter" default

		Last sector: +1G

		Command: p

Ao tentar criar uma nova partição o fdisk vai sugerir uma partição extendida!
O limite de partições primarias em um disco são 3.

Quarta partição:

		Command: n

		Partition type: e extended

		Partition number: 4

		First sector: "Enter" default

Lembrando que a partição extendida irá comportar as partições lógicas.
A próxima opção irá usar todo o restante do disco.

		Last sector: "Enter" default

		Command: p

Quinta partição:

		Command: n

		Adding logical partition 5

		First sector: "Enter" default

		Last sector: +500M

		Command: p

Sexta partição:

		Command: n

		Adding logical partition 6

		First sector: "Enter" default

		Last sector: +1G

		Command: p

		Command: w

	fdisk -l

Excluindo a partição 2:

	fdisk /dev/sdb

		Command: d

		Partition number: 2

		Command: w

Caso exclua a partição 4 as partições 5 e 6 serão excluídas também, pois são lógicas, dentro da extendida.

Mundando o tipo de uma partição:

	fdisk /dev/sdb

		Command: l

		Command: t

		Partition number: 5

		Partition type: 82

		Command: w

No padrão GPT, teoricamente, não há limitação no número de partições.