#!/bin/zsh

# configs ディレクトリのファイルをホームディレクトリにシンボリックリンクとして配置する
DOTFILES_DIR=$HOME/dotfiles/configs
TARGET_DIR=$HOME

echo "[symlink] Linking dotfiles from $DOTFILES_DIR to $TARGET_DIR..."

find "$DOTFILES_DIR" -type f -print0 | while IFS= read -r -d $'\0' source_path; do
  relative_path=${source_path#"$DOTFILES_DIR/"}
  target_path="$TARGET_DIR/$relative_path"
  target_parent_dir="${target_path:h}"

  if [ ! -d "$target_parent_dir" ]; then
    echo "Creating directory: $target_parent_dir"
    mkdir -p "$target_parent_dir"
  fi

  echo "Linking: $source_path -> $target_path"
  ln -sf "$source_path" "$target_path"
done

echo "[symlink] Dotfiles linking completed."

# 必要なツールのインストール
# mise-en-place
if [ ! -f ~/.local/bin/mise ]; then
  curl -fsSL https://mise.run | sh
else
  echo "[skip] mise is already installed."
fi
~/.local/bin/mise install

# oh-my-zsh のインストール
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "[skip] oh-my-zsh is already installed."
fi
