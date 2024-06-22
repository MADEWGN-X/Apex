#!/bin/bash

read -p "username: " user
read -p "uuid: " uuid
read -p "exp: " exp

user_EXISTS=$(grep -w "$user" /etc/xray/trojan.json | wc -l)

if [[ $user_EXISTS -eq 1 ]]; then
    echo "Username or Name is already taken!"
else
    sed -i '/#trojanws$/a\#! '"$user $exp"'\
    },{"password": "'"$uuid"'","email": "'"$user"'"' /etc/xray/config.json
    
    sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
    },{"password": "'"$uuid"'","email": "'"$user"'"' /etc/xray/config.json
    
    systemctl restart xray
    echo "restart"
fi
