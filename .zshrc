export ZSH="/Users/benricheson/.oh-my-zsh"
export GPG_TTY=$(tty)

ZSH_THEME="oxide"

plugins=(
  git
  docker
  docker-compose
  zsh-syntax-highlighting
  # zsh-vi-mode
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

unalias run-help
autoload run-help
HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
alias help=run-help

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
