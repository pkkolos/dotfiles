# Ensure precmds are run after cd
fzf-redraw-prompt() {
    local precmd
    for precmd in $precmd_functions; do
        $precmd
    done

    zle reset-prompt
}
zle -N fzf-redraw-prompt

# cd into the selected directory
fzf-cd-widget() {
    setopt local_options pipe_fail

    local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \
        \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' \
        -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
        -o -type d -print 2> /dev/null | cut -b3-"}"

    local dir="$(eval "$cmd" |
        FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse \
        $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" fzf +m)"

    if [[ -z "$dir" ]]; then
        zle redisplay
        return 0
    fi

    cd "$dir"
    local ret=$?

    zle fzf-redraw-prompt

    return $ret
}
zle -N fzf-cd-widget
