




export ZSH="/Users/benricheson/.oh-my-zsh"
# export PATH="$(pyenv root)/shims:$PATH"
export GPG_TTY=$(tty)

ZSH_THEME="oxide"

plugins=(
  git
  docker
  docker-compose
)

. "$ZSH/oh-my-zsh.sh"

alias ls="exa"

# sourcing mk instead of adding it to path so it is able to change
# the directory when the command is run. for some reason it does not
# work the same way that other scripts in ~/scripts work.
. ~/scripts/_mk

compdef _curl curlbot
compdef _mkdir mk
compdef _git dot

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"





