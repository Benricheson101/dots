local optutil = require('config.util.opt')

if vim.fn.has('termguicolors') then
  optutil.set { termguicolors = true }
end

optutil.let_g {
  mapleader = ' ',
  neovide_cursor_animation_length = 0.05
}

optutil.set {
  guifont = 'FiraCode Nerd Font:h12',
  -- clipboard = 'unnamedplus',

  mouse = 'a',

  cursorline = true,
  cursorcolumn = true,

  number = true,
  relativenumber = true,
  showmode = true,
  autoread = true,
  equalalways = false,
  pumheight = 25,
  scrolloff = 10,

  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,

  ignorecase = true,
  smartcase = true,

  backspace = 'indent,eol,start',

  dir = '/private/tmp',
  backup = true,
  backupdir = '/private/tmp',
  undofile = true,
  undodir = '/private/tmp',

  updatetime = 100,
}

vim.opt.shortmess:append('c')
