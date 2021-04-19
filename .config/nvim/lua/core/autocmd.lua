local cmd = vim.cmd

-- FileType --
cmd 'autocmd FileType markdown,svelte,jsx,html,vue setlocal spell spelllang=en_us'
cmd 'autocmd FileType json syntax match Comment +\\/\\/.\\+$+'
cmd 'autocmd FileType dashbord :IndentLinesDisable'

-- BufReadPost --
cmd [[
	autocmd BufReadPost *
	  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	  \ |   exe "normal! g`\""
	  \ | endif
]]
