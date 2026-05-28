# AGENTS.md

## Repo
Public dotfiles managed with GNU Stow. Remote: `git@github.com:nils-trubkin/dot-pub.git`

## Commands
- `stow .` — deploy all dotfiles to home directory
- `stow -D .` — remove deployed symlinks
- All files in the repo are dropped into `$HOME` by Stow. Stow symlinks match filenames (e.g. `.zshrc` → `~/.zshrc`).

## Structure
- `.zshrc` — shell config; uses **zinit** (not oh-my-zsh) for plugin management
- `.tmux.conf` — tmux config; TPM manages plugins (`:TMXInstall` to bootstrap)
- `.config/nvim/` — Neovim; **lazy.nvim** with each plugin in its own file under `lua/plugins/`
- `.config/ohmyposh/` — Oh My Posh prompt theme (`base.toml` + `pure.omp.json`)

## Neovim
Plugins are in `lua/plugins/*.lua`, each a Lua module with an `M.setup()` function or direct config. Run `:Lazy` or `:Lazy sync` to manage them.

## Zsh
Zinit installs itself on first load. Plugins: syntax-highlighting, autosuggestions, completions, vi-mode. Prompt is Oh My Posh.

## Tmux
Prefix is `C-s` (not C-b). TPM plugins installed via Prefix + `I`. Reload config with `r` (unbind from default `Prefix + r`).
