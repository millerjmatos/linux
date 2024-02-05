Adicionando um usuário no sistema:

	useradd -m user

	useradd -m user -s /bin/bash

	useradd -m name_user -d /home/user -s /bin/bash

	passwd <user>

Adicionando um usuário sem diretório home:

	useradd -M <user>

	useradd -no-create-home <user>

Adicionando um usuário e amarrando seu diretório pessoal:

	useradd <user> -d /home/<user/

Removendo um usuário do sistema:

	userdel <user>

Removendo um usuário do sistema e o seu diretório home:

	userdel -r <user>
