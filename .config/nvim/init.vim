" bens very beautiful neovim config

" =======================================================================
" laod plugins
" =======================================================================
call plug#begin('~/.vim/plugged')
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" theme
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" nerdtree
Plug 'preservim/nerdtree'

" completion and language support
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
Plug 'sheerun/vim-polyglot'

" languages
Plug 'HerringtonDarkholme/yats.vim'
Plug 'zah/nim.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/Colorizer' " show color code color
Plug 'racer-rust/vim-racer' " rust
Plug 'cespare/vim-toml'
Plug 'Glench/Vim-Jinja2-Syntax' " works pretty well for .tera files
Plug 'neovimhaskell/haskell-vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'lifepillar/pgsql.vim'

Plug 'tmhedberg/matchit'

" highlight whitespace
Plug 'ntpeters/vim-better-whitespace'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" comment blocks of text
Plug 'preservim/nerdcommenter'

" surround
Plug 'tpope/vim-surround'

" pairs
Plug 'jiangmiao/auto-pairs'

" column
Plug 'godlygeek/tabular'

" discord rich presence
Plug 'hugolgst/vimsence'

" make window fullscreen
Plug 'markstory/vim-zoomwin'

" indent line
Plug 'Yggdroot/indentLine'

" other stuff
Plug 'wakatime/vim-wakatime'
Plug 'johannesthyssen/vim-signit'

call plug#end()

" map leader key to ','
let g:mapleader=','

" =======================================================================
" set stuff
" =======================================================================

" colorscheme gruvbox
colorscheme deus
set number relativenumber " line numbers
set expandtab tabstop=2 shiftwidth=2 " 2 space tabs
set linebreak " linebreak on wrap
set cursorline
set noshowmode " use airline instead of vim's mode
set ignorecase smartcase " highlightsearch
set autoread
set clipboard=unnamedplus " use system clipboard for yank/put
set hidden
set re=0 " new regex engine
" set list " show whitespace
set undodir=/tmp/

if(has('termguicolors'))
  set termguicolors
endif

" =======================================================================
" binds
" =======================================================================

" 10 lines down
nnoremap <silent> J 10gj
vnoremap <silent> J 10gj
" 10 lines up
nnoremap <silent> K 10gk
vnoremap <silent> K 10gk

noremap <silent> j gj
noremap <silent> k gk

" previous tab
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-h> :tabprevious<CR>
" next tab
nnoremap <A-Right> :tabnext<CR>
nnoremap <A-l> :tabnext<CR>

" press space to stop highlighting
nnoremap <silent> <SPACE> :noh<CR>

" add a semi to the end of the line
nnoremap ;; A;<esc>

nnoremap ,, A,<esc>

" =======================================================================
" plugins
" =======================================================================

" ==========================================
" completion
" ==========================================
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set shortmess+=c

" ==========================================
" airline
" ==========================================
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamode=':t'

" ==========================================
" coc
" ==========================================
" coc plugins i use:
" coc-eslint
" coc-json
" coc-rls
" coc-tsserver
" coc-css
" coc-clangd
" coc-java
" coc-sql

" jsonc format (json with comments)
autocmd FileType json syntax match Comment +\/\/.\+$+

" use <TAB> for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ==========================================
" vim-javascript
" ==========================================
let g:javascript_plugin_jsdoc = 1

" ==========================================
" vim-javascript
" ==========================================
let g:vim_markdown_conceal_code_blocks = 0
" dont hide *, **, `, ```, etc
let g:vim_markdown_conceal = 0

" ==========================================
" vim racer
" ==========================================
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

" ==========================================
" vim-better-whitespace
" ==========================================
let g:better_whitespace_guicolor = '#BF616A'

" ==========================================
" nerdtree
" ==========================================
" open nerdtree if you open a dir in vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" open nerdtree
map <C-n> :NERDTreeToggle<CR>

" close vim if nerdtree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ==========================================
" nerdcommenter
" ==========================================
" add space after comment
let g:NERDSpaceDelims = 1
let g:NERDCheckAllLines = 1
let g:NERDCompactSexyComs = 1


" ==========================================
" vimsence
" ==========================================
let g:AutoPairsShortcutJump = 0

" ==========================================
" vimsence
" ==========================================
let g:vimsence_small_text = 'go away'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Project: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'

" ==========================================
" indentLine
" ==========================================
let g:indentLine_setColors = 0
let g:indentLine_char = '¦'
