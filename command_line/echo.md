Imprimindo o resultado na saída padrão:

	echo Linux

	echo "O Linux é demais!!"

Imprimindo o conteúdo de uma variável:

	echo $SHELL

	echo $PATH

Imprimindo o diretório home do usuário atual:

	echo $HOME

	echo ~

Saiba o PID do shell atual:

	echo $$

	ps | grep bash

Saiba o PID do último processo executado em background:

	echo $!

Saiba o exit code do último processo executado:

	ls /tmp

	echo $?

Imprimindo todos os arquivos do diretório local:

	echo *

Protegendo caracteres especiais, quoting:

	echo "."

	echo "$HOME"

Apóstrofo '' e barra invertida \ protegem os caracteres sem exceção:

	echo \. && echo \$HOME && echo '.' && echo '$HOME'

	echo "\." && echo "$HOME"

	echo "Curso     Linux   LPI1"

	echo Curso\ \ \ \ \ Linux\ \ \ LPI1