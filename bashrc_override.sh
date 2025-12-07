function fo {
  local dir="${1:-.}"

  rg --files --hidden --glob '!.git/*' "$dir" |
    fzf --ansi \
        --preview 'bat --style=numbers --color=always --line-range=:300 {}' \
        --preview-window=right:60% \
        --bind 'enter:execute(nvim {})+abort'
}

alias window="sleep 2 && hyprctl activewindow -j | jq -r '.class'"
alias calendar="lvsk-calendar"
