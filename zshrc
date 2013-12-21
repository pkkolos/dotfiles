HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

fpath=(~/.config/zsh/functions $fpath)

autoload -U colors
autoload -U compinit
autoload -U edit-command-line

autoload comprpdf
autoload convsub
autoload extract

zle -N edit-command-line

colors       #enable zsh colour codes
compinit -i  #enable zsh completion

bindkey -e

bindkey ' '     magic-space         #do history expansion on space
bindkey '^I'    complete-word
bindkey '^U'    backward-kill-line
bindkey '^X^E'  edit-command-line   #edit current command line in $EDITOR
bindkey '^[k'   kill-whole-line

source ~/.config/zsh/options.zsh
source ~/.config/zsh/exports.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh

source ~/.config/zsh/lprompt
