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
  undodir        = '/tmp/.nvim-cache',
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
cmd 'colors dogrun'
cmd 'hi FoldColumn guifg=#535F98'

-- misc options --
cmd 'set shortmess+=c'
cmd 'set rtp+=~/.fzf'
cmd 'filetype plugin on'

if fn.has('termguicolors') == 1 then
  vim.o.guifont       = 'FiraCode Nerd Font Mono:h12'
  vim.o.termguicolors = true
end

if fn.isdirectory('/tmp/.nvim-cache') == 0 then
  fn.mkdir('/tmp/.nvim-cache', '', 0700)
end

local function load_ops(scope, ops)
  for k, v in pairs(ops) do
    vim[scope][k] = v
  end
end

load_ops('o', window_ops)
load_ops('wo', window_ops)
load_ops('bo', buffer_ops)
