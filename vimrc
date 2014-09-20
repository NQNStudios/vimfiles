" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Encode all files in UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Keep backups in ~/.vimbackup
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file

  if !isdirectory($HOME . '/.vimbackup')
    call mkdir($HOME . '/.vimbackup', 'p')
  end

  set backupdir=~/.vimbackup
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ic " ignore search case

set number " Always show line numbers
set visualbell " Use a visual warning for bad operations

" Console window size
set lines=30
set columns=100

" TAB
" For most languages, use these settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" KEYBOARD

" Use ; to enter command mode
map ; :

" Disable the arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Disable space, enter, backspace in Normal mode
map <space> <nop>
map <return> <nop>
map <BS> <nop>

"Disable deletion in insert mode
imap <BS> <nop>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
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

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

call pathogen#infect()
