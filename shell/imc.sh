#!/bin/bash

# SCRIPT MAIS ELABORADO

echo "Insira seu peso (em kg):"
read weight

echo "Insira sua altura (em metros):"
read height

bmi=$(echo "$weight / ($height * $height)" | bc -l)

echo "Seu IMC é: $bmi"

if (( $(echo "$bmi < 18.5" | bc -l) ))
then
    echo "Abaixo do peso"
elif (( $(echo "$bmi < 25" | bc -l) ))
then
    echo "Peso normal"
elif (( $(echo "$bmi < 30" | bc -l) ))
then
    echo "Sobrepeso"
else
    echo "Obesidade"
fi