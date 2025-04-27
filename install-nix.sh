#!/bin/sh
set -e

echo "🚀 Installing Nix Package Manager..."

# Install Nix in multi-user daemon mode
curl -L https://nixos.org/nix/install | sh -s -- --daemon

echo "✅ Nix installed."

# Create nix.conf and enable flakes
echo "🔧 Configuring Nix experimental features (flakes)..."

mkdir -p ~/.config/nix
if ! grep -q "experimental-features" ~/.config/nix/nix.conf 2>/dev/null; then
  echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
fi

echo "✅ Flakes enabled."

# Source Nix profile (works for most shells, including bash, zsh, fish via POSIX)
if [ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
elif [ -f /etc/profile.d/nix.sh ]; then
  . /etc/profile.d/nix.sh
fi

echo "✅ Nix environment loaded."

# Install Home Manager
echo "📦 Installing Home Manager into user profile..."

nix profile install github:nix-community/home-manager

echo "✅ Home Manager installed."

echo ""
echo "🎉 Installation complete!"
echo "You can now run:"
echo "    home-manager switch --flake /path/to/your/flake#your-hostname"
echo ""
echo "⚡ If you open a new terminal, everything will be ready."
