" This configuration is intended to be used with neovim!

" Install vim-plug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins used
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'                       " Sensible defaults for vim
Plug 'kien/ctrlp.vim'                           " Fuzzy file search
Plug 'airblade/vim-gitgutter'                   " Git gutter for all of us
Plug 'tpope/vim-fugitive'                       " Because git in vim
Plug 'majutsushi/tagbar'                        " Tag bar
Plug 'scrooloose/nerdcommenter'                 " Nerd commenter

" Auto-complete functionality
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }               " Auto-complete for NeoVim
Plug 'zchee/deoplete-jedi', { 'for': 'python' }                             " Python auto-complete module for Deoplete
Plug 'zchee/deoplete-go', { 'do': 'make' }                                  " Go auto-complete
Plug 'ervandew/supertab'                                                    " Auto-completition with <TAB>
Plug 'SirVer/ultisnips'                                                     " Snippets

" Linting
Plug 'neomake/neomake'                                                      " Asynchronous linter

" IDEs
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }                         " Golang support

" Gruvbox theme
Plug 'morhetz/gruvbox'    
call plug#end()

" Force vim to use english
language en_US
set langmenu=en_US

" General editor settings
set number                                      " show line numbers
set linebreak                                   " break lines at words
set showbreak=+++                               " Prefix for wrapped lines
set textwidth=80                                " Number of cols 
set visualbell                                  " Use visual bell (no beeping here, mister)
set cursorline                                  " Show the current cursor line
set modeline                                    " Enable modelines
set modelines=5                                 " Check the first 5 rows for modelines

" Indents
set autoindent                                  " Auto-indent new lines
set expandtab                                   " Use spaces instead of tabs
set shiftwidth=4                                " Number of auto-indent spaces
set smartindent                                 " Enable smart-indent
set smarttab                                    " Enable smart-tabs
set softtabstop=4                               " Use 4 spaces per tab

" Search
set hlsearch                                    " highlight all search results
set smartcase                                   " Enambe smart-case search
set ignorecase                                  " Be case-insensitive
set incsearch                                   " Do incremental search

" CtrlP settings
let g:ctrlp_match_window='bottom,order:ttb'     " Match files top to bottom
let g:ctrlp_switch_buffer=0                     " Open new files in new buffers
let g:ctrlp_working_path_mode=0                 " let me change the working directory

" Golang configuration
set autowrite                                   " do auto-saving

" keyboard shortcuts for Golang
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>c  <Plug>(go-coverage-toggle)

let g:go_fmt_command = "goimports"

" visual configuration
set background=dark
colorscheme gruvbox
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set statusline=%=&P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode

