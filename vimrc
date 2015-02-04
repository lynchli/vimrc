"==========================================
" Configure Vundle and initialize 
"==========================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
call vundle#end()
" Enable filetype plugins
filetype plugin indent on

"===========================================
" Basic Settings
"==========================================
set number
set nowrap
" Set to auto read when a file is changed from the outside
set autoread
" For regular expressions turn magic on
set magic
" Sets how many lines of history VIM has to remember
set history=700
" Turn on the WiLd menu
set wildmenu
" A buffer becomes hidden when it is abandoned
set hidden
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

"highlight all its matches.
set hlsearch 
"While typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch 
"ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase 

set scrolloff=7
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%y[%{&fenc}]%m%r%h\ %w\ \ %r%{getcwd()}%h\ \ buf:[%n]\ \ \ \ %=\ Line:\ %l,%c\ \ \ \ %P
set smartindent 
set autoindent "auto indent

"Number of spaces that a <Tab> in the file counts for.
set tabstop=4 
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2
set noeb
"==========================================
" Display Settings 
"==========================================

set cursorcolumn
set cursorline

set ruler
set showmode

"==========================================
" Encoding Settings
"==========================================
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

"==========================================
" Language Settings
"==========================================

"==========================================
" Keymap Settings
"==========================================
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"add a blank line 
nmap <silent> to :call append('.', '')<CR>j
nmap <silent> tO :call append(line('.')-1, '')<CR>k

" Move a line of text using Ctrl+[jk]
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z

" Useful mappings for managing tabs
map <A-t> :tabnew<cr>
map <A-c> :tabclose<cr>
map <A-m> :tabmove 
map <A-n> :tabnext<cr> 
map <A-p> :tabpagenr<cr>
" Let 'l' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <A-l> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

if has("mac") || has("macunix")
    vmap <A-c> :w !pbcopy<CR><CR> 
    nmap <A-v> :r !pbpaste<CR><CR>
endif

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"==========================================
" Colorscheme Settings
"==========================================
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
let g:solarized_termcolors=256
colorscheme solarized

"==========================================
" Helper Functions
"==========================================
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
