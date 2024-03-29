
call pathogen#infect()
"syntax on
"filetype plugin indent on
"syntax enable
"set background=dark
"colorscheme solarized

" Functional settings
" -------------------

set nocompatible       " We're not vi!
set history=1000       " Remember lots of commands
set mouse=a            " Mouse support
let mapleader = ','    " Comma is leader
let g:mapleader = ','
set autoread           " Autoupdate from the outside
set autochdir          " pwd should be where I open the file

" Mappings
" --------

map Y y$    " Map Y to act like D and C, to yank to EOL

" When moving up/down, go visually, not by line
map j gj
map k gk

" Disable backup
" --------------

set nobackup
set nowb
set noswapfile

" Restore previous cursor position
" --------------------------------

if has('autocmd')
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Indenting
" ---------

filetype indent on
set autoindent                    " Auto-indent
set smartindent                   " Smart indent
set noexpandtab                   " Tabbed indent
set copyindent preserveindent     " Preserve indent structure
"set softtabstop=0                 " No spaces when tabbing
set shiftwidth=2                  " Two characters wide when using >> and stuff
set tabstop=2                     " Tabs count for 2 spaces

" Searching
" ---------

set ignorecase    " Ignore case when searching...
set smartcase     " ...unless there are caps.
set incsearch     " Incremental search
set hlsearch      " Highlight matches

" Undo
" ----

set ul=1000                   " Undo level

" Save undo history
if has('undodir')
	set undodir=~/.vim/backups
endif
if has('undofile')
	set undofile
endif

" File management
" ---------------

nmap <silent> <c-n> :NERDTreeToggle<CR>    " NERD tree mapping on C-n
set wildmenu                               " Autocomplete mapping
set wildmode=list:longest,full
set wildignore=*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem

" Language-specific
" -----------------

filetype on
filetype plugin on

if has('autocmd')
	au BufRead,BufNewFile *.less set filetype=less " LESS
	au BufNewFile,BufRead *.rss setfiletype xml " RSS is XML
	au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown " Markdown
	au BufNewFile,BufRead *.json set ft=javascript " JSON is JavaScript
	au BufNewFile,BufRead *gitconfig setf gitconfig " gitconfigs
endif

" Project-specific
" ----------------

" UniversityNow
if has('autocmd')
	autocmd BufNewFile,BufRead */unow-web/*.rb set et sw=2 ts=2
	autocmd BufNewFile,BufRead */unow-web/*.{scss,js} set et shiftwidth=4 tabstop=4
endif

" Visual
" ------

syntax on                      " Syntax highlighting on
set t_Co=256                   " Have 256 colors for terminal
colorscheme jellybeans         " Color scheme
set ruler                      " Highlight cursor position
set cul                        " Highlight current line
set number                     " Show line numbers
set showmatch                  " Show matching bracket when you hover on one
set wrap                       " Soft wrap by word
	set linebreak
	set nolist
	set textwidth=0
	set wrapmargin=0
set scrolloff=4                " Scroll 4 lines away from margins
set listchars=tab:▸\ ,eol:¬    " Tabs and EOLs should look like TextMate

" Plugin-specific
" ---------------

let g:indent_guides_enable_on_vim_startup=1    " Start the Indent Guides plugin

" Switching tabs like Firefox/Chrome
" ----------------------------------

" From http://vimcasts.org/episodes/working-with-tabs/

if has('unix')
  let s:uname = system('uname')
  if s:uname == "Darwin\n"
    map <D-S-]> gt
    map <D-S-[> gT
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>
  else
    map <C-S-]> gt
    map <C-S-[> gT
    map <C-1> 1gt
    map <C-2> 2gt
    map <C-3> 3gt
    map <C-4> 4gt
    map <C-5> 5gt
    map <C-6> 6gt
    map <C-7> 7gt
    map <C-8> 8gt
    map <C-9> 9gt
    map <C-0> :tablast<CR>
  endif
endif

" Delete trailing whitespace on save
" ----------------------------------

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()

" MacVim/gvim
" -----------

if has('gui_running')
	set gfn=Inconsolata:h16    " Font: 16pt Inconsolata
	set guioptions-=T          " Hide toolbar
	set clipboard=unnamed      " Use the system clipboard
end

" And now let us make doc tags
" ----------------------------

" helptags ~/.vim/doc

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
