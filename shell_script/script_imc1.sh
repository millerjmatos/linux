#!/bin/bash

# SCRIPT SIMPLES

echo "Informe sua altura (em metros):"
read altura
echo "Informe seu peso (em kg):"
read peso

imc=$(echo "$peso / ($altura * $altura)" | bc -l)
echo "Seu IMC é: $imc"