Verificando a integridade do sistema de arquivos:

	fsck /dev/sdb1

	fsck -t ext4 /dev/sdb1

Sem fazer nenhum alteração:

	fsck -n /dev/sdb1

Aceitando todas as operações

	fsck -y /dev/sdb1
