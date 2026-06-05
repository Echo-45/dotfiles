


#!/bin/bash

# Check for Package manager

if command -v brew &> /dev/null; then
    INSTALL="brew install"
    pkgMgr="brew"
elif command -v apt &> /dev/null; then
    INSTALL="sudo apt install -y"
    pkgMgr="apt"
elif command -v pacman &> /dev/null; then
    INSTALL="sudo pacman -S"
    pkgMgr="pacman"
elif command -v dnf &> /dev/null; then
    INSTALL="sudo dnf install -y"
    pkgMgr="dnf"
else
    echo "No supported package manager found"
    exit 1
fi

echo "=== " "$pkgMgr" "found" " ==="

# Packages to install

packages=(
    stow
    tmux
    starship
    zsh
    neovim
)

echo "Installing packages..."
for pkg in "${packages[@]}"; do
	$INSTALL "$pkg"
done


echo "Stowing dotfiles..."
cd ~/.dotfiles

for dir in */; do 
	stow "$dir"
done

echo "Done!!"

