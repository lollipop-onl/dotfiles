source <(fzf --zsh)

_fzf_select_cd_path() {
  local p="${LBUFFER##* }"
  local dir
  
  dir=$(find "${p:-.}" \( -type d -o -type f \) 2> /dev/null | fzf --preview 'test -d {} && tree -d -L 3 --gitignore {} || cat {}' --preview-window 'right:70%')

  if [[ -n "$dir" ]]; then
    LBUFFER="${LBUFFER%/*} ${dir}"
  fi
  zle redisplay
}
zle -N _fzf_select_cd_path
bindkey '^t' _fzf_select_cd_path
