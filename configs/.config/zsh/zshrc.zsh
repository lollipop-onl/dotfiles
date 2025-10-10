source ~/.zshenv

# ローカル設定ファイルを読み込む
if [ -f $ZDOTDIR/zshrc.local.zsh ]; then
  . $ZDOTDIR/zshrc.local.zsh
fi

# mise-en-place
eval "$(~/.local/bin/mise activate zsh)"

# fzf
source <(fzf --zsh)

# znap
source $ZDOTDIR/znap.zsh