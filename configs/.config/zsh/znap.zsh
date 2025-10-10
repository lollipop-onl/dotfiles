ZNAPDIR=$XDG_CONFIG_HOME/zsh-snap

[[ -r $ZNAPDIR/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git $ZNAPDIR
source $ZNAPDIR/znap.zsh

znap prompt sindresorhus/pure
znap source rupa/z
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source catppuccin/zsh-syntax-highlighting themes/catppuccin_latte-zsh-syntax-highlighting.zsh
znap source ohmyzsh/ohmyzsh plugins/command-not-found
znap source olets/zsh-abbr
znap source azu/ni.zsh