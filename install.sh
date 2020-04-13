#!/bin/bash

cd $HOME

DOTS=$HOME/dotfiles
ZSH=$HOME/.oh-my-zsh
NVIM=$HOME/.config/nvim

echo "Checking out the dotfiles repository"
git clone --recursive https://github.com/sandor-nemeth/dotfiles.git $DOTS

# install zsh theme aphrodite
# source: https://github.com/win0err/aphrodite-terminal-theme
echo "Installing and configuring ZSH theme"
mkdir -p ~/.oh-my-zsh/custom/themes/
wget -xqO ~/.oh-my-zsh/custom/themes/aphrodite.zsh-theme https://git.io/v5ohc
sed -i.bak 's/^[[:space:]]*ZSH_THEME=.*/ZSH_THEME="aphrodite"/' ~/.zshrc
source ~/.zshrc 


echo "Installation successful, sourcing $HOME/.zshrc"
rm -rf $HOME/.zshrc || ln -s $DOTS/zsh/zshrc $HOME/.zshrc
source ~/.zshrc

echo "Set up nvim"
mkdir -p $NVIM
rm -rf $NVIM/init.nvim || ln -s $DOTS/nvim/init.vim $NVIM/init.vim
nvim +PlugInstall +qall

echo "Downloading tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm -rf $HOME/.tmux.conf || ln -s $DOTS/tmuxconfig/tmux.conf $HOME/.tmux.conf

echo "Installing additional packages"
pip install --user jedi
