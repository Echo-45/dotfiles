


#!/bin/bash

cd ~/.dotfiles

for dir in */; do 
	stow "$dir"
done



