#!/usr/bin/env zsh

echo "Setting up work development environment..."

# Install Homebrew if it isn't already installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Set up Homebrew PATH for Apple Silicon Mac
    echo "Configuring Homebrew in PATH..."
    export PATH="/opt/homebrew/bin:$PATH"
else
    echo "Homebrew is already installed."
fi

# Verify brew is now accessible
if ! command -v brew &>/dev/null; then
    echo "Failed to configure Homebrew in PATH. Please add Homebrew to your PATH manually:"
    echo "export PATH=\"/opt/homebrew/bin:\$PATH\""
    exit 1
fi

# Update Homebrew and Upgrade any already-installed formulae
echo "Updating Homebrew..."
brew update
brew upgrade
brew cleanup

echo "Homebrew setup complete!"
echo ""
echo "Next steps:"
echo "1. Run ./work-zsh-setup.sh to set up your terminal environment"
echo "2. Copy .zshrc to your home directory"
echo "3. Install additional tools as needed with: brew install <package>"
