#!/usr/bin/env bash
# Bootstrap this Neovim config on a fresh Linux container (e.g. a blank RunPod pod).
set -euo pipefail

apt-get update
apt-get install -y git curl build-essential unzip ripgrep fd-find nodejs npm python3-pip

if ! command -v nvim >/dev/null 2>&1; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    tar xzf nvim-linux-x86_64.tar.gz -C /opt
    ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
    rm nvim-linux-x86_64.tar.gz
fi

if [ ! -d "$HOME/.config/nvim" ]; then
    git clone https://github.com/quickwing/nvim-config "$HOME/.config/nvim"
fi

nvim --headless "+Lazy! sync" +qa

echo "Done. Run 'nvim' to start. Set OPENAI_API_KEY for codecompanion.nvim AI features."
