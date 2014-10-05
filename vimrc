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
nnoremap <leader>/ :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" LINES
set wrap
set textwidth=79
set formatoptions=cqrnj1
set colorcolumn=85

" KEYBOARD

" Never use Ex mode
map Q <nop>

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

" Disable space, enter, backspace in Normal mode
map <space> <nop>
map <return> <nop>
map <BS> <nop>

"Disable deletion in insert mode
imap <BS> <nop>

" LEADER SHORTCUTS

let mapleader = " "

" Under the current line, add another line of hyphens of equal char width
map <leader>u yypVr-

" Strip all trailing whitspace in the current file
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Force wrapping this paragraph
map <leader>q gqip

" Edit vimrc!
map <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" New vsplit!
map <leader>w <C-w>v<C-w>l

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

call pathogen#infect()
Helptags
