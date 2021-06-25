require 'plugins.ui.cmds'

local g = vim.g
local cmd = vim.cmd

-- dashboard-nvim --
g.dashboard_default_executive ='fzf'

-- fzf --
g.fzf_preview_window = {'right:50%', 'ctrl-/'}
g.fzf_preview_window = {'up:40%:hidden', 'ctrl-/'}

-- lightline.vim --
g.lightline = {
  colorscheme = 'dogrun',
  component_function = {
    filetype = 'LightlineFiletype',
    fileformat = 'LightlineFileformat'
  },
  active = {
    left = {
      {'mode', 'paste'},
      {'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok'},
      {'readonly', 'filename', 'modified'},
      {'coc_status'}
    }
  }
}
