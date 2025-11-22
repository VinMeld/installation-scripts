
function fo {
  rg --files --hidden --glob '!.git/*' |
  fzf --ansi \
      --preview 'bat --style=numbers --color=always --line-range=:300 {}' \
      --preview-window=right:60% \
      --bind 'enter:execute(nvim {})+abort'
}
