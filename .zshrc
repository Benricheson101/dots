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
setopt listpacked

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

autoload -U {up,down}-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -U compinit && compinit -C
autoload -Uz nvm mk

KEYTIMEOUT=1
bindkey -v
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search
bindkey '^D' vi-delete-char
bindkey '^?' backward-delete-char
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
  /opt/homebrew//opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
)

for plugin ($plugins) do
  [ -f "$plugin" ] && . "$plugin"
done
