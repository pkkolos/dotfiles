zstyle ':completion:*'                  completer _expand _complete _list _correct _approximate
zstyle ':completion:*'                  group-name ''
zstyle ':completion:*'                  ignore-parents parent pwd
zstyle ':completion:*'                  list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*'                  list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*'                  matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=*' 'l:|=*'
zstyle ':completion:*'                  menu select
zstyle ':completion:*'                  select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*'                  verbose true

zstyle ':completion:*:approximate:*'    max-errors 5 numeric
zstyle ':completion:*:correct:*'        max-errors 2 not-numeric
zstyle ':completion:*:expand:*'         group-order all-expansions

zstyle ':completion:*:man:*'            menu yes select

zstyle ':completion:*:corrections'      format $'%B%F{blue}%d%f - %F{red}errors: %e%f%b'
zstyle ':completion:*:descriptions'     format $'%B%F{blue}completion%f - %F{green}%d%f%b'
zstyle ':completion:*:functions'        ignored-patterns '_*'
zstyle ':completion:*:history-words'    list false
zstyle ':completion:*:history-words'    menu yes
zstyle ':completion:*:history-words'    remove-all-dups true
zstyle ':completion:*:history-words'    stop true
zstyle ':completion:*:manuals'          separate-sections true
zstyle ':completion:*:manuals.*'        insert-sections true
zstyle ':completion:*:messages'         format '%d'
zstyle ':completion:*:options'          auto-description '%d'
zstyle ':completion:*:options'          description true
zstyle ':completion:*:processes'        command "ps -au $USER -o pid,comm -w -w"
zstyle ':completion:*:processes'        list-colors '=(#b) #([0-9]#)*=1;34=33'
zstyle ':completion:*:processes-names'  command "ps c -u $USER -o comm | uniq"
zstyle ':completion:*:warnings'         format $'%B%F{red}No matches for:%f %F{yellow}%d%f%b'

#zstyle ':completion:*:*:-subscript-:*'  tag-order indexes parameters
