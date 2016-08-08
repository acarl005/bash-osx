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

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'git://github.com/Townk/vim-autoclose.git' " auto add matching bracket or quote when you type one
Plugin 'jelera/vim-javascript-syntax' " better js highlighting
Plugin 'https://github.com/terryma/vim-multiple-cursors.git' " sublime-text-like mutli cursors
Plugin 'tpope/vim-surround' " manipulates surrounding brackets and quotes
Plugin 'kchmck/vim-coffee-script'

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

syntax on
" Use dark color theme after 7pm and light color theme in the morning
if strftime('%H') > 18
  colorscheme torte
else
  colorscheme morning
endif
set expandtab " convert tab to spaces
set shiftwidth=2
set softtabstop=2
set relativenumber " line numbers are relative to where the cursor is
set number
set autoindent
set smartindent
set smartcase
set hlsearch " highlight the current search term
set clipboard=unnamed " the vim clipboard is be the same as the system clipboard
set backspace=indent,eol,start " enable backspace button
set scrolloff=15 " vim will automatically adjust viewport to leave at least 15 lines above and below cursor when possible
set wildignore=*/node_modules/*,*.swp,*.zip
set nofoldenable

set laststatus=2 " always show the status bar
set statusline=   " clear the statusline for when vimrc is reloaded "
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set statusline+=%=                           " right align
set statusline+=%b,0x%-8B\                   " current char


" CtrlP options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" custom key mappings
imap <nowait> <C-l> <C-c>O
" pretty format for a JSON file. just press =j
nmap =j :%!python -m json.tool<CR>

