# ローカル設定ファイルを読み込む
if [ -f $ZDOTDIR/zshrc.local.zsh ]; then
  . $ZDOTDIR/zshrc.local.zsh
fi

autoload -Uz compinit && compinit -C
autoload -U promptinit && promptinit

# mise-en-place
eval "$(~/.local/bin/mise activate zsh)"

# fzf
source $ZDOTDIR/fzf.zsh

# ghq
source $ZDOTDIR/ghq.zsh

# znap
source $ZDOTDIR/znap.zsh

# 設定
setopt AUTO_CD
setopt CORRECT
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
