-- Options --

local cmd = vim.cmd
local fn = vim.fn

local global_ops = {
  autoread       = true,
  clipboard      = 'unnamedplus',
  shortmess      = vim.o.shortmess .. 'c',
  encoding       = 'UTF-8',
  showmode       = false,
  regexpengine   = 0,
  runtimepath    = vim.o.runtimepath .. ',~/.fzf',

  ignorecase     = true,
  smartcase      = true,

  conceallevel   = 0,
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

local gui_ops = {
  guifont       = 'FiraCode Nerd Font Mono:h12',
  termguicolors = true,
}

-- colorscheme --
-- cmd 'colors dogrun'
cmd 'hi FoldColumn guifg=#535F98'

-- misc options --
cmd 'filetype plugin on'

local function load_ops(scope, ops)
  for k, v in pairs(ops) do
    (vim[scope])[k] = v
  end
end

load_ops('o', global_ops)
load_ops('wo', window_ops)
load_ops('bo', buffer_ops)

if fn.has('termguicolors') == 1 then
  load_ops('o', gui_ops)
end

-- vim:set fdm=marker:
