" bens very beautiful neovim config

" =======================================================================
" laod plugins
" =======================================================================
call plug#begin('~/.vim/plugged')
" airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'

" theme
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'iandwelker/rose-pine-vim'
Plug 'wadackel/vim-dogrun'

" nerdtree
Plug 'preservim/nerdtree'

" completion and language support
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
Plug 'sheerun/vim-polyglot'

" languages
Plug 'HerringtonDarkholme/yats.vim'
Plug 'zah/nim.vim'
Plug 'pangloss/vim-javascript'
"Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/Colorizer' " css colors

Plug 'rust-analyzer/rust-analyzer'
Plug 'cespare/vim-toml'
Plug 'Glench/Vim-Jinja2-Syntax' " works pretty well for .tera files
Plug 'neovimhaskell/haskell-vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'evanleck/vim-svelte'
" Plug 'leafOfTree/vim-svelte-plugin'
Plug 'projectfluent/fluent.vim'

" Plug 'tmhedberg/matchit'
Plug 'adelarsq/vim-matchit'

" highlight whitespace
Plug 'ntpeters/vim-better-whitespace'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" comment blocks of text
Plug 'preservim/nerdcommenter'
" Plug 'tyru/caw.vim'

" surround
Plug 'tpope/vim-surround'

" pairs
Plug 'jiangmiao/auto-pairs'

" column
Plug 'godlygeek/tabular'

" discord rich presence
Plug 'Benricheson101/vimsence'

" make window fullscreen
Plug 'markstory/vim-zoomwin'

" indent line
Plug 'Yggdroot/indentLine'

" other stuff
Plug 'wakatime/vim-wakatime'
" Plug 'johannesthyssen/vim-signit'

Plug 'chaoren/vim-wordmotion'
Plug 'pantharshit00/vim-prisma'

call plug#end()

" map leader key to ','
let g:mapleader=','

" apparently <C-j> is a bash thing or something idk
let g:BASH_Ctrl_j = 'off'
" =======================================================================
" set stuff
" =======================================================================

" colorscheme gruvbox
" colorscheme deus

" set bg=dark
" set t_Co=256

colorscheme dogrun
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
" set spell spelllang=en_us " TODO: enable for html/md/svelte files

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
nnoremap <silent> <A-Left> :tabprevious<CR>
nnoremap <silent> <A-h> :tabprevious<CR>
" next tab
nnoremap <silent> <A-Right> :tabnext<CR>
nnoremap <silent> <A-l> :tabnext<CR>

" press space to stop highlighting
nnoremap <silent> <SPACE> :noh<CR>

" add a semi to the end of the line
nnoremap <silent> ;; A;<esc>
nnoremap <silent> ,, A,<esc>

" lol
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" for tmux
inoremap <C-a> <Home>
inoremap <C-e> <End>
noremap <C-a> <Home>
noremap <C-e> <End>

" enable spell check for only markup languages
autocmd FileType markdown,svelte,jsx,html,vue setlocal spell spelllang=en_us

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
" lightline
" ==========================================
let g:lightline = {
  \ 'colorscheme': 'dogrun',
  \ 'active': {
  \   'left': [['mode', 'paste'],
  \             ['coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok'],
  \             ['readonly', 'filename', 'modified'], ['coc_status']]
  \ },
  \ }

call lightline#coc#register()

" ==========================================
" coc
" ==========================================
" coc plugins i use:
" coc-eslint
" coc-json
" coc-rust-analyzer
" coc-tsserver
" coc-css
" coc-clangd
" coc-java
" coc-sql
" coc-tailwindcss

" jsonc format (json with comments)
autocmd FileType json syntax match Comment +\/\/.\+$+

" use <TAB> for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt :call <SID>show_documentation()<CR>

inoremap <silent><expr> <C-j> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1, 1)\<cr>" : "\<C-j>"
inoremap <silent><expr> <C-k> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0, 1)\<cr>" : "\<C-k>"

" ==========================================
" vim-polyglot
" ==========================================
let g:svelte_indent_script = 0
let g:html_indent_script1 = 0

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
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

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
let g:NERDCustomDelimiters = {'svelte': {'left': '<!--','right': '-->'}}

" ==========================================
" surround
" ==========================================
let g:AutoPairsShortcutJump = 0

" ==========================================
" vimsence
" ==========================================
let g:vimsence_small_text = 'hi ur probably cool'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Project: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
let g:vimsence_display_github = 1
let g:vimsence_display_github_repo = 1
let g:vimsence_github_user = 'Benricheson101'

" ==========================================
" indentLine
" ==========================================
let g:indentLine_setColors = 0
let g:indentLine_char = '¦'
