" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Encode all files in UTF-8
set encoding=utf-8
set fileencoding=utf-8

set modelines=0 " For security
set scrolloff=3 " For search result context
set wildmenu " For command line suggestions with TAB
set wildmode=list:longest
set cursorline " Highlight the current line
set ttyfast " Is a fast terminal
set laststatus=2 " Permanent status bar

set backspace=indent,eol,start " Sane character deletion
set autoindent
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd	" display incomplete commands
set relativenumber " Always show relative line numbers
set visualbell " Use a visual warning for bad operations

" Keep backups in ~/.vimbackup
set backup " keep a backup file

if !isdirectory($HOME . '/.vimbackup')
  call mkdir($HOME . '/.vimbackup', 'p')
end

set backupdir=~/.vimbackup

" Keep undo file in ~/.vimundo
set undofile "Allow persistent undo

if !isdirectory($HOME . '/.vimundo')
  call mkdir($HOME . '/.vimundo', 'p')
end

set undodir=~/.vimundo

" Console window size
set lines=30
set columns=100

" TAB
" For most languages, use these settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" SEARCH
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %

" LINES
set wrap
set textwidth=79
set formatoptions=cqrn1

let s:os = substitute(system("uname"), "\n", "", "")
if exists("g:mobile") || s:os == "Darwin"
  " avoid a VimTouch bug by skipping for mobile
  " Also avoid the same bug if operating on a Mac
else
  set formatoptions+=j 
endif

set colorcolumn=85

" KEYBOARD

" Never use Ex mode
map Q <nop>

" Shift+Y and Shift+D don't process the whole line, just the rest of it
nnoremap Y y$
nnoremap D d$

" Disable the arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Screen line movement
nnoremap j gj
nnoremap k gk

" Disable space, enter, backspace in normal mode. These movements should be
" down with hjkl
map <space> <nop>
map <return> <nop>
map <backspace> <nop>

" Disable backspace in insertion mode. Deletion should be done in normal mode
imap <backspace> <nop>

" Open the command line with ; instead of : to half the keystrokes
nnoremap ; :
" Unmap : so we learn better habits
nmap : <nop>
" Then remap ; to enter so we can still do letter searches within lines
nnoremap <return> ;

" Convenience commands (to avoid caps error time-wasting)
command W w
command Q q
command Wq wq
command WQ wq

" LEADER SHORTCUTS

let mapleader=" "

" Paste from the clipboard
map <leader>p "+p
map <leader>P "+P

" Under the current line, add another line of hyphens of equal char width
map <leader>u yypVr-

" Force wrapping this paragraph
map <leader>q gqip

" Force wrapping entire document
map <leader>Q gggqG

" Edit vimrc!
map <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Switch splits
map <leader>w <C-w>

" Scroll up and down by half the screen
map <leader>j <C-d>
map <leader>k <C-u>

nnoremap <leader>/ :noh<cr>
nnoremap <leader>r :redo<cr>

syntax on

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  filetype plugin indent on 

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

" install plugins and generate helptags
call pathogen#infect()
Helptags
