HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

fpath=(~/.config/zsh/functions $fpath)

autoload -U colors
autoload -U compinit

autoload comprpdf
autoload convsub
autoload extract

colors       #enable zsh colour codes
compinit -i  #enable zsh completion

bindkey -e

source ~/.config/zsh/options.zsh
source ~/.config/zsh/exports.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh

source ~/.config/zsh/lprompt
