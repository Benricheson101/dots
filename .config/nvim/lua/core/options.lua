local cmd = vim.cmd
local fn = vim.fn

local global_ops = {
  autoread       = true,
  clipboard      = 'unnamedplus',
  encoding       = 'UTF-8',
  showmode       = false,
  regexpengine   = 0,

  ignorecase     = true,
  smartcase      = true,
  undodir        = '/tmp/.nvim-undo-dir',
}

local window_ops = {
  cursorline     = true,
  linebreak      = true,

  number         = true,
  relativenumber = true,

  foldcolumn     = '1',
  foldenable     = false,
  foldmethod     = 'syntax',
}

local buffer_ops = {
  expandtab      = true,
  tabstop        = 2,
  shiftwidth     = 2,
  omnifunc       = 'syntaxcomplete#Complete',
  undofile       = true,
}

-- colorscheme --
cmd 'hi FoldColumn guifg=#535F98'

-- misc options --
cmd 'set shortmess+=c'
cmd 'set rtp+=~/.fzf'
cmd 'colors dogrun'
cmd 'filetype plugin on'

if fn.has('termguicolors') == 1 then
  vim.o.guifont       = 'FiraCode Nerd Font Mono:h12'
  vim.o.termguicolors = true
end

if fn.isdirectory('/tmp/.nvim-undo-dir') == 0 then
  fn.mkdir('/tmp/.nvim-undo-dir', '', 0700)
end

local function load_ops(scope, ops)
  for k, v in pairs(ops) do
    vim[scope][k] = v
  end
end

load_ops('o', window_ops)
load_ops('wo', window_ops)
load_ops('bo', buffer_ops)

-- -- global options --
-- o.autoread        = true
-- o.clipboard       = 'unnamedplus'
-- o.encoding        = 'UTF-8'
-- o.showmode        = false
-- o.regexpengine    = 0

-- o.ignorecase      = true
-- o.smartcase       = true
-- o.undodir         = '/tmp/.nvim-undo-dir'

-- -- window options --
-- wo.cursorline     = true
-- wo.linebreak      = true

-- wo.number         = true
-- wo.relativenumber = true

-- wo.foldcolumn     = '1'
-- wo.foldenable     = false
-- wo.foldmethod     = 'syntax'

-- -- buffer options --
-- bo.expandtab      = true
-- bo.tabstop        = 2
-- bo.shiftwidth     = 2
-- bo.omnifunc       = 'syntaxcomplete#Complete'
-- bo.undofile       = true
