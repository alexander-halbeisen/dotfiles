#!/usr/bin/env zsh

echo "Setting up work zsh environment..."

# Path to Oh My Zsh
ZSH_DIR="$HOME/.oh-my-zsh"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH_DIR/custom}"

# --- Install Oh My Zsh ---
if [ ! -d "$ZSH_DIR" ]; then
    echo "Installing Oh My Zsh..."
    rm -rf "$ZSH_DIR"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/install/master/install.sh)" "" --unattended

    # Fallback: clone directly if installer failed
    if [ ! -f "$ZSH_DIR/oh-my-zsh.sh" ]; then
        echo "Unattended install failed, cloning manually..."
        git clone https://github.com/ohmyzsh/ohmyzsh.git "$ZSH_DIR"
    fi
else
    echo "Oh My Zsh is already installed."
fi

# --- Verify installation ---
if [ ! -f "$ZSH_DIR/oh-my-zsh.sh" ]; then
    echo "Error: Oh My Zsh installation failed. $ZSH_DIR/oh-my-zsh.sh not found."
    exit 1
fi

# --- Install Powerlevel10k theme ---
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
    echo "Powerlevel10k theme is already installed."
fi

# --- Install zsh-autosuggestions ---
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions plugin is already installed."
fi

# --- Install zsh-syntax-highlighting ---
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting plugin is already installed."
fi

# --- Install thefuck (via Homebrew) ---
if ! command -v thefuck &>/dev/null; then
    if command -v brew &>/dev/null; then
        echo "Installing thefuck..."
        brew install thefuck
    else
        echo "Warning: Homebrew not found. Please install thefuck manually or run your main setup script first."
    fi
else
    echo "thefuck is already installed."
fi

echo "Zsh setup complete!"


