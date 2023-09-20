<h1 align="center">MacOS Dotfiles</h1>

## Software
| **Purpose** | **Software** |
| ----------- | ------------ |
| Editor      | Neovide      |
| Shell       | zsh          |
| Terminal    | iTerm2       |

## Hardware
- 13" 2020 M1 MacBook Pro; 16GB, 512GB SSD
- 12.9" M2 iPad Pro

## Usage
```sh
$ echo 'alias dot="git --git-dir=$HOME/.dot.git/ --work-tree=$HOME"' >> $HOME/.zshenv
$ source ~/.zshenv
$ git clone --bare git@github.com:Benricheson101/dots.git $HOME/.dot.git
$ dot checkout
$ dot config --local status.showUntrackedFiles false
```
