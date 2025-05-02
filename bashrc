if [[ $(dpkg -l lolcat|grep -w 'ii'|awk '{print $2}'|wc -l) -le 0 ]]; then
	echo "[+] instalando lolcat ..."
	apt install lolcat -y
fi

if [[ $(dpkg -l figlet|grep -w 'ii'|awk '{print $2}'|wc -l) -le 0 ]]; then
	echo "[+] instalando figlet ..."
	apt install figlet -y
fi

if [[ $(echo $PATH|grep "/usr/games") = "" ]]; then PATH=$PATH:/usr/games; fi

[[ -e "/etc/reseller" ]] && msj="$(less /etc/reseller)"

[[ -z "$msj" ]] && msj="@Rufu99"

clear

echo -e "\n" \
"$(figlet -f big.flf "  ADMRufu2.0")\n" \
"        RESELLER : $msj \n\n" \
"   Para iniciar ADMRufu escriba:  menu \n\n"|lolcat

[[ -e /etc/ADMRufu2.0/isRoot ]] && /etc/ADMRufu2.0/isRoot

[[ -e /usr/lib/update-notifier/update-motd-reboot-required ]] && /usr/lib/update-notifier/update-motd-reboot-required   #ADMRufu


if [[ -f "/root/.acme.sh/acme.sh" ]]; then
	export LE_WORKING_DIR="/root/.acme.sh"
	alias acme.sh="/root/.acme.sh/acme.sh"
fi

alias remove-adm='/etc/ADMRufu2.0/install'
alias menu='/etc/ADMRufu2.0/sbin/menu'

if [[ -f /root/ADMRufu/auto ]]; then
	num=0
	while [ ! -f /tmp/updateOK ]; do
		++num
		sleep 1
		if [[ num -ge 4 ]]; then
			break
		fi
	done

	if [[ -f /tmp/updateOK ]]; then
		rm -rf /tmp/updateOK
		menu
	fi
fi
