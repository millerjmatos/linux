Imprimindo os logs de boot do sistema em systemd-journal:

	dmesg

Identificando o kernel carregado no boot:

	dmesg | head

	dmesg | grep BOOT_IMAGE
