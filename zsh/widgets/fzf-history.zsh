# Paste the selected command from history into the command line
fzf-history-widget() {
    setopt local_options no_glob_subst no_posix_builtins pipe_fail

    local selected num
    selected=( $(fc -rl 1 |
        FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS \
        -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS \
        --query=${(qqq)LBUFFER} --reverse" fzf +m) )
    local ret=$?

    if [ -n "$selected" ]; then
        num=$selected[1]
        if [ -n "$num" ]; then
            zle vi-fetch-history -n $num
        fi
    fi
    zle reset-prompt

    return $ret
}
zle -N fzf-history-widget
