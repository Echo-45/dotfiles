


#!/bin/bash

# Check for Package manager

if command -v brew &> /dev/null; then
    INSTALL="brew install"
elif command -v apt &> /dev/null; then
    INSTALL="sudo apt install -y"
elif command -v pacman &> /dev/null; then
    INSTALL="sudo pacman -S"
elif command -v dnf &> /dev/null; then
    INSTALL="sudo dnf install -y"
else
    echo "No supported package manager found"
    exit 1
fi

# Packages to install

packages=(
    stow
    tmux
    starship
    zsh
    neovim
)

echo "Installing packages..."
for pkg in "{$packages[@]}"; do
	$INSTALL "$pkg"
done

# Checking for allready existing .zshrc
#
if [ -f ~/.zshrc ]; then
    cat ~/.zshrc >> ~/.dotfiles/zsh/.zshrc
    rm ~/.zshrc
fi

echo "Stowing dotfiles..."
cd ~/.dotfiles

for dir in */; do 
	stow "$dir"
done

echo "Done!!"

