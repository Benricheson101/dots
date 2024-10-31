local opt = require('util.opt')

if vim.fn.has('termguicolors') then
  opt.set {termguicolors = true}
end

vim.cmd.colors('habamax')
-- vim.cmd.colors('catppuccin-latte')

-- sets the floating window border to match the background (making it ""invisible"")
vim.api.nvim_set_hl(0, 'FloatBorder', {link = 'Normal'})
vim.api.nvim_set_hl(0, 'Pmenu', {link = 'Normal'})

opt.g {
  mapleader = ' ',
  neovide_cursor_animation_length = 0.05,
  neovide_scroll_animation_length = 0,
  neovide_position_animation_length = 0,
}

opt.set {
  guifont = 'IntoneMono Nerd Font:h12',
  -- guifont = 'IntelOne Mono:h12',
  -- guifont = 'FiraCode Nerd Font:h12',
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

  wildoptions = {'pum', 'tagfile', 'fuzzy'},
  -- winfixwidth = true,
  virtualedit = {'block'},
}

-- don't give ins-completion-menu messages "match 1 of 2"
-- vim.opt.shortmess:append('c')

vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')
