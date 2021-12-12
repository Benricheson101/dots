" Disable MacVim touchbar fullscreen button
let g:macvim_default_touchbar_fullscreen=0

call plug#begin("~/.vim/plugged")
" Colorschemes
Plug 'wadackel/vim-dogrun'

" QOL
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'adelarsq/vim-matchit'

" Editor
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html']
  \ }
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
Plug 'chaoren/vim-wordmotion'

" UI
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Languages
Plug 'alx741/vim-hindent', {'for': ['haskell']}
Plug 'itchyny/vim-haskell-indent', {'for': 'haskell'}
Plug 'neovimhaskell/haskell-vim', {'for': ['haskell']}

Plug 'fatih/vim-go', {'for': ['go']}

Plug 'jparise/vim-graphql'
Plug 'mattn/emmet-vim', {'for': ['javascriptreact', 'typescriptreact', 'html', 'markdown']}
Plug 'maxmellon/vim-jsx-pretty', {'for': ['javascriptreact', 'typescriptreact']}
Plug 'yuezk/vim-js', {'for': ['javascript', 'typescript']}
Plug 'pantharshit00/vim-prisma', {'for': ['prisma']}
Plug 'projectfluent/fluent.vim', {'for': ['fluent']}

" Other
Plug 'wakatime/vim-wakatime'
Plug 'benricheson101/coc-discord-rpc', {'branch': 'button', 'do': 'yarn && yarn build'}
call plug#end()

" Appearance
colors dogrun
set guifont=Fira\ Code\ Regular\ Nerd\ Font\ Complete\ Mono\ Windows\ Compatible:h12
set macligatures
set cursorline cursorcolumn
set nu rnu
set noshowmode
set shortmess+=c
set laststatus=2
set guioptions+='k'
set conceallevel=0
set autoread

" Editor
set ts=2 sw=2 et
set ignorecase smartcase

" Keybinds
let mapleader = ','

nnoremap <silent> J 10gj
vnoremap <silent> J 10gj
nnoremap <silent> K 10gk
vnoremap <silent> K 10gk
noremap <silent> j gj
noremap <silent> k gk
nnoremap <silent> <A-Left> :tabprevious<CR>
nnoremap <silent> <A-h> :tabprevious<CR>
nnoremap <silent> <A-Right> :tabnext<CR>
nnoremap <silent> <A-l> :tabnext<CR>
nnoremap <silent> <SPACE> :noh<CR>
nnoremap <silent> ;; A;<esc>
nnoremap <silent> ,, A,<esc>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <C-p> :Files<CR>
nnoremap <C-S-P> :GFiles<CR>

map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> go <Plug>(coc-codeaction)
nmap <silent> gh :call <SID>show_documentation()<CR>

nmap <silent> gD :call CocAction('jumpDefinition', v:false)<CR>

inoremap <silent><expr> <C-j> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1, 1)\<cr>" : "\<C-j>"
inoremap <silent><expr> <C-k> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0, 1)\<cr>" : "\<C-k>"
inoremap <silent><expr> <c-space> coc#refresh()

map <C-n> :NERDTreeToggle<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Misc.
syntax on
filetype plugin indent on


" Plugins
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#quickfix_auto_focus = 0

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

let g:lightline = {
  \ 'colorscheme': 'dogrun',
  \ 'component_function': {
     \ 'filetype': 'LightlineFiletype',
     \ 'fileformat': 'LightlineFileformat'
   \ },
  \ "active": {
    \ 'left': [
      \ ['mode', 'paste'],
      \ ['coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok'],
      \ ['readonly', 'filename', 'modified'],
      \ ['coc_status']
      \ ]
   \ }
\ }

let g:user_emmet_settings = {
\  'javascriptreact' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'jsx',
\  },
\}

let g:indentLine_char = '¦'
let g:indentLine_conceallevel = 0

let g:better_whitespace_guicolor = '#BF616A'
let g:haskell_indent_disable = 1

let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_autosave = 1
