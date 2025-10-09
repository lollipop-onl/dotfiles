# ローカル設定ファイルを読み込む
if [ -f ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi

# mise の遅延ロード
# https://zenn.dev/euxn23/articles/8cf91b768b46b3
mise () {
    set -o pipefail

    command mise activate zsh | {
        eval "$(cat)"
        unset -f mise
        command mise "$@"
    } || return $?
}
