Gerando uma chave pública com o gpg:

	gpg --gen-key

	gpg --list-keyss

	gpg --expert --full-gen-key

Arquivo que contém as informações das chaves:

	ls -la /home/user/.gnupg/

Exportando a chave pública:

	gpg --list-keys

	gpg --export "Muller Jorge" > key.muller.pub

	gpg --export --armor "Muller Jorge" > key.muller.pub.asc

	gpg --export --armor "Muller Jorge" --output key.muller.pub.asc

Exportando a chave pública através de um servidor:

	gpg --keyserver keys.openpgp.org --send-keys <ID>

Desfazendo:

	gpg --keyserver keys.openpgp.org --gen-revoke <ID>

Importando a chave pública (máquina cliente):

	gpg --import chave-muller.pub

	gpg --list-keys

Importando a chave pública através de um servidor (máquina cliente):

	gpg --keyserver keys.openpgp.org --recv-keys <ID>

	gpg --list-keys

Encriptando um arquivo (não necessita de chaves):

	gpg -c arquivo.txt

	gpgconf --reload gpg-agent

Decriptando:

	gpg arquivo.txt.gpg
