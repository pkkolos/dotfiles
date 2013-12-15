zstyle ':completion:*'                  completer _expand _complete _match _list _correct _approximate _files
zstyle ':completion:*'                  matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*'                  ignore-parents parent pwd
zstyle ':completion:*'                  group-name ''
zstyle ':completion:*'                  list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*'                  menu select
zstyle ':completion:*'                  select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*'                  verbose true
zstyle ':completion:*:approximate:*'    max-errors 5 numeric
zstyle ':completion:*:correct:*'        insert-unambiguous true
zstyle ':completion:*:correct:*'        max-errors 2 not-numeric
zstyle ':completion:*:correct:*'        original true
zstyle ':completion:*:corrections'      format $'%B%F{blue}%d%f - %F{red}errors: %e%f%b'
zstyle ':completion:*:default'          list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions'     format $'%B%F{blue}completion%f - %F{green}%d%f%b'
zstyle ':completion:*:expand:*'         tag-order all-expansions
zstyle ':completion:*:functions'        ignored-patterns '_*'
zstyle ':completion:*:history-words'    list false
zstyle ':completion:*:history-words'    menu yes
zstyle ':completion:*:history-words'    remove-all-dups yes
zstyle ':completion:*:history-words'    stop yes
zstyle ':completion:*:man:*'            menu yes select
zstyle ':completion:*:manuals'          separate-sections true
zstyle ':completion:*:manuals.*'        insert-sections true
zstyle ':completion:*:matches'          group 'yes'
zstyle ':completion:*:messages'         format '%d'
zstyle ':completion:*:options'          auto-description '%d'
zstyle ':completion:*:options'          description yes
zstyle ':completion:*:processes'        command "ps -au $USER -o pid,user,comm -w -w"
zstyle ':completion:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:processes-names'  command "ps c -u $USER -o comm | uniq"
zstyle ':completion:*:*:-subscript-:*'  tag-order indexes parameters
zstyle ':completion:*:warnings'         format $'%B%F{red}No matches for:%f %F{yellow}%d%f%b'