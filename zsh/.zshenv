# Ensure path arrays do not contain duplicates
typeset -gU path fpath cdpath mailpath

path=(~/.local/bin ~/.cargo/bin $path)

export XAUTHORITY="${XDG_RUNTIME_DIR:-"${XDG_DATA_HOME:-"$HOME/.local/share"}"}/Xauthority"
export ICEAUTHORITY="${XDG_RUNTIME_DIR:-"${XDG_DATA_HOME:-"$HOME/.local/share"}"}/ICEauthority"
export NO_AT_BRIDGE=1
export RUST_SRC_PATH=/usr/src/rust/src

# Temporary Files
if [[ -d "$XDG_RUNTIME_DIR" ]]; then
    mkdir -p -m 700 "$XDG_RUNTIME_DIR/zsh"
    TMPPREFIX="$XDG_RUNTIME_DIR/zsh/"
else
    mkdir -p -m 700 "/tmp/zsh"
    TMPPREFIX="/tmp/zsh/"
fi
