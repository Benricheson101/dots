export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/scripts"
# export PATH="$PATH:$(/opt/homebrew/bin/go env GOPATH)/bin"
export PATH="$PATH:$(/usr/local/go/bin/go env GOPATH)/bin" # TODO: reinstall go with homebrew once it has 1.18
export PATH="$PATH:/opt/homebrew/opt/llvm/bin"
export PATH="$(/opt/homebrew/bin/pyenv root)/shims:$PATH"
export FPATH="$(/opt/homebrew/bin/brew --prefix)/share/zsh/site-functions:${FPATH}"

export NVM_DIR="$HOME/.nvm"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export EDITOR="nvim"
export VISUAL="nvim"

. "$NVM_DIR/nvm.sh"
. "$HOME/.cargo/env"
. "$HOME/.env"

alias 'reload!'='source ~/.zshenv && source ~/.zshrc'
alias b='/opt/homebrew/bin/bash'
alias cat='bat -p'
alias cls='clear'
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dcu='docker-compose up'
alias dcub='docker-compose up --build'
alias dot='git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias g='go'
alias gb='go build'
alias ghci='TERM=dumb ghci'
alias gr='go run'
alias n='node'
alias p='python3'
alias sc='sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g"'
alias y='yarn'
alias ya='yarn add'
alias yw='yarn workspaces'

alias cb="cargo build"
alias cbr="cargo build --release"
alias cr="cargo run -q --"
