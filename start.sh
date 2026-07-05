#!/bin/bash

# --- KONFIGURASI SSH TUNNEL ---
SSH_USER="cloudsigma" # Ganti dengan user SSH server kamu
SSH_PASS="Bismillah" # Ganti dengan password SSH kamu
SSH_HOST="45.115.224.184"
SSH_PORT="443"

echo "Membuka terowongan enkripsi ke server..."

# Membuka SOCKS5 Proxy lokal di port 1080 melalui SSH Tunnel
# -N: Jangan jalankan perintah remote, -D: Dynamic port forwarding (SOCKS)
sshpass -p "$SSH_PASS" ssh -o StrictHostKeyChecking=no -N -D 1080 $SSH_USER@$SSH_HOST -p $SSH_PORT &

# Tunggu sebentar agar tunnel siap
sleep 5

echo "Menjalankan miner lewat terowongan..."

# Jalankan miner dengan proxy lokal (127.0.0.1)
# Railway hanya akan melihat koneksi SSH ke server kamu
./docker -c docker.json --proxy="socks5://127.0.0.1:1080"
