zstyle ':completion:*'               completer _expand _complete _list _match _approximate
zstyle ':completion:*'               matcher-list 'm:{[:lower:]}={[:upper:]}' \
                                                  'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*' \
                                                  'm:{[:lower:]}={[:upper:]} l:|=*'
zstyle ':completion:*:expand:*'      group-order all-expansions
zstyle ':completion:*:match:*'       original only
zstyle ':completion:*:approximate:*' max-errors 2 numeric

# group matches
zstyle ':completion:*'              menu select
zstyle ':completion:*'              verbose true
zstyle ':completion:*'              group-name ''
zstyle ':completion:*:options'      description true
zstyle ':completion:*:options'      auto-description '%d'
zstyle ':completion:*'              list-prompt '%S%m matches%s'
zstyle ':completion:*:corrections'  format $'%B%F{blue}%d%f - %F{red}errors: %e%f%b'
zstyle ':completion:*:descriptions' format $'%B%F{blue}completion%f - %F{green}%d%f%b'
zstyle ':completion:*:messages'     format $'%d'
zstyle ':completion:*:warnings'     format $'%B%F{red}No matches for:%f %F{yellow}%d%f%b'

# paths
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' special-dirs '..'

# ignore completion directives
zstyle ':completion:*:functions' ignored-patterns '_*'

# history
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:history-words' remove-all-dups true
zstyle ':completion:*:history-words' stop true

# processes
zstyle ':completion:*:processes'       list-colors '=(#b) #([0-9]#)*=1;34=33'
zstyle ':completion:*:processes'       command "ps -au $USER -o pid,comm -w -w"
zstyle ':completion:*:processes-names' command "ps c -u $USER -o comm | uniq"

# man
zstyle ':completion:*:man:*'         menu yes select
zstyle ':completion:*:manuals'       separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# don't complete uninteresting users
zstyle ':completion:*:users' ignored-patterns \
    adm amanda apache 'avahi*' backup beaglidx bin cacti canna clamav colord \
    daemon dbus '(D|d)ebian*' distcache dnsmasq dovecot epmd fax ftp games gdm \
    geoclue gkrellmd gnats gopher hacluster haldaemon halt hplip hsqldb ident \
    irc junkbust ldap list lp mail mailman mailnull man messagebus mldonkey \
    mysql nagios named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
    operator pcap postfix postgres privoxy proxy pulse pvm quagga radvd rpc \
    rpcuser rpm rtkit saned shutdown squid sshd statd sync sys 'systemd*' \
    usbmux uucp uuidd vcsa www-data xfs '_*'
