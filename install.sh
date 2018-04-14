#!/bin/bash

cd $HOME

echo "Downloading Oh-My-Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ZSH=$HOME/.oh-my-zsh

echo "Installing ZSH theme: Pure"
mkdir $ZSH/functions
git clone https://github.com/sindresorhus/pure.git $ZSH/custom/pure
ln -s $ZSH/custom/pure/pure.zsh $ZSH/themes/the-pure.zsh-theme
ln -s $ZSH/custom/pure/async.zsh $ZSH/functions/async.zsh

echo "Checking out the dotfiles repository"
DOTS=$HOME/dotfiles
git clone --recursive https://github.com/sandor-nemeth/dotfiles.git $DOTS

echo "Creating symlinks"
rm -rf $HOME/.zshrc || ln -s $DOTS/zsh/zshrc $HOME/.zshrc
ln -s tmuxconfig/.tmux.conf
