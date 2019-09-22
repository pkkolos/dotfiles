HISTFILE=~/.local/share/zsh/history
HISTSIZE=10000
SAVEHIST=10000

fpath=(~/.config/zsh/functions $fpath)

function {
    local pfunction

    setopt local_options extended_glob

    for pfunction in $HOME/.config/zsh/functions/^_*(-.N:t); do
        autoload -Uz "$pfunction"
    done
}

function {
    local widget

    for widget in $HOME/.config/zsh/widgets/*; do
        source "$widget"
    done
}

autoload -Uz colors
autoload -Uz compinit
autoload -Uz edit-command-line

zle -N edit-command-line

compinit -i -d ${XDG_CACHE_HOME:-"$HOME/.cache"}/zsh/zcompdump
colors                              # enable zsh colour codes

bindkey -e

bindkey ' '     magic-space         # do history expansion on space
bindkey '^I'    complete-word
bindkey '^U'    backward-kill-line
bindkey '^X^E'  edit-command-line   # edit current command line in $EDITOR
bindkey '^[k'   kill-whole-line
bindkey '\ec'   fzf-cd-widget
bindkey '^T'    fzf-file-widget
bindkey '^R'    fzf-history-widget

source ~/.config/zsh/options.zsh
source ~/.config/zsh/exports.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh

source ~/.config/liquidprompt/liquidprompt
