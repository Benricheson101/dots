local cmd = vim.cmd

-- FileType --
cmd 'autocmd FileType markdown,svelte,jsx,html,vue,gitcommit setlocal spell spelllang=en_us'
cmd 'autocmd FileType json syntax match Comment +\\/\\/.\\+$+'
cmd 'autocmd FileType dashbord,packer :IndentLinesDisable'

-- BufReadPost --
cmd [[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
