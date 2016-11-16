# Ensure path arrays do not contain duplicates
typeset -gU path fpath cdpath mailpath

path=(~/.local/bin $path)

export NO_AT_BRIDGE=1

# Temporary Files
if [[ -d "$XDG_RUNTIME_DIR" ]]; then
    mkdir -p -m 700 "$XDG_RUNTIME_DIR/zsh"
    TMPPREFIX="$XDG_RUNTIME_DIR/zsh/"
else
    mkdir -p -m 700 "/tmp/zsh"
    TMPPREFIX="/tmp/zsh/"
fi
