if [[ $(echo $PATH|grep "/usr/games") = "" ]]; then PATH=$PATH:/usr/games; fi

[[ -e "/etc/reseller" ]] && msj="$(less /etc/reseller)"

[[ -z "$msj" ]] && msj="@Rufu99"

clear

echo -e "\n" \
"$(figlet -f big.flf "  ADMRufu2.0")\n" \
"        RESELLER : $msj \n\n" \
"   Para iniciar ADMRufu escriba:  menu \n" \
"   Para ver lista de comandos escriba:  ls-cmd \n\n"|lolcat

[[ -e /etc/ADMRufu2.0/isRoot ]] && /etc/ADMRufu2.0/isRoot

[[ -e /usr/lib/update-notifier/update-motd-reboot-required ]] && /usr/lib/update-notifier/update-motd-reboot-required   #ADMRufu


if [[ -f "/root/.acme.sh/acme.sh" ]]; then
	export LE_WORKING_DIR="/root/.acme.sh"
	alias acme.sh="/root/.acme.sh/acme.sh"
fi

alias remove-adm='/etc/ADMRufu2.0/install'
alias menu='/etc/ADMRufu2.0/sbin/menu'
alias dropBear='/etc/ADMRufu2.0/sbin/dropBear'
alias socksPY='/etc/ADMRufu2.0/sbin/socksPY'
