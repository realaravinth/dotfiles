#!/bin/bash

cd ~/dotfiles/.vim/bundle/
git clone git@github.com:romainl/flattened.git &
git clone git@github.com:vim-syntastic/syntastic.git &
git clone git@github.com:preservim/nerdtree.git &
git clone git@github.com:tpope/vim-surround.git &
git clone git@github.com:tpope/vim-fugitive.git &
git clone git@github.com:vim-airline/vim-airline-themes.git &
git clone  git@github.com:vim-airline/vim-airline.git &
git clone https://github.com/fatih/vim-go.git &
git clone git@github.com:vim-scripts/wombat256.vim.git &
git clone git@github.com:ycm-core/YouCompleteMe.git 
cd YouCompleteMe
git submodule update --init --recursive
./install.py --java-completer --go-completer --js-completer
