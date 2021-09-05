#!/bin/zsh

DOTS=$PWD
ZSH=$HOME/.oh-my-zsh
NVIM=$HOME/.config/nvim

# Check if homebrew is available
if ! (( $+commands[brew] )); then
    echo "Installing homebrew from https://brew.sh"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install the bundle command for homebrew
brew tap Homebrew/bundle

echo "## Running brew bundle"
brew bundle

echo "## Configuring Alacritty"
rm -rf $HOME/.config/alacritty/alacritty.yml
mkdir -p $HOME/.config/alacritty/
ln -s $DOTS/alacritty/alacritty.yml $HOME/.config/alacritty/
echo "## Alacritty configuration completed"
echo "##"

echo "## Configuring ZSH"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
        && echo "## .. oh-my-zsh installation successful"
else 
    echo "## .. oh-my-zsh is already installed"
fi

if [ ! -f "$ZSH/custom/themes/spaceship.zsh-theme" ]; then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH/custom/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/custom/themes/spaceship.zsh-theme"
    echo "## .. downloaded the Spaceship prompt"
fi

rm -rf $HOME/.zshrc
ln -s $DOTS/zsh/zshrc $HOME/.zshrc
echo "## .. zsh configuration reloaded"
echo "## ZSH configuration successful"
echo "##"
echo "## Please reload your ZSH configuration using:"
echo "##     source ~/.zshrc"
echo "##"

echo "## Configuring tmux"
rm -rf $HOME/.tmux.conf 
ln -s $DOTS/tmuxconfig/tmux.conf $HOME/.tmux.conf
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm  
fi
echo "## tmux configuration completed"

echo "## Configuring nvim"
mkdir -p $NVIM
rm -rf $NVIM/init.nvim
ln -s $DOTS/nvim/init.vim $NVIM/init.vim
nvim +PlugInstall +qall
echo "## nvim configuration completed"
