local cmd = vim.cmd

-- lightline.vim --
cmd [[
  function! LightlineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction

  function! LightlineFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction

  call lightline#coc#register()
]]

-- nerdtree --
-- cmd [[
--   autocmd StdinReadPre * let s:std_in=1
-- 
--   autocmd VimEnter * if argc() == 1
--     \ && isdirectory(argv()[0])
--     \ && !exists("s:std_in")
--       \ | exe 'NERDTree' argv()[0]
--       \ | wincmd p
--       \ | ene
--       \ | exe 'cd '.argv()[0]
--     \ | endif
-- 
--   autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
-- ]]
