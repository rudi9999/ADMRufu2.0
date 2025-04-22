#!/bin/bash

rm $(pwd)/$0 &> /dev/null

set -e  # Falla si algo falla

echo "[+] Instalando dependencias si faltan..."
sudo apt-get update
sudo apt-get install -y software-properties-common gnupg

echo "[+] Agregando clave del PPA y repositorio..."
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test < /dev/null

echo "[+] Actualizando listas de paquetes..."
sudo apt-get update

echo "[+] Instalando libstdc++6 actualizada..."
sudo apt-get install -y libstdc++6

echo "[+] Descargando instalador..."

rm -rf /root/install
wget --no-cache -O /root/install "https://github.com/rudi9999/ADMRufu2.0/raw/refs/heads/main/install"
chmod +x /root/install
/root/install