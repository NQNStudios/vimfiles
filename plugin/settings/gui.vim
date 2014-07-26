set number
set visualbell

if has("gui_running")
    " Gvim settings
	colorscheme distinguished
	set guioptions-=m " no menu bar
	set guioptions-=T " no toolbar
    set guioptions-=r " no scrollbar

	set lines=43
	set columns=180
else
    " Console vim settings
    set lines=30
	set columns=150
endif
