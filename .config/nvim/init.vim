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
