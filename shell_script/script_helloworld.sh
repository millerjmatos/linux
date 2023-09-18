#!/bin/bash

# Limpa a tela
clear

# Imprime uma mensagem de boas-vindas
echo "+++++++++++ Meu Primeiro Script +++++++++++"

# Imprime o nome do script e o número de parâmetros
echo "Nome do script: $0"
echo " "
echo "Número de parâmetros: $#"

# Imprime os parâmetros passados para o script
if [ $# -gt 0 ]; then
  echo "Parâmetros passados: $*"
else
  echo "Nenhum parâmetro passado."
fi

# Imprime o tempo de atividade do sistema e o uso de memória
echo "Tempo de atividade do sistema: $(uptime)"
echo " "
echo "Uso de memória:"
free -m
echo " "

# Imprime uma mensagem indicando o final do script
echo "Execução do script concluída."