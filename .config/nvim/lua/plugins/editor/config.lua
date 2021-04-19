local g = vim.g

-- indentLine --
g.indentLine_setColors = 0
g.indentLine_char = '¦'

-- vim-better-whitespace --
g.better_whitespace_guicolor            = '#BF616A'
g.better_whitespace_filetypes_blacklist = {'dashboard', 'packer'}

-- nerdcommenter --
g.NERDSpaceDelims      = 1
g.NERDCheckAllLines    = 1
g.NERDCompactSexyComs  = 1
g.NERDCustomDelimiters = {svelte = {left = '<!--', right = '-->'}}

-- vim-surround --
g.AutoPairsShortcutJump = 0
