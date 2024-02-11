Imprimindo as imagens do kernel:

	cd /boot/

	ls -l

Imprimindo os arquivos de configuração do grub:

	cd /boot/grub/

	ls -l

Lembre-se de que modificar diretamente o arquivo /boot/grub/grub.cfg não é recomendado.

Imprimindo a versão do grub:

	update-grub --version

Atualizando o grub:

	update-grub

	update-grub > /boot/grub/grub.cfg

	grub.mkconfig > /boot/grub/grub.cfg

	grub.mkconfig -o /boot/grub/grub.cfg

Após o uso dos comandos update-grub ou grub-mkconfig é que o arquivo grub.cfg será atualizado:

	/boot/grub/grub.cfg

	ls -l /boot/grub/grub.cfg

E são obtidos as informações nos arquivos de configuração em:

	/etc/default/grub

	/etc/grub.d/*

O parâmetro que indica o kernel que deve ser utilizado durante o boot:

	linux

O parâmetro que indica ao kernel que não exiba mensagens durante o boot:

	quiet

O parâmetro que indica o caminho do initial ramdisk que o GRUB deve carregar:

	initrd

Realizando o backup do grub:

	dd if=/dev/sda of=copia.mbr bs=1 count=512

Restaurando o backup:

	dd if=copia.mbr of=/dev/sda
