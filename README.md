# dot-pub
publicly available dotfiles for my personal use

## Requirements
- [GNU Stow](https://www.gnu.org/software/stow/)
- [Zsh](https://www.zsh.org/)
- [Oh My Posh](https://ohmyposh.dev/)
- [neovim](https://neovim.io/)

## Installation
### Install requirements
```bash
sudo apt install stow zsh neovim
```
### Install Oh My Posh
```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```
or alternatively to install it to a custom directory
```bash
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
```
### Clone and install dotfiles
```bash
git clone git@github.com:nils-trubkin/dot-pub.git ~/.dot-pub
cd ~/.dot-pub
stow .
```

## Uninstallation
```bash
cd ~/.dot-pub
stow -D .
cd
rm -rf ~/.dot-pub
```
uninstall Oh My Posh by removing the installation directory
```bash
rm -rf ~/.local/bin/oh-my-posh
```

## License
Feel free to use and modify these dotfiles as you see fit. No warranty is provided.

## Author
Nils Trubkin
