#!/bin/bash

# Esse script serve para a criação de usuários em lote.

# Criação de usuários
password="P@ssword"
encrypted_password=$(echo "$password" | openssl passwd -1 -stdin)

users=(gerencia vendas tecnologia)
for user in "${users[@]}"; do
  useradd -m -p "$encrypted_password" "$user"
done

# Adição do usuário muller a todos os grupos
for group in "${users[@]}"; do
  usermod -a -G "$group" muller
done