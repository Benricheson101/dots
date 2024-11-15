<h1 align="center">MacOS Dotfiles</h1>

![img](/.github/demo.png)

## Software
| **Purpose** | **Software**   |
| ----------- | -------------- |
| Editor      | neovim         |
| Shell       | zsh            |
| Terminal    | Ghostty + tmux |

## Hardware
- 13" 2020 M1 MacBook Pro; 16GB, 512GB SSD
- Keychron Q4 Pro with Gateron Milky Yellow Pro switches [VIA Keymap](/keyboard/keychron_q4_pro/layout.json)
- Planck V7 with Akko Lavender Purple switches [QMK firmware](https://github.com/Benricheson101/qmk_firmware/blob/master/keyboards/planck/rev7/keymaps/benricheson101)

## Usage
```sh
$ alias dot="git --git-dir=$HOME/.dot/ --work-tree=$HOME"
$ source ~/.zshenv
$ git clone --bare git@github.com:Benricheson101/dots.git $HOME/.dot
$ dot checkout
$ dot config --local status.showUntrackedFiles false
```
