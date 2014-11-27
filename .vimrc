" Vimrc configuration file
" Version : 2014-10

" Vundle configuration
"-----------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle management (for updates)
Bundle 'gmarik/vundle'

" List of bundles (or extensions)
"-----------------------------------
Bundle 'bling/vim-airline'
Bundle 'vimwiki/vimwiki'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/Align'
Bundle 'mattn/emmet-vim'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'klen/python-mode'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'joonty/vdebug.git'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'

" Airline setup
"-----------------------------------
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
set t_Co=256

" Vimwiki setup
" ----------------------------------
let g:vimwiki_list=[{'path':'~/.vim/vimwiki'}]

filetype plugin indent on

" YouCompleteMe setup
" ----------------------------------
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" let g:ycm_path_to_python = '/usr/bin/python2'

" Jedi Setup
"-----------------------------------
let g:jedi#rename_command = "<leader>R"

" NERDTree setup
" ----------------------------------
"  Ignore files
let NERDTreeIgnore = ['\.pyc$']
" AutoClose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" SuperTab setup
" ----------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"

" General
" ----------------------------------
syntax on

" Shortkeys loading
"-----------------------------------
execute 'source ' . $HOME . '/.vim/shortkeys.vim'

" Affichage des numeros de ligne
set number
highlight LineNr ctermbg=darkblue ctermfg=gray

" Longueur maximale de lignes
set textwidth=80

" Surligne la colonne du dernier caractere autorise par textwidth
set cc=+1

" Definition de l'affichage des caracteres invisbles avec 'set list'
" set listchars=nbsp:

" Indentation respectant le format de developpement
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Permet d'utiliser des .vimrc par projets et eviter les commandes dangereuses
set exrc
set secure
