<h1 align="center">MacOS Dotfiles</h1>

## Software
| **Purpose** | **Software**   |
| ----------- | -------------- |
| Editor      | neovim         |
| Shell       | zsh            |
| Terminal    | Ghostty + tmux |

## Hardware
- 13" 2020 M1 MacBook Pro; 16GB, 512GB SSD

## Usage
```sh
$ alias dot="git --git-dir=$HOME/.dot/ --work-tree=$HOME"
$ source ~/.zshenv
$ git clone --bare git@github.com:Benricheson101/dots.git $HOME/.dot
$ dot checkout
$ dot config --local status.showUntrackedFiles false
```
