#!/bin/bash

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

echo "[✓] Verificación final:"
strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBCXX | sort | tail
