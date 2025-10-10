# ローカル設定ファイルを読み込む
if [ -f $ZDOTDIR/zshrc.local.zsh ]; then
  . $ZDOTDIR/zshrc.local.zsh
fi

# 補完
autoload -Uz compinit && compinit -C

# Powerlevel10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# mise-en-place
eval "$(~/.local/bin/mise activate zsh)"

# fzf
source <(fzf --zsh)

# znap
source $ZDOTDIR/znap.zsh