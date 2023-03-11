# Ensure path arrays do not contain duplicates
typeset -gU path fpath cdpath mailpath

path=(~/.local/bin ~/.cargo/bin $path)

export DESKTOP_SESSION=gnome
export QT_QPA_PLATFORMTHEME=qt5ct
export XAUTHORITY="${XDG_RUNTIME_DIR:-"${XDG_DATA_HOME:-"$HOME/.local/share"}"}/Xauthority"
export ICEAUTHORITY="${XDG_RUNTIME_DIR:-"${XDG_DATA_HOME:-"$HOME/.local/share"}"}/ICEauthority"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-"$HOME/.config"}/notmuch/config"
export TASKRC="${XDG_CONFIG_HOME:-"$HOME/.config"}/task/config"
export URXVT_PERL_LIB="${XDG_DATA_HOME:-"$HOME/.local/share"}/urxvt/ext"
export NO_AT_BRIDGE=1

# Temporary Files
if [[ -d "$XDG_RUNTIME_DIR" ]]; then
    mkdir -p -m 700 "$XDG_RUNTIME_DIR/zsh"
    TMPPREFIX="$XDG_RUNTIME_DIR/zsh/"
else
    mkdir -p -m 700 "/tmp/zsh"
    TMPPREFIX="/tmp/zsh/"
fi
