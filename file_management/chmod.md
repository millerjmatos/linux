Definindo as permissões de acesso a um arquivo:

	ls -l /bin/ls

	chmod o-x /bin/ls

Efetue login em outro terminal com usuário comum.

Execute o comando ls e verifique que o user não tem permissão para executar o programa.

No tty1 como root:

	chmod o+x /bin/ls

Removendo escrita do grupo dono: -rwxrw-r-- user manager linux.txt

	chmod g-w linux.txt
ou
	chmod 744 linux.txt

Resultado = -rwxr--r-- user manager linux.txt
	
Adicionando execução a todos: -rwxr--r-- user manager linux.txt

	chmod a+x linux.txt
ou
	chmod 755 linux.txt

Resultado = -rwxr-xr-x user manager linux.txt

Adicionando escrita ao usuário e grupo dono: -rwxr-xr-x user manager linux.txt

	chmod ug+w linux.txt
ou
	chmod 775 linux.txt

Resultado = -rwxrwxr-x user manager linux.txt

Definindo a permissão recurssivamente no diretório:

	chmod 755 -R /home/user/diretorio
	
Executando um arquivo com as permissões do dono (user) SUID:

	ls -l /home/user/Linux/script.sh

		-rwxrwxr-x user manual script.sh
	
	chmod u+s script.sh

	chmod 4775 script.sh

	ls -l /home/user/Linux/script.sh

		-rwsrwxr-x user manual script.sh
		
Executando um arquivo com as permissões do grupo GUID:
	
	chmod g+s script.sh

	chmod 2775 script.sh

	ls -l /home/user/Linux/script.sh

		-rwsrwsr-x user manual script.sh

Definindo o grupo dos arquivos criados em um "diretório":

	chmod g+s /home/user/
	
	chmod 

	cd /home/user/Linux/

Entre com outro usuário e faça o teste:

	touch arquivo.txt

	ls -l /home/user/Linux/arquivo.txt

O sticky bit define que um diretório ou arquivo só pode ser excluído ou editado pelo dono:
	
	chmod o+t arquivo.txt
	
	chmod 5775 arquivo.txt

	ls -l arquivo.txt

		-rwsrwsr-t user manual arquivo.txt

    s: possui permissão de execução.
    
    S: não possui permissão de execução.
    
    t: possui permissão de execução.
    
    T: não possui permissão de execução.
