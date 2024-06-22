#!/bin/bash

read -p "username: " user
read -p "uuid: " uuid
read -p "exp: " exp

user_EXISTS=$(grep -w "$user" /etc/xray/vmess.json | wc -l)

if [[ $user_EXISTS -eq 1 ]]; then
    echo "Username or Name is already taken!"
else
    sed -i '/#vmess$/a\### '"$user $exp"'\
    },{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
    sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
    },{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
    systemctl restart xray
    echo 'berhasil restart'
fi
