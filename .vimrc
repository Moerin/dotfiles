" Vimrc configuration file
" Version : 2015-02

" Vundle configuration
"-----------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle management (for updates)
Plugin 'gmarik/vundle'

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
" Plugin 'davidhalter/jedi-vim'

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

filetype plugin indent on

" YouCompleteMe setup
" ----------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in strings

" NERDTree setup
" ----------------------------------
" Ignore files
let NERDTreeIgnore = ['\.pyc$']
" AutoClose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" UltiSnips
" ----------------------------------
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

" Vim indent guide
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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" PythonMode setup
" ----------------------------------
let g:pymode_folding = 0
let g:pymode_rope_completion = 0

" General
" ----------------------------------
syntax on
set background=dark
" colorscheme solarized

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

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

" Definition de l'affichage des caracteres invisibles avec 'set list'
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
"set exrc
"set secure

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

" function
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
