#!/usr/bin/env zsh

echo "Setting up work zsh environment..."

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/install/master/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

# Set ZSH_CUSTOM path
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install Powerlevel10k theme if not already installed
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
    echo "Powerlevel10k theme is already installed."
fi

# Install zsh-autosuggestions plugin if not already installed
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions plugin is already installed."
fi

# Install zsh-syntax-highlighting plugin if not already installed
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting plugin is already installed."
fi

# Install thefuck if not already installed (using Homebrew)
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

echo ""
echo "Zsh setup complete!"
echo ""
echo "Next steps:"
echo "1. Copy your .zshrc configuration to ~/.zshrc"
echo "2. Restart your terminal or run: source ~/.zshrc"
echo "3. Run 'p10k configure' to set up Powerlevel10k theme"
echo ""
