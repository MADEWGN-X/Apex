#!/bin/bash

while true; do
    if systemctl is-active --quiet wgnapi.service; then
        echo "wgnapi service is running."
    else
        echo "Restarting wgnapi service..."
        systemctl restart wgnapi.service
    fi

    if systemctl is-active --quiet xray.service; then
        echo "xray service is running."
    else
        echo "Restarting xray service..."
        systemctl restart xray.service
    fi

    sleep 30  # Menunggu 1 menit sebelum memeriksa lagi
done
