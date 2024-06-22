#!/bin/bash



while true; do
    echo "restart wgnapi"
    systemctl restart wgnapi

    sleep 3600  # Menunggu 1 menit sebelum memeriksa lagi
done

