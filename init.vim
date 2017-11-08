" ./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp
" --enable-python3interp --with-python3-config-dir=/usr/local/Cellar/python3/
set nocompatible              " be iMproved, required
filetype off                  " required
set shell=bash\ -l
set backspace=2
set incsearch
" " set statusline+=%#warningmsg#
" " set statusline+=%{SyntasticStatuslineFlag()}
" " set statusline+=%*
set laststatus=2
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
" On-demand loading
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-ruby/vim-ruby'
Plug 'mileszs/ack.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'stanangeloff/php.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mhartington/oceanic-next'

" Initialize plugin system
call plug#end()
" " set runtimepath^=~/.vim/bundle/ctrlp.vim
set mouse=a
set cf clipboard+=unnamed
set textwidth=130 colorcolumn=131,132,133,134,135,136,137,138,139,140,141
set rtp+=/usr/local/opt/fzf
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
let g:go_ighlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let vim_markdown_preview_github=1
let g:go_fmt_command = "goimports"
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:neocomplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
autocmd BufNewFile,BufRead Jenkinsfile   set syntax=groovy

" " Apperance settings: line number, highlight search color and tags.
set number
set hlsearch
" " set t_Co=256
set completeopt-=preview
set tags=./.tags;,~/.vimtags;./tags
" " set termguicolors
let macvim_skip_colorscheme=1
" " let g:tender_lightline = 1
" " Schema and colors
" " set background=dark
" " Enabling Ruby extension.
set nocompatible      " We're running Vim, not Vi!
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
colorscheme OceanicNext

" " Key mappings
nmap <F8> :TagbarToggle<CR>
nmap <F10> :UpdateTags<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <F7> :tabnew<CR>
nmap <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nmap <F5> :lclose
nmap <Leader>1 1gt
nmap <Leader>2 2gt
nmap <Leader>3 3gt
nmap <Leader>4 4gt
nmap <Leader>5 5gt
nmap <Leader>6 6gt
nmap <Leader>7 7gt
nmap <Leader>8 8gt
nmap <Leader>9 9gt
nmap <Leader>0 :tablast<CR>
nmap <Leader>g :GoBuild<CR>
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" noremap (only normal mode)
nnoremap <leader>l        :set list!<CR>
nnoremap t[               :tabprevious<CR>
nnoremap t]               :tabnext<CR>
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
map <c-a> :w<CR>
nmap <Leader>n :NERDTreeFind<CR>
map <leader>h :set hlsearch!<cr>
nmap <Leader>gb :Gblame<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-p> :FZF<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" " LightLine config
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 1)<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
" " imap <Tab> <Plug>snipMateNextOrTrigger
" [Files] Extra options for fzf
"   e.g. File preview using Highlight
"        (http://www.andre-simon.de/doku/highlight/en/highlight.html)
let g:fzf_files_options =
  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"!":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }
" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
