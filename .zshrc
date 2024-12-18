# Created by newuser for 5.9

# Add snap to the PATH
export PATH=$PATH:/snap/bin
export VISUAL=nvim
export EDITOR="$VISUAL"
export CDPATH=".:..:$HOME"

# Set the directory for the zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

# Download and install zinit
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "$ZINIT_HOME/zinit.zsh"
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

zinit ice depth=1;

# Add in zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Add in zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Add in zsh-completions
zinit light zsh-users/zsh-completions

# zsh vi mode
zinit light jeffreytse/zsh-vi-mode

# Load autocomplete
autoload -U compinit && compinit

# oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/pure.omp.json)"

# add .bash_aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
