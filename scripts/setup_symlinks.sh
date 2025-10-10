echo "--- DIRECTORY SETUP AND SYMLINK CREATION ---"

# configs ディレクトリのファイルをホームディレクトリにシンボリックリンクとして配置する
DOTFILES_DIR=$HOME/dotfiles/configs
TARGET_DIR=$HOME

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

echo "DONE."