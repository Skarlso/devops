syntax on
set number
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Bundle 'jistr/vim-nerdtree-tabs'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/syntastic'

Plugin 'fatih/vim-go'

Plugin 'PProvost/vim-ps1'

Plugin 'Valloric/YouCompleteMe'

Plugin 'ekalinin/Dockerfile.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:nerdtree_tabs_open_on_console_startup=1
colorscheme onedark
syntax enable

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:go_fmt_command = "goimports"
