Imprimindo os logs de boot do sistema em systemd-journal:

	journalctl -b

Identificando o kernel carregado no boot:

	journalctl -b | grep BOOT_IMAGE
