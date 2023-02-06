#!/bin/bash

# Esse script serve para a criação de usuários em lote.

# Criação de usuários
password="P@ssword"
encrypted_password=$(echo "$password" | openssl passwd -1 -stdin)

users=(gerencia vendas tecnologia)
for user in "${users[@]}"; do
  useradd -m -p "$encrypted_password" "$user"
  chmod 2770 /home/"$user"
done

# Adição do usuário muller a todos os grupos
for group in "${users[@]}"; do
  usermod -a -G "$group" muller
done