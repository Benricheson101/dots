export ZSH="/Users/benricheson/.oh-my-zsh"
export GPG_TTY=$(tty)

ZSH_THEME="oxide"

plugins=(
  git
  docker
  docker-compose
)

. "$ZSH/oh-my-zsh.sh"

alias ls="exa"

compdef _curl curlbot
compdef _mkdir mk
compdef _git dot
