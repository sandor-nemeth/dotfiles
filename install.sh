#!/bin/bash

cd $HOME

DOTS=$HOME/dotfiles
ZSH=$HOME/.oh-my-zsh
NVIM=$HOME/.config/nvim

echo "Checking out the dotfiles repository"
git clone --recursive https://github.com/sandor-nemeth/dotfiles.git $DOTS

echo "Install oh-my-zsh with the Pure theme"
if [ ! -d "$ZSH" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed. Skipping"
fi

mkdir -p $ZSH/functions

if [ ! -d "$ZSH/custom/pure" ]; then
    git clone https://github.com/sindresorhus/pure.git $ZSH/custom/pure
    ln -s $ZSH/custom/pure/pure.zsh $ZSH/themes/the-pure.zsh-theme
    ln -s $ZSH/custom/pure/async.zsh $ZSH/functions/async.zsh
else
    echo "pure theme is already installed. Skipping"
fi

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
