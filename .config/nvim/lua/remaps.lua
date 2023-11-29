vim.keymap.set('n', 'J', '10gj')
vim.keymap.set('v', 'J', '10gj')
vim.keymap.set('n', 'K', '10gk')
vim.keymap.set('v', 'K', '10gk')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('v', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('v', 'k', 'gk')

vim.keymap.set('n', '<leader><Space>', vim.cmd.noh)
vim.keymap.set('n', ';;', 'A;<esc>')
vim.keymap.set('n', ',,', 'A,<esc>')
vim.keymap.set('t', '<S-Space>', '<Space>')

vim.keymap.set('n', 'gh', '<NOP>')

vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")

vim.keymap.set('x', '<leader>P', '"_dP')
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>v', '"+p')
vim.keymap.set('v', '<leader>v', '"+p')
vim.keymap.set('v', '<leader>x', '"+d')
vim.keymap.set('n', '<leader>x', '"+d')
