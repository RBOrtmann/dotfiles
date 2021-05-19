call plug#begin('$HOME/.config/nvim/plugged')

    " Solarized color scheme
    Plug 'overcache/NeoSolarized'
	
	" Git integration
	Plug 'tpope/vim-fugitive'

call plug#end()

:syntax enable
:filetype plugin indent on
:set termguicolors
":set background=dark
:colorscheme NeoSolarized

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent
