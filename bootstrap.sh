#!/bin/bash

# Taken from https://github.com/mattjmorrison/dotfiles

#==============
# Install or update Homebrew
#==============
which -s brew
if [[ $? != 0 ]]; then
  sudo chown -R $(whoami):admin /usr/local
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";
fi;

#=============
# Install Oh My Zsh
#=============
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#==============
# Install all the packages
#==============
brew doctor
brew update
brew upgrade

#==============
# Remove old dot files
#==============
sudo rm -rf ~/.bash_profile > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.exports > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.inputrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/Brewfile > /dev/null 2>&1

#==============
# Create symlinks in the home folder
#==============

SYMLINKS=()
ln -sf ~/dotfiles/aliases ~/.aliases
SYMLINKS+=('.aliases')
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
SYMLINKS+=('.bash_profile')
ln -sf ~/dotfiles/bashrc ~/.bashrc
SYMLINKS+=('.bashrc')
ln -sf ~/dotfiles/exports ~/.exports
SYMLINKS+=('.exports')
ln -sf ~/dotfiles/inputrc ~/.inputrc
SYMLINKS+=('.inputrc')
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
SYMLINKS+=('.tmux.conf')
ln -sf ~/dotfiles/zshrc ~/.zshrc
SYMLINKS+=('.zshrc')
ln -sf ~/dotfiles/Brewfile ~/Brewfile
SYMLINKS+=('Brewfile')

#==============
# Vim setup
#==============
# normal Vim backup (use Neovim instead)
# ln -sf ~/dotfiles/vim ~/.vim
# SYMLINKS+=('.vim')
# ln -sf ~/dotfiles/vimrc ~/.vimrc
# SYMLINKS+=('.vimrc')

mkdir -p ~/.config/nvim

ln -sf ~/dotfiles/vimrc ~/.config/nvim/init.vim
SYMLINKS+=('init.vim')

echo ${SYMLINKS[@]}

#==============
# Install Brewfile plugins
#==============

cd ~
brew bundle
brew cleanup
cd -

#==============
# tmux TPM installation
#==============
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#==============
# And we are done
#==============
echo -e "\n====== All Done!! ======\n"

