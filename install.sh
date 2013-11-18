#!/bin/sh

for name in *; do
    if [ "${name%_*}" != 'c' ]; then
        target="$HOME/.$name"
    else
        target="$HOME/.config/${name#c_}"
    fi
    if [ -e "$target" ]; then
        if [ ! -L "$target" ]; then
            echo "WARNING: $target exists but is not a symlink."
        fi
    else
        if [ "$name" != 'install.sh' ]; then
            echo "Creating $target"
            ln -s "$PWD/$name" "$target"
        fi
    fi
done

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -u ~/.vimrc.bundles +BundleInstall +qa

# vim: tabstop=4 softtabstop=4 shiftwidth=4 expandtab:
