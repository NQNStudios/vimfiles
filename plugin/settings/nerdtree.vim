" Press F3 to open NERDTree and F4 to preview
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" The current console directory should match the current nerdtree directory
let g:NERDTreeChDirMode=2
