# Paste the selected file path(s) into the command line
__fsel() {
    setopt local_options pipe_fail

    local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \
        \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' \
        -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
        -o -type f -print -o -type d -print -o -type l -print \
        2> /dev/null | cut -b3-"}"

    eval "$cmd" |
        FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse \
        $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m "$@" |
        while read item; do
            echo -n "${(q)item} "
    done

    local ret=$?
    echo

    return $ret
}

fzf-file-widget() {
    LBUFFER="${LBUFFER}$(__fsel)"
    local ret=$?
    zle reset-prompt

    return $ret
}
zle -N fzf-file-widget
