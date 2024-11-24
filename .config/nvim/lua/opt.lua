local opt = require('util.opt')
local t = require('util.table')

if vim.fn.has('termguicolors') then
  opt.set {
    termguicolors = true,
    winblend = 5
  }
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

  showmatch = true,

  backspace = {'indent', 'eol', 'start'},

  dir = '/private/tmp',
  backup = true,
  backupdir = '/private/tmp',
  undofile = true,
  undodir = '/private/tmp',

  updatetime = 100,

  wildoptions = {'pum', 'tagfile', 'fuzzy'},
  virtualedit = {'block'},

  matchpairs = t.append {'<:>'},
  shortmess = t.append {'l'},
  formatoptions = t.remove {'r', 'o'},
}

local fo_group = vim.api.nvim_create_augroup('formatoptions', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  group = fo_group,
  pattern = '*',
  desc = 'sets formatoptions because someone, in their infinite wisdom, decided to overwrite them in nearly every default ftplugin',
  callback = function ()
    opt.setlocal {
      formatoptions = t.remove {'r', 'o'},
    }
  end
})
