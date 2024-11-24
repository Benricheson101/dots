local opt = require('util.opt')

if vim.fn.has('termguicolors') then
  opt.set {termguicolors = true}
end

vim.cmd.colors('habamax')

opt.g {
  mapleader = ' ',
  neovide_cursor_animation_length = 0.05,
  neovide_scroll_animation_length = 0,
  neovide_position_animation_length = 0,
}

opt.set {
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

  wildoptions = {'pum', 'tagfile', 'fuzzy'},
  virtualedit = {'block'},
}

vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')
