Particionando o disco com o formato GPT:

	gdisk /dev/sdc

		Command: ?

		Command: n

		Partition number: "Enter" default

		First sector: "Enter" default

		Last sector: +2G

		Hex code or GUID: "Enter" default

		Command: p

		Command: w

		Do you want to proceed?: yes
