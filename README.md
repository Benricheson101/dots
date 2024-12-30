<h1 align="center">MacOS Dotfiles</h1>

![img](/.github/demo.png)

## Software
| **Purpose** | **Software**   |
| ----------- | -------------- |
| Editor      | neovim         |
| Shell       | zsh            |
| Terminal    | Ghostty + tmux |

## Hardware
- 14" 2024 M4 Max Macbook Pro; 64GB, 2TB SSD
- 13" 2020 M1 MacBook Pro; 16GB, 512GB SSD
- Keychron Q4 Pro with Gateron Milky Yellow Pro switches [VIA Keymap](/keyboard/keychron_q4_pro/layout.json)
- Planck V7 with Akko Lavender Purple switches [QMK firmware](https://github.com/Benricheson101/qmk_firmware/blob/master/keyboards/planck/rev7/keymaps/benricheson101)

## Usage
```sh
$ alias dot="git --git-dir=$HOME/.dot/ --work-tree=$HOME"
$ git clone --bare git@github.com:Benricheson101/dots.git $HOME/.dot
$ dot checkout
$ dot config --local status.showUntrackedFiles no
```

## Required Software
- [oxide zsh theme](https://github.com/dikiaap/dotfiles/blob/master/.oh-my-zsh/themes/oxide.zsh-theme)
- [tmux](https://github.com/tmux/tmux)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode)
