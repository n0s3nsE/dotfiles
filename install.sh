#!/bin/bash
set -eu

set_link() {

    echo "Setting symbolic link"

    local script_dir=$(cd $(dirname $0); pwd)
    local dot_dir=$(dirname ${script_dir}})

    for f in $script_dir/.??*; do
        local file_name="$(basename $f)"
        if [ -e "$HOME/$file_name" ];then
            if [ ! -d "$HOME/backup_old_dotfiles" ];then
                mkdir "$HOME/backup_old_dotfiles"
            fi

            if [ -L "$HOME/$file_name" ];then
                unlink "$HOME/$file_name"
            else
                mv "$HOME/$file_name" "$HOME/backup_old_dotfiles"
            fi
        else
            if [ $f != "$script_dir/.git" ];then
                echo $f    
                ln -s $f $file_name
            fi
        fi
    done
}

set_vim() {
    echo "Setting vim"
    if [ ! -d "$HOME/.vim/" ];then
        mkdir "$HOME/.vim"
    fi

    git clone https://github.com/tomasr/molokai "$HOME/molokai"

    if [ ! -d "$HOME/.vim/colors" ];then
        mkdir "$HOME/.vim/colors"
    fi
    
    mv "$HOME/molokai/colors/molokai.vim" "$HOME/.vim/colors/"
    rm -rf "$HOME/molokai"
}

set_git() {
    echo "Setting git"
    read -rp "name : " name
    read -rp "email : " email

    git config --global user.name "$name"
    git config --global user.email "$email"
}

set_link
set_vim
set_git

echo "Install completed"