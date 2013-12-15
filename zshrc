HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

fpath=(~/.config/zsh/completion $fpath)

bindkey -e

setopt auto_cd
setopt always_to_end
setopt auto_menu
setopt complete_in_word
setopt hash_list_all
setopt no_menu_complete
setopt extended_glob
setopt no_nomatch
setopt unset
setopt append_history
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt correct
setopt no_correct_all
setopt no_flow_control
setopt long_list_jobs
setopt promptsubst
setopt no_sh_word_split
setopt no_beep

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

source ~/.config/liquidprompt/liquidprompt
source ~/.config/zsh/exports.zsh
source ~/.config/zsh/aliases.zsh

load_functions=(comprpdf convsub)

for func ($load_functions); do
    if [ -f ~/.config/zsh/functions/$func.zsh ]; then
        source ~/.config/zsh/functions/$func.zsh
    fi
done

autoload -U colors   && colors
autoload -U compinit && compinit -i

# vim: tabstop=4 softtabstop=4 shiftwidth=4 expandtab:
