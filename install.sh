#!/usr/bin/env bash
#
# dot-pub installer
# Installs required dependencies, optional tools, and sets up dotfiles via stow.
# Designed for Linux (Debian/Ubuntu, Arch, Fedora/CentOS) and macOS.
#

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

dotpub_dir=$(cd "$(dirname "$0")" && pwd)

msg()  { echo -e "${BLUE}[dot-pub]${NC} $*"; }
ok()   { echo -e "${GREEN}[✓]${NC}   $*"; }
warn() { echo -e "${YELLOW}[!]${NC}   $*"; }
err()  { echo -e "${RED}[✗]${NC}   $*"; exit 1; }

# ───────────────────────────────────────────────────
#  0. Pre-flight
# ─────────────────────────────────────────────────

# Detect OS/package manager
if [[ -f /etc/os-release ]]; then
    distro=$(. /etc/os-release && echo "$ID")
    if command -v apt &>/dev/null; then
        PKG_MGR="apt"
        PKG_INSTALL="sudo apt install -y"
        PKG_UPDATE="sudo apt update"
    elif command -v pacman &>/dev/null; then
        PKG_MGR="pacman"
        PKG_INSTALL="sudo pacman -S --noconfirm"
        PKG_UPDATE="sudo pacman -Sy"
    else
        err "No supported package manager found."
    fi
else
    err "Unsupported OS."
fi

msg "Detected OS: $(uname -s), Package manager: ${PKG_MGR}"

# Check if already inside .dot-pub
if [[ ! -d "$dotpub_dir/.git" ]]; then
    err "This script must be run from inside a .dot-pub clone."
fi

mkdir -p "$HOME/.local/bin"

# ───────────────────────────────────────────────────
#  Helper: Install a package if missing
# ─────────────────────────────────────────────────

pkg_install_if_missing() {
    local pkg="$1"
    if command -v "$pkg" &>/dev/null; then
        ok "$pkg is already installed"
        return 0
    fi
    msg "Installing $pkg..."
    $PKG_UPDATE
    $PKG_INSTALL "$pkg"
    ok "$pkg installed"
}

snap_install_if_missing() {
    local pkg="$1"
    if command -v "$pkg" &>/dev/null; then
        ok "$pkg is already installed"
        return 0
    fi
    msg "Installing $pkg..."
    snap update
    snap install "$pkg"
    ok "$pkg installed"
}

# ───────────────────────────────────────────────────
#  1. Required packages (always installed)
# ─────────────────────────────────────────────────

msg ""
msg "───────────────────────────────────────────────────"
msg "PHASE 1: Required packages"
msg "───────────────────────────────────────────────────"

pkg_install_if_missing stow
pkg_install_if_missing tmux
pkg_install_if_missing zsh
pkg_install_if_missing eza
pkg_install_if_missing git
pkg_install_if_missing curl
if command -v snap &>/dev/null; then
    snap_install_if_missing nvim
else
    pkg_install_if_missing neovim
fi

# oh-my-posh: install from official installer
if ! command -v oh-my-posh &>/dev/null; then
    msg "Installing oh-my-posh via official installer..."
    curl -s https://ohmyposh.dev/install.sh | bash -s
    ok "oh-my-posh installed to ~/.local/bin"
else
    ok "oh-my-posh is already installed"
fi

# ───────────────────────────────────────────────────
#  2. Install node.js if not present (from official)
# ─────────────────────────────────────────────────

msg ""
msg "───────────────────────────────────────────────────"
msg "PHASE 2: Node.js (from official installer)"
msg "(skipped if node is already present)"
msg "───────────────────────────────────────────────────"

if ! command -v node &>/dev/null; then
    msg "node.js not found — installing from nodesource..."
    if [[ "$PKG_MGR" == "apt" ]]; then
        curl -fsSL https://deb.nodesource.com/setup_26.x | sudo -E bash -
        $PKG_INSTALL nodejs
    elif [[ "$PKG_MGR" == "pacman" ]]; then
        # Arch has nodejs available
        if [[ -z "$(pacman -Qs '^nodejs$' 2>/dev/null)" ]]; then
            sudo pacman -S --noconfirm nodejs npm
            ok "nodejs installed from pacman"
        fi
    fi

    if command -v node &>/dev/null; then
        ok "Node.js installed $(node --version)"
    fi
else
    warn "Node.js already installed: $(node --version)"
fi

# ───────────────────────────────────────────────────
#  3. Optional: extra repos to download to ~/.local/bin
# ─────────────────────────────────────────────────

read -rp "Download 'repo'? [y/N]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.local/bin/repo
else
    warn "Skipping extra repos."
fi

# Define repos here — these will be cloned to ~/.local/bin
ALL_REPOS=(
    # "https://github.com/some/project.git"
)

msg ""
msg "───────────────────────────────────────────────────"
msg "PHASE 3: Extra repos/binaries (optional)"
msg "───────────────────────────────────────────────────"

if [[ ${#ALL_REPOS[@]} -gt 0 ]]; then
    read -rp "Download ${#ALL_REPOS[@]} repo(s) to ~/.local/bin? [y/N]: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        for repo in "${ALL_REPOS[@]}"; do
            name=$(basename "$repo" .git)
            if [[ -d "$HOME/.local/bin/$name" ]]; then
                warn "$name already exists in ~/.local/bin"
                continue
            fi
            msg "Cloning $repo..."
            git clone --depth=1 "$repo" "$HOME/.local/bin/$name"
            ok "$name downloaded to ~/.local/bin/$name"
        done
    else
        warn "Skipping extra repos."
    fi
else
    warn "No extra repos defined. Add URLs to ALL_REPOS array in install.sh"
fi

# ───────────────────────────────────────────────────
#  4. Symlink dotfiles with stow
# ─────────────────────────────────────────────────

msg ""
msg "───────────────────────────────────────────────────"
msg "PHASE 4: Symlinking dotfiles with stow..."
msg "───────────────────────────────────────────────────"

stow -n . 2>&1 | grep -i warn || true
stow .
ok "Dotfiles symlinked"

# ─────────────────────────────────────────────────────
msg ""
msg "══════════════════════════════════════════════════════="
msg "Setup complete!"
msg "══════════════════════════════════════════════════════="
msg ""
msg "📦 Installed:"
msg "  Required: zsh, neovim, eza, oh-my-posh → ~/.local/bin"
msg "  Node.js installed: $(node --version 2>/dev/null || echo 'skipped')"
msg ""
msg "🏠 Dotfiles managed by stow."
msg ""
msg "⚙️ NEXT STEPS:"
msg "  - Switch shell: chsh -s \\$(which zsh)"
msg "  - Start nvim:   nvim"
msg "  - Install plugins: nvim +LazySync"
msg ""
msg "📁 PATH includes ~/.local/bin (oh-my-posh & extras)."
