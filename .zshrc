stty -ixon

zmodload zsh/complist

HISTFILE=/Users/benricheson/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

setopt alwaystoend
setopt appendhistory
setopt autocd
setopt extendedglob
setopt extendedhistory
setopt histfindnodups
setopt histignorealldups
setopt histignoredups
setopt histsavenodups
setopt incappendhistory
setopt nocaseglob

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' complete-options true
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path ~/.cache/zsh/.zcompcache
zstyle ':completion:*' group-name ''
zstyle ':completion:*' complete-options true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %d --%f'

autoload -U compinit && compinit -C
autoload -Uz nvm mk

bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^D' vi-delete-char
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

export GPG_TTY=$(tty)

alias ls="exa"

compdef _curl curlbot
compdef _mkdir mk
compdef _git dot

autoload run-help
HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
alias help=run-help

# third-party plugins
plugins=(
  $HOME/.local/share/zsh/themes/oxide.zsh-theme
  /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
)

for plugin ($plugins) do
  [ -f "$plugin" ] && . "$plugin"
done
