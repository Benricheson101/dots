export PNPM_HOME="$HOME/Library/pnpm"
export ASDF_DATA_DIR="$HOME/.asdf"

typeset -U FPATH fpath
typeset -U PATH path

path=(
  $HOME/scripts
  $HOME/.local/bin
  $HOME/Library/pnpm
  $HOME/go
  $HOME/.pyenv/shims
  $HOME/.cargo/bin
  $ASDF_DATA_DIR/shims
  /Applications/Ghostty.app/Contents/MacOS
  $HOIME/Library/Application\ Support/JetBrains/Toolbox/scripts
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /opt/homebrew/opt/make/libexec/gnubin
  /opt/homebrew/opt/openjdk/bin
  /usr/local/bin
  /opt/homebrew/opt/rustup/bin
  /opt/homebrew/opt/libpq/bin
  /opt/homebrew/opt/mysql-client/bin
  /opt/homebrew/opt/llvm/bin
  /opt/homebrew/opt/sqlite/bin
  $path
)

fpath+=(
  $HOME/.local/share/zsh/completion
  /opt/homebrew/share/zsh/site-functions
  $HOME/.local/share/zsh/functions
  $HOME/scripts/functions
)

export path
export fpath
export PATH
export FPATH

export NVM_DIR="$HOME/.nvm"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export HOMEBREW_NO_ANALYTICS=1

. "$HOME/.env"

export PAGER=less
export LESS='--mouse --wheel-lines 3 -R'
export EDITOR=nvim
export VISUAL=nvim

alias 'reload!'='source ~/.zshenv && source ~/.zshrc && rm -i ~/.zcompdump && compinit'
alias b='brew'
alias bi='brew install'
alias bu='brew uninstall'
alias bz='bazel'
alias c='cargo'
alias cat='bat -p --theme Nord'
alias cl='clear'
alias d='docker'
alias dc='docker compose'
alias dce='docker compose exec'
alias dcu='docker compose up'
alias dcub='docker compose up --build'
alias dot='git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias f=flux
alias gb='go build'
alias ghci='TERM=dumb ghci'
alias gd='git diff'
alias gl='git log'
alias gr='git rebase'
alias gs='git switch'
alias gst='git status'
alias j='just'
alias k='kubectl'
alias la='eza -a'
alias n='node'
alias nv='neovide'
alias p='python3'
alias pn='pnpm'
alias sc='sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g"'
alias t=tmux
alias tf=terraform
alias vim='nvim'
alias y='yarn'
alias ya='yarn add'
alias yw='yarn workspaces'

alias cb="cargo build"
alias cbr="cargo build --release"
alias cr="cargo run -q --"
alias crr="cargo run --release -q --"
alias ct="cargo test"
alias ctr="cargo test --release"
alias cf="cargo +nightly fmt --all"

alias gcc="gcc-15"
alias g++="g++-15"

alias gc='git commit'
alias gcam='git commit -am'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias gp='git push'

alias bu='brew update && brew upgrade'

for n in {3..6} ; do
  alias "$(printf '.%.s' {1..$n})"="cd $(printf '../%.s' {2..$n})"
done
