Imprimindo as informações sobre o sistema de arquivos:

	tune2fs -l /dev/sdb1 | less

	tune2fs -l /dev/sdb1 | grep <"Block count" "created">

Definindo um label para a partição com o tune2fs:

	tune2fs -L "Pendrive" /dev/sdb1

	dumpe2fs -h /dev/sdb1

Definindo o tempo de checagem (check interval):

	tune2fs -i 7d /dev/sdb1

O xfs_admin é o comando equivalente para sistema de arquivos XFS. Os comandos são similares ao tune2fs.
