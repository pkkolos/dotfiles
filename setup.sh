#!/bin/bash

if [[ $# -gt 0 && "$1" != "install" && "$1" != "remove" ]]
then
    echo "Usage:"
    echo "    $0 [(install | remove) [file]]"
    exit 1
fi

if [[ $# -eq 0 ]]
then
    cmnd="install"
else
    cmnd="$1"
fi
shift

if [[ $# -eq 0 ]]
then
    files=(*)
    if [[ "$cmnd" != "remove" ]]
    then
        vundle=true
    else
        vundle=false
    fi
else
    files=($@)
    vundle=false
fi

for name in ${files[@]}
do
    if [[ ! -e "$PWD/$name" ]]
    then
        echo "WARNING: Skipping ${name}... Doesn't exist!"
    elif [[ "$name" != "setup.sh" ]]
    then
        if [[ "${name%_*}" != 'c' ]]
        then
            target="$HOME/.$name"
        else
            target="$HOME/.config/${name#c_}"
        fi
        if [[ -h "$target" ]]
        then
            link="$(file "$target" | sed -r "s/^.*\`([^']*).*$/\1/")"
            if [[ "$link" != "$PWD/$name" ]]
            then
                echo "WARNING: $target links to $link instead of $PWD/$name"
                if [[ "$cmnd" != "remove" ]]
                then
                    read -p "Do you want to update the link? [y/N]: " -r answer
                    if [[ "${answer^*}" == "Y" ]]
                    then
                        echo "INFO: Updating $target"
                        rm "$target"
                        ln -s "$PWD/$name" "$target"
                    else
                        echo "INFO: $target not updated"
                    fi
                else
                    read -p "Do you want to remove it? [y/N]: " -r answer
                    if [[ "${answer^*}" == "Y" ]]
                    then
                        echo "INFO: Removing $target"
                        rm "$target"
                    else
                        echo "INFO: $target not removed"
                    fi
                fi
            else
                if [[ "$cmnd" != "remove" ]]
                then
                    echo "INFO: $target already exists"
                else
                    echo "INFO: Removing $target"
                    rm "$target"
                fi
            fi
        elif [[ -e "$target" ]]
        then
            echo "WARNING: $target exists but is not a symlink."
        else
            if [[ "$cmnd" != "remove" ]]
            then
                echo "INFO: Creating $target"
                ln -s "$PWD/$name" "$target"
            else
                echo "INFO: $target doesn't exist"
            fi
        fi
    fi
done

if $vundle
then
    echo -n "Cloning vundle... "
    if [[ ! -d "$HOME/.vim/bundle/vundle/.git" ]]
    then
        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
        cmnd="install"
        echo "Vundle have been cloned"
    else
        cmnd="updat"
        echo "Vundle already exists"
    fi
    echo -n "${cmnd^*}ing bundles... "
    vim -u ~/.vimrc.bundles +BundleInstall! +qa
    echo "Bundles have been ${cmnd}ed"
fi
