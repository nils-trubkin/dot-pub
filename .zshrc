# Created by newuser for 5.9

# Add snap to the PATH
export PATH=$PATH:/snap/bin

# Set the directory for the zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

# Download and install zinit
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "$ZINIT_HOME/zinit.zsh"

zinit ice depth=1;

# Add in zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Add in zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Add in zsh-completions
zinit light zsh-users/zsh-completions

# zsh vi mode
zinit light jeffreytse/zsh-vi-mode

# set s-prefix for vi mode
ZVM_VI_SURROUND_BINDKEY=s-prefix

# Load autocomplete
autoload -U compinit && compinit

# oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/pure.omp.json)"

# add .bash_aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

