[[ -r $ZDOTDIR/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git $ZDOTDIR/znap
source $ZDOTDIR/znap/znap.zsh

zstyle ':znap:*' repos-dir $ZDOTDIR/plugins

znap source olets/zsh-abbr
