#!/bin/bash

# Obtém a data atual
current_date=$(date +%s)

# Obtém a data de nascimento
birth_date=$(date -d "$3-$2-$1" +%s)

# Calcula a diferença entre as datas (em segundos)
diff=$((current_date - birth_date))

# Converte a diferença de segundos para anos
idade=$((diff / 31536000))

echo "A idade é $idade anos."

# Você precisará passar três parâmetros para o script, ex.:
# ./idade_calculator.sh 1 1 2000