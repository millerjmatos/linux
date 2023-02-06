#!/bin/bash

# Esse script serve para a criação de usuários em lote.

# Inclui um usuário 'master' em cada grupo criado.

# Define uma permissão a cada diretório home dos usuário criados, 
# e que dá ao proprietário e ao grupo 
# completos privilégios de leitura, escrita e execução no diretório, 
# mas não permite que outros usuários tenham acesso!

# Além disso, já cria o usuário no Samba e define uma senha padrão.

# Criação de usuários
password="P@ssword"
encrypted_password=$(echo "$password" | openssl passwd -1 -stdin)

# Define a senha padrão para usuários no Samba
smb_password="smb@smb"

users=(gerencia vendas tecnologia)
for user in "${users[@]}"; do
  useradd -m -p "$encrypted_password" "$user"
  chmod 2770 /home/"$user"
  (echo "$smb_password"; echo "$smb_password") | smbpasswd -a "$user"
done

# Adição do usuário muller a todos os grupos
for group in "${users[@]}"; do
  usermod -a -G "$group" muller
done