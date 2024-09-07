if [[ $(echo $PATH|grep "/usr/games") = "" ]]; then PATH=$PATH:/usr/games; fi

[[ -e "/etc/reseller" ]] && msj="$(cat /etc/reseller)"

[[ -z "$msj" ]] && msj="@Rufu99"

clear

#echo -e "\n$(figlet -f big.flf "  ADMRufu")\n        RESELLER : $mess1 \n\n   Para iniciar ADMRufu escriba:  menu \n   Para ver lista de comandos escriba:  ls-cmd \n\n   $v2\n\n"|lolcat

echo -e "\n" \
"$(figlet -f big.flf "  ADMRufu")\n" \
"        RESELLER : $mess1 \n\n" \
"   Para iniciar ADMRufu escriba:  menu \n" \
"   Para ver lista de comandos escriba:  ls-cmd \n\n"|lolcat

[[ -e /usr/lib/update-notifier/update-motd-reboot-required ]] && /usr/lib/update-notifier/update-motd-reboot-required   #ADMRufu

alias update-adm='git -C /etc/ADMRufu2.0 pull'
