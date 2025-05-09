#!/bin/bash

rm $(pwd)/$0 &> /dev/null
set -e

echo "[+] Detectando sistema..."
. /etc/os-release

sudo apt-get update
sudo apt-get install -y gnupg wget software-properties-common lsb-release

if [[ "$ID" == "ubuntu" ]]; then
    echo "[+] Ubuntu detectado. Usando PPA ubuntu-toolchain-r/test..."
    sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test < /dev/null
    sudo apt-get update
    sudo apt-get install -y libstdc++6

elif [[ "$ID" == "debian" ]]; then
    echo "[+] Debian detectado. Instalando libstdc++6 manualmente..."

    # ARCH=$(dpkg --print-architecture)
    VERSION_ID_NUM=$(echo "$VERSION_ID" | cut -d'.' -f1)

    # URL de ejemplo con GCC 11.2 (libstdc++6 11.2.0-19)
    LIBSTDCPP_DEB_URL="https://ftp.debian.org/debian/pool/main/g/gcc-11/libstdc++6-11-dbg_11.5.0-2_arm64.deb"

    echo "[+] Descargando libstdc++6 desde: $LIBSTDCPP_DEB_URL"
    wget -O /tmp/libstdc++6.deb "$LIBSTDCPP_DEB_URL"

    echo "[+] Instalando .deb..."
    sudo dpkg -i /tmp/libstdc++6.deb || sudo apt-get install -f -y

else
    echo "[!] Sistema no soportado automáticamente. Abortando..."
    exit 1
fi

echo "[+] Descargando instalador..."
rm -rf /root/install
wget --no-cache -O /root/install "https://github.com/rudi9999/ADMRufu2.0/raw/refs/heads/main/install"
chmod +x /root/install
/root/install
