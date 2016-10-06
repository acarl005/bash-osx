set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'Townk/vim-autoclose.git' " auto add matching bracket or quote when you type one
Plugin 'jelera/vim-javascript-syntax' " better js highlighting
Plugin 'elzr/vim-json' " better json highlighting 
Plugin 'terryma/vim-multiple-cursors' " sublime-text-like mutli cursors
Plugin 'tpope/vim-surround' " manipulates surrounding brackets and quotes
Plugin 'kchmck/vim-coffee-script' " coffeescript syntax highlighting
Plugin 'scrooloose/syntastic' " inline syntax checker
Plugin 'kien/ctrlp.vim' " fuzzy searching for files
Plugin 'Yggdroot/indentLine' " adds a little grey line at each indentation level
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter' " adds keybindings for easily commenting out lines \c<space> to toggle
Plugin 'AndrewRadev/splitjoin.vim'

" a pretty status line 
" requires installation of this font package on OSX:
" https://github.com/powerline/fonts
" this font must be chosen for the terminal as well
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'kana/vim-textobj-user' " plugin for defining custom text objects
Plugin 'glts/vim-textobj-comment' " binds a text object to c for comments
Plugin 'nelstrom/vim-textobj-rubyblock' " binds a text object to r for ruby blocks
Plugin 'michaeljsmith/vim-indent-object' " binds a text object to i for an indentation level (good for python)
Plugin 'zandrmartin/vim-textobj-blanklines' " text obj for blank lines to <space>
Plugin 'sgur/vim-textobj-parameter' " text obj for a function param to ,

Plugin 'NLKNguyen/papercolor-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on " enable syntax highlighting
" Use dark color theme after 5pm and light color theme in the morning
colorscheme pablo
colorscheme PaperColor
if strftime('%H') > 16
  set background=dark
elseif strftime('%H') < 7
  set background=dark
else
  set background=light
endif

" a matching extension for things like ruby blocks
runtime macros/matchit.vim

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8


set showcmd " Display commands in the bottom right corner as they are typed
set nobackup " Disable backup
set nowritebackup
set noswapfile
set autoread " Auto read when a file is changed from the outside
set expandtab " convert tab to spaces
set shiftwidth=2
set softtabstop=2
set relativenumber " line numbers are relative to where the cursor is
set number " line numbers
set autoindent
set smartindent
set ignorecase " searches are case insensitive
set smartcase " searches become case sensitive when you enter capital letters
set hlsearch " highlight the current search term
set incsearch " highight search incrementally
set clipboard=unnamed " the vim clipboard is be the same as the system clipboard
set backspace=indent,eol,start " enable backspace button
set scrolloff=15 " vim will automatically adjust viewport to leave at least 15 lines above and below cursor when possible
set wildignore=*/node_modules/*,*.swp,*.zip,*/dist/*
set nofoldenable " disables code folding, because its confusing and I can't find decent docs on it

" configure the status line
set laststatus=2 " always show the status bar

" these manually configure a nice status line. they are not necessary when
" powerline is installed
"set statusline=   " clear the statusline for when vimrc is reloaded "
"set statusline=%f " show filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'},%{&ff}]  " show encoding
"set statusline+=%h%m%r%y
"set statusline+=%= " right align
"set statusline+=%c,%l/%L@%P\  " show column, line, line-count, and percent from top of file
"set statusline+=%b,0x%-8B\                   " current char

" syntastic options
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_mode_map = { "mode": "passive" }
let g:jsx_ext_required = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" dont hide double quotes using vim-json
set conceallevel=0
let g:vim_json_syntax_conceal = 0

let g:omni_sql_no_default_maps = 1

" custom key mappings
" when in insert mode, insert line above
imap <nowait> <C-l> <C-c>O
" insert console.log (alt+c)
imap <nowait> ç console.log()<ESC>i
" pretty format for a JSON file. just press =j
nmap =j :%!python -m json.tool<CR>
" open new tab
map <nowait> <C-t> :tabe<CR>
" remove all trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" select the freshly pasted text
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"

command Conf :tabe ~/.vimrc
"command Trim :%s/\s\+$//g
command Trim :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s

" convert 4-space indentation to 2-space
command Dedent call Dedent()
function! Dedent()
  set ts=4 sts=4 noet
  retab!
  set ts=2 sts=2 et
  retab
endfunction

