#!/bin/zsh

./scripts/setup_symlinks.sh

source ~/.zshrc

# 必要なツールのインストール
# mise-en-place
curl -fsSL https://mise.run | sh
~/.local/bin/mise install

# oh-my-zsh のインストール
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
