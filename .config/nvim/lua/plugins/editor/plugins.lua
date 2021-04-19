require 'plugins.editor.config'

local editor = {
  'Yggdroot/indentLine',
  'adelarsq/vim-matchit',
  'chaoren/vim-wordmotion',
  'godlygeek/tabular',
  'jiangmiao/auto-pairs',
  'markstory/vim-zoomwin',
  'mattn/emmet-vim',
  'ntpeters/vim-better-whitespace',
  'preservim/nerdcommenter',
  'tpope/vim-surround',

  ['rrethy/vim-hexokinase'] = { run = 'make hexokinase' },
}

return editor
