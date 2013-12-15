HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

fpath=(~/.config/zsh/functions $fpath)

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

source ~/.config/liquidprompt/liquidprompt
source ~/.config/zsh/exports.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh


autoload -U colors   && colors
autoload -U compinit && compinit -i

autoload comprpdf
autoload convsub
autoload extract
