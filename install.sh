#!/bin/bash

# Colors for output
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# Track if any changes were made
CHANGES_MADE=0

print_header() {
    printf "\n${BOLD}${MAGENTA}==>${NC} ${BOLD}%s${NC}\n" "$1"
}

print_success() {
    printf "  ${GREEN}✓${NC} %s\n" "$1"
    CHANGES_MADE=1
}

print_info() {
    printf "  ${BLUE}i${NC} %s\n" "$1"
    CHANGES_MADE=1
}

print_warning() {
    printf "  ${YELLOW}!${NC} %s\n" "$1"
    CHANGES_MADE=1
}

CWD="$(pwd)"

# Function to create symlinks idempotently
link_file() {
    local src="$1"
    local dest="$2"
    local name=$(basename "$dest")

    mkdir -p "$(dirname "$dest")"

    if [ -L "$dest" ]; then
        if [ "$(readlink "$dest")" == "$src" ]; then
            return
        else
            [ $CHANGES_MADE -eq 0 ] && print_header "Applying changes"
            print_warning "$name: Updating link"
            rm "$dest"
        fi
    elif [ -e "$dest" ]; then
        [ $CHANGES_MADE -eq 0 ] && print_header "Applying changes"
        print_warning "$name: Backing up existing file to .bak"
        mv "$dest" "$dest.bak"
    fi

    ln -s "$src" "$dest"
    [ $CHANGES_MADE -eq 0 ] && print_header "Applying changes"
    print_success "$name: Linked"
}

# Symlinks
link_file "$CWD/.tmux.conf" "$HOME/.tmux.conf"
link_file "$CWD/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
link_file "$CWD/.config/ghostty/config" "$HOME/.config/ghostty/config"
link_file "$CWD/.config/opencode/opencode.json" "$HOME/.config/opencode/opencode.json"
link_file "$CWD/.claude/settings.json" "$HOME/.claude/settings.json"
link_file "$CWD/.aliases.zsh" "$HOME/.aliases.zsh"
link_file "$CWD/.zshrc" "$HOME/.zshrc"
# Ensure .env.zsh exists from example if not present
if [ ! -f "$CWD/.env.zsh" ]; then
    [ $CHANGES_MADE -eq 0 ] && print_header "Applying changes"
    print_info ".env.zsh: Creating from .env.zsh.example"
    cp "$CWD/.env.zsh.example" "$CWD/.env.zsh"
fi
link_file "$CWD/.env.zsh" "$HOME/.env.zsh"

# Zinit installation
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    [ $CHANGES_MADE -eq 0 ] && print_header "Applying changes"
    print_info "Installing Zinit..."
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" >/dev/null 2>&1
    print_success "Zinit installed"
fi

# Brewfile check
if command -v brew >/dev/null 2>&1 && [ -f "$CWD/Brewfile" ]; then
    if ! brew bundle check --file="$CWD/Brewfile" >/dev/null 2>&1; then
        [ $CHANGES_MADE -eq 0 ] && print_header "Applying changes"
        print_info "Bundling dependencies..."
        brew bundle install --file="$CWD/Brewfile"
        print_success "Homebrew dependencies synced"
    fi
fi

# Aptfile check
if command -v apt-get >/dev/null 2>&1 && [ -f "$CWD/Aptfile" ]; then
    [ $CHANGES_MADE -eq 0 ] && print_header "Applying changes"
    print_info "Installing Ubuntu dependencies..."
    # Filter comments and empty lines, then install
    grep -v '^#' "$CWD/Aptfile" | xargs sudo apt-get install -y
    
    # Python specific LSP installations for Ubuntu
    if command -v pip3 >/dev/null 2>&1; then
        print_info "Installing pyright via pip..."
        pip3 install --user pyright
    fi

    # Check for npm to install bash-language-server if apt package is missing or preferred
    if command -v npm >/dev/null 2>&1; then
        print_info "Ensuring bash-language-server via npm..."
        sudo npm install -g bash-language-server
    fi
    print_success "Ubuntu dependencies installed"
fi

if [ $CHANGES_MADE -eq 1 ]; then
    printf "\n${BOLD}${GREEN}Installation complete!${NC}\n\n"
fi
