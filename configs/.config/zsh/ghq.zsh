gclone() {
  ghq get $(
    gh api --paginate /user/repos --jq '.[].clone_url' \
      | fzf --prompt='Select repository to clone: ' --query "${1:-}" 
  )
}

grepo() {
  cd $(
    ghq root
  )/$(
    ghq list | fzf --prompt='Select repository: ' --query "${1:-}"
  )
}

gsync() {
  ghq get -u $(
    ghq list | fzf --prompt='Select repository: ' --query "${1:-}"
  )
}

gw() {
  case "$1" in
    add)
      gwq add $(
        git branch -a \
          | sed 's/remotes\/[^\/]*\///g' \
          | fzf --ansi \
                --no-sort \
                --reverse \
                --prompt="Checkout branch: " \
                --query "${2:-}"
      )
      ;;
    *)
      cd $(
        gwq list --json \
          | jq -r '.[].path' \
          | fzf --prompt='Select worktree: ' --query "${1:-}"
      )
      ;;
  esac
}