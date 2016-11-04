# Ensure path arrays do not contain duplicates
typeset -gU path fpath cdpath mailpath

path=(~/.local/bin $path)
