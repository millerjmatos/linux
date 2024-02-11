Imprimindo os logs de boot do sistema em systemd-journal:

	journalctl -b

	dmesg

Identificando o kernel carregado no boot:

	dmesg | head

	dmesg | grep BOOT_IMAGE

	journalctl -b | grep BOOT_IMAGE
