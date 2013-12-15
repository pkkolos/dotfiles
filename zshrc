HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

fpath=(~/.config/zsh/functions $fpath)

bindkey -e

source ~/.config/liquidprompt/liquidprompt
source ~/.config/zsh/options.zsh
source ~/.config/zsh/exports.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh


autoload -U colors   && colors
autoload -U compinit && compinit -i

autoload comprpdf
autoload convsub
autoload extract
