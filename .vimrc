" Vimrc configuration file
" Version : 2015-06
" Vundle configuration
"-----------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle management (for updates)
Plugin 'gmarik/Vundle.vim'

" List of bundles (or extensions)
"-----------------------------------
Plugin 'bling/vim-airline'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Align'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'elzr/vim-json'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mhinz/vim-signify'
Plugin 'joonty/vim-taggatron'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
" Plugin 'jistr/vim-nerdtree-tabs'

call vundle#end()
filetype plugin indent on

" Airline setup
"-----------------------------------
set laststatus=2
set statusline+=%{fugitive#statusline()}
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
set t_Co=256
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10

" Vimwiki setup
" ----------------------------------
let g:vimwiki_list=[{'path':'~/.vim/vimwiki'}]

" YCM setup
" ----------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" NERDTree setup
" ----------------------------------
" Ignore files
let NERDTreeIgnore = ['\.pyc$']
" AutoClose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Bookmark
let NERDTreeShowBookmarks=1
" Mirroring between tabs
let NERDTreeMirror=0

" Ultisnips setup
" ----------------------------------
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" Vim-indent-guides
" ----------------------------------
set background=dark
colorscheme solarized
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Function enable indentguide
augroup IndentGuides
    autocmd!
    autocmd VimEnter * IndentGuidesEnable
augroup END

" Syntactic
" ----------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_w = 1
let g:syntastic_python_checkers = ['python', 'pylint', 'pep8']
let g:syntastic_auto_jump = 2 

" Pymode setup
" ----------------------------------
let g:pymode = 0
let g:pymode_folding = 1
let g:pymode_rope_completion = 0
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace() # XXX BREAKPOINT'
let g:pymode_lint = 0
" let g:pymode_lint_write = 0

" Vim taggatron
" ----------------------------------
let g:tagcommands = {
\    "php" : {
\        "tagfile" : "/home/sebastien/workspace/svn/lengow/php.tags",
\        "args" : "-R",
\        "files" : "/home/sebastien/workspace/svn/lengow/"
\    }
\}

let g:pymode = 0
" Signify setup
" ----------------------------------
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" TagBar setup
" ----------------------------------
nmap <F8> :TagbarToggle<CR>

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
 
" Affichage surbrillance recherche
set hlsearch

" Indentation respectant le format de developpement
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Indentation pour python
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" Permet d'utiliser des .vimrc par projets et eviter les commandes dangereuses
set exrc
set secure

" format JSON
command! FormatJSON %!python -m json.tool
 
" Solarized conf
if has("gui_running")
    syntax enable
    set background=dark
    colorscheme solarized
endif

" Xml auto indent command 'gg=G'
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" PHP tags
set tags=~/workspace/svn/lengow/php.tags

" C compilation
set makeprg=make\ -C\ ../build\ -j9
nnoremap <F4> :make!<cr>

" Backspace correction
set backspace=indent,eol,start
