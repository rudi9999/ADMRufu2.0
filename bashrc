if [[ $(echo $PATH|grep "/usr/games") = "" ]]; then PATH=$PATH:/usr/games; fi

[[ -e "/etc/reseller" ]] && msj="$(less /etc/reseller)"

[[ -z "$msj" ]] && msj="@Rufu99"

clear

echo -e "\n" \
"$(figlet -f big.flf "  ADMRufu")\n" \
"        RESELLER : $msj \n\n" \
"   Para iniciar ADMRufu escriba:  menu \n" \
"   Para ver lista de comandos escriba:  ls-cmd \n\n"|lolcat

[[ -e /usr/lib/update-notifier/update-motd-reboot-required ]] && /usr/lib/update-notifier/update-motd-reboot-required   #ADMRufu

alias remove-adm='/etc/ADMRufu2.0/install'
alias menu='/etc/ADMRufu2.0/sbin/menu'