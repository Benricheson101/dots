export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$(/opt/homebrew/bin/go env GOPATH)/bin"
export PATH="$PATH:/opt/homebrew/opt/llvm/bin"

export NVM_DIR="$HOME/.nvm"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export EDITOR="nvim"
export VISUAL="nvim"

. "$NVM_DIR/nvm.sh"
. "$HOME/.cargo/env"
. "$HOME/.env"

alias dot='git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias "reload!"="source ~/.zshenv && source ~/.zshrc"
alias ghci="TERM=dumb ghci"
alias cls="clear"
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"
alias dce="docker-compose exec"
alias p="python3"
alias cat="bat -p"
alias b="/opt/homebrew/bin/bash"
