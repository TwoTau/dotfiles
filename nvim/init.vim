set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set noshowmode              " disable -- INSERT -- because lightline already shows it
set ruler
set mouse=a                 " enable mouse support
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
call plug#end()

map <C-b> :NERDTreeToggle<CR>
map <C-s> :w<CR>

nnoremap <C-Z> u
nnoremap <C-Y> <C-R>
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

let g:lightline = {
\ 'colorscheme': 'onedark',
\}
colorscheme onedark

