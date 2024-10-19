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

" Open NERDTree automatically if no files or directories are specified.
autocmd vimenter * NERDTree | wincmd p

" Prevent NERDTree from opening if a file is opened directly.
autocmd StdinReadPre * let s:std_in=1

" Close vim if NERDTree is the only buffer remaining.
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | quit | endif

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
