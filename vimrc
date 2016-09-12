" ./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp
" --enable-python3interp --with-python3-config-dir=/usr/local/Cellar/python3/
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

set backspace=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set runtimepath^=~/.vim/bundle/ctrlp.vim

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Bundle 'jistr/vim-nerdtree-tabs'

Plugin 'tpope/vim-fugitive'

Plugin 'fatih/vim-go'

Plugin 'PProvost/vim-ps1'

Plugin 'Valloric/YouCompleteMe'

Plugin 'ekalinin/Dockerfile.vim'

Bundle 'elentok/plaintasks.vim'

Plugin 'scrooloose/syntastic'

Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdcommenter'

Plugin 'majutsushi/tagbar'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

Plugin 'bbatsov/rubocop'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-bundler'

Bundle 'vim-ruby/vim-ruby'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

" " When vim ecounters a rb file, switch to two tabs.
filetype plugin on
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab

" " Nerdtree, vim-go settings
let g:nerdtree_tabs_open_on_console_startup=0
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

" " Apperance settings: line number, highlight search color and tags.
set number
set hlsearch
set t_Co=256
set completeopt-=preview
set tags=./.tags;,~/.vimtags

" " Schema and colors
syntax on
colorscheme onedark

" " Enabling Ruby extension.
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" " Key mappings
nmap <F8> :TagbarToggle<CR>
nmap <F10> :UpdateTags<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <F7> :tabnew<CR>
nmap <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nmap <F5> :lclose
