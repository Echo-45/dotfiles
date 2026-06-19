


#!/bin/bash



stowing() {
    cd ~/.dotfiles
    for dir in */; do 
	    stow "$dir"
    done
}


# Check for Package manager

echo "==========================================="
echo "===== What pkg manager is installed? ======"
echo "==========================================="

read -r PkgMgr

case "$PkgMgr" in 
    apt)    installedPkgMgr="apt install" ;;
    brew)   installedPkgMgr="brew install" ;;
    pacman) installedPkgMgr="pacman -S" ;;
    *)      echo "Unknown pkg mgr"; exit ;;
    
esac


# Packages to install

packages=(
    stow
    tmux
    starship
    zsh
    neovim
    npm
    tree-sitter-cli
    kitty
    aacritty
)

echo "==========================================="
echo "========= Installing packages... =========="
echo "==========================================="

#for pkg in "${packages[@]}"; do
#	$installedPkgMgr "$pkg"
#done


echo "==========================================="
echo "========== Stowing dotfiles... ============"
echo "==========================================="


read -r -p "Continue? (y/n/skip): " CONFIRM

case "$CONFIRM" in
    y|Y) echo "Continuing..."
    stowing
    ;;
    n|N) echo "Aborting."; exit 1 ;;
    skip|s|S) echo "Skipping." ;;
    *) echo "Invalid input."; exit 1 ;;
esac



echo "Done!!"

