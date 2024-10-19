" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Use highlighting when doing a search.
set hlsearch

" Abrir NERDTree automáticamente si no se especifican archivos o directorios
autocmd vimenter * NERDTree | wincmd p

" Evitar que se abra NERDTree si abres un archivo directamente
autocmd StdinReadPre * let s:std_in=1

" Cerrar Vim si NERDTree es el único buffer restante
autocmd bufenter * if (winnr("$") == 1 && bufname() == "NERD_tree_1") | q | endif

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

	Plug 'dense-analysis/ale'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'		

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
