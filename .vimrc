set ruler
set nu
set rtp+=/usr/local/Cellar/go/1.0.1/misc/vim
set term=screen-256color
filetype plugin indent on
syntax on

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set expandtab
set shiftwidth=4
set softtabstop=4

call pathogen#infect()

if &t_Co >= 256 || has("gui_running")
        "set guifont=Monaco:h12
        "colorscheme  busierbee
        colorscheme  candycode
        set guioptions-=r
        set go-=L
        set go-=T
else
        "colorscheme kraighlight2
        colorscheme rdark
endif

" line tracking
set numberwidth=5
set cursorline
set cursorcolumn
set nobackup
set noswapfile

" save files as root without prior sudo
cmap w!! w !sudo tee % >/dev/null

set textwidth=79
set formatoptions=qrn1

if exists('+colorcolumn')
    set colorcolumn=80
endif

highlight ColorColumn ctermbg=8

" turn off cursor blinking
set guicursor+=a:blinkon0

" display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

set nocompatible " Disable vi-compatibility
set laststatus=2 " Always show the statusline

set textwidth=0 
set wrapmargin=0

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

au BufRead,BufNewFile *.go set filetype=go

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

set runtimepath^=~/.vim/bundle/ctrlp.vim

map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
map  <F7> mzgg=G`z<CR>

let g:neocomplcache_enable_at_startup = 1

let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

au FileType javascript setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %"

:au BufRead,BufNewFile *.jake,Jakefile set filetype=javascript


if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
