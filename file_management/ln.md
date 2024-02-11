Criando um link físico para o arquivo:

	ln script.sh link-hard

	ls -li script.sh link-hard

Note que ambos possuem o mesmo inode.

A edição de qualquer um refletirá no outro!

Não funciona em diretórios.

Criando um link simbólico para o arquivo:

	ln -s script.sh link-simbolico

	ls -li script.sh link-hard

Criando um link simbólico para um diretório:

	cd /home/

	ln -s /var/ atalho_var

Removendo o link simbólico, nome sem "/" no final:

	rm atalho_var
		
		y

Note a diferença no inode.

Similar a um atalho!

As permissões sempre são 777

Se deletar o link principal o simbólico estará quebrado.
