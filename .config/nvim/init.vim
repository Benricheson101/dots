" bens very beautiful neovim config

" use dvorak binds if xkb is set to dvorak
if system('setxkbmap -query | awk ''/layout/ {print $2}'' | tr -d ''\n''') == 'dvorak'
  set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?
endif

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

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

map <C-n> :NERDTreeToggle<CR>

lua require 'init'
