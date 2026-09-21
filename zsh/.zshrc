

tmux

eval "$(starship init zsh)"


export PATH="$HOME/.local/bin:$PATH"

py () {
	python3
}

cleard() {
	clear
	echo " "
	fastfetch
}

l() {
	lsd -la
}

cleard
