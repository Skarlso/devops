" ./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp
" --enable-python3interp --with-python3-config-dir=/usr/local/Cellar/python3/
set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=2
set incsearch
set statusline+=%#warningmsg#
" " set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
set encoding=utf-8
" " set runtimepath^=~/.vim/bundle/ctrlp.vim
set mouse=a
set cf clipboard+=unnamed
set textwidth=130 colorcolumn=131,132,133,134,135,136,137,138,139,140,141
" turn hybrid line numbers on
set number relativenumber
set nu rnu
set nofixendofline

" All of your Plugins must be added before the following line
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ekalinin/Dockerfile.vim'
Plug 'mileszs/ack.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'plasticboy/vim-markdown'
Plug 'kadekillary/subtle_solo'
Plug 'Valloric/YouCompleteMe'
Plug 'vimwiki/vimwiki', { 'branch': 'master' }
Plug 'kaicataldo/material.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()
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
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab

" " Nerdtree, vim-go settings
let g:ycm_min_num_of_chars_for_completion=99
let g:nerdtree_tabs_open_on_console_startup=0
let g:go_highlight_functions = 1
let g:go_ighlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:vim_markdown_folding_disabled = 1
let g:go_rename_command = 'gopls'
let g:go_fmt_command = "goimports"
" " Apperance settings: line number, highlight search color and tags.
set number
set hlsearch
" " set t_Co=256
set completeopt-=preview
set tags=./.tags,./tags;$HOME

let g:gruvbox_contrast_dark = "soft"
" " set termguicolors
let macvim_skip_colorscheme=1
let g:tender_lightline = 1
let g:onedark_termcolors = 16
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
set termguicolors
" " Schema and colors
syntax on
" " colorscheme onedark
set background=dark
colorscheme onedark
" " colorscheme onedark
" " set background=dark
" " colorscheme one
let g:airline_theme='onedark'
let g:lightline = {}
" " let g:lightline.colorscheme = 'material_vim'
" " let g:neodark#background = '#202020'

" " Enabling Ruby extension.
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set rtp+=/usr/local/opt/fzf

" " Key mappings
nmap <F8> :TagbarToggle<CR>
nmap <F10> :UpdateTags<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <F7> :tabnew<CR>
"" nmap <F4> :execute \"vimgrep \/\" . expand("<cword>") . \"/j **\" <Bar> cw<CR>
noremap <silent> <F4> :let @+=expand("%:p")<CR>
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
map <c-a> :w<CR>
nmap <Leader>n :NERDTreeFind<CR>
map <leader>h :set hlsearch!<cr>
nmap <Leader>gb :Gblame<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-p> :FZF<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" " LightLine config
let g:lightline = {
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
" " noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 1)<CR>
" " noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 1)<CR>
" " noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 1)<CR>
" " noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 1)<CR>
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
let g:fzf_tags_command = 'ctags --sort=yes -R -f .tags'
" Notices .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

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

" Ctrl-r for renaming
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

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

nnoremap <silent> <Leader>a :Ag <C-R><C-W><CR>

" " function! PhpSyntaxOverride()
" "   hi! def link phpDocTags  phpDefine
" "   hi! def link phpDocParam phpType
" " endfunction

" " augroup phpSyntaxOverride
" "   autocmd!
" "  autocmd FileType php call PhpSyntaxOverride()
" " augroup END

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <C-t> :Files<cr>

" " PHP linter settings
let g:ale_php_phpcs_standard="./docroot/phpcs.xml"
let g:ale_php_phpstan_configuration="./docroot/phpstan.neon"
let g:automatic_nested_syntaxes = 1
set re=1
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ }
let g:gutentags_generate_on_new = 1
