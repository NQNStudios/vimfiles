if !isdirectory($HOME . '/.vimbackup')
  call mkdir($HOME . '/.vimbackup', 'p')
end
set backupdir=~/.vimbackup
