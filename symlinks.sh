#!/bin/bash

function symlink {
  if [ -e ~/$1 ]; then
    echo "$1 finnes allerede"
  else
    echo "Symlinker $1"
    ln -s ~/dotfiles/$1 ~/$1
  fi
}

symlink .emacs.d
symlink .gitconfig
