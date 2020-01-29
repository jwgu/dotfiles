"====================================================================
" .vimrc
"
" Maintainer:  Jinwei Gu <jwgu@cs.columbia.edu>
" Last change: 04/24/2007

" used for mingw in windows
"let $HOME=$USERPROFILE

"set runtimepath=~/vimfiles,$VIM/vimfiles,$VIMRUNTIME

" set some microsoft mapping, such as c-c c-v c-s c-z c-a c-tab, etc.
"source $VIMRUNTIME/mswin.vim

set history=5000

" set to use viminfo (50 recent files, and use bufferlist)
set viminfo='50,%

" set windows will always have a status line
set laststatus=2
set statusline=%<%f%h%m%r\ \ %{strftime('%I:%M:%S\ %p\ %A')}%=%b\ 0x%B\ \ %l,%c%V\ \ \ %P

" set inserting tab always like inserting spaces
set tabstop=4
set shiftwidth=4
set nosmarttab
set expandtab
set sts=0

" Colorscheme commands to highlight leading tabs and evilspaces (these must go " before your colorscheme command)
":autocmd ColorScheme * highlight LeadingTab ctermbg=blue guibg=blue
":autocmd ColorScheme * highlight LeadingSpace ctermbg=darkgreen guibg=darkgreen
":autocmd ColorScheme * highlight EvilSpace ctermbg=darkred guibg=darkred


set textwidth=72

"" set the height and width of gvim windows
"set lines=60
"set columns=80
"
" show matched bracket
set showmatch
set matchtime=3
set matchpairs+=<:>   "add match for < and >  (HTML)

" syntax highlighting enable
syntax enable

" enable c-indent
" set cin

" set to always start editing with all folds closed
set foldlevelstart=0
set foldmethod=syntax

" set substitue all matches in a line instead of one
"set gd

"set noincsearch

" always send message to recent : command how many lines it changes
set report=0

" set to show full tag
set showfulltag

" set no backup before overwriting a file
set nowritebackup

" always allow backspace
set backspace=start,indent,eol

set visualbell
set winminheight=0

" smartcase means whenever upper case is typed, override the ignorecase option
set ignorecase
set smartcase

set incsearch

set errorformat+="\|\| %*\D>%f(%l) : %*\s%n: %m"

" copy the indent from the current line to next line
set autoindent

" print line number in front of each line
set number

colorscheme desert 

" for moving around windows, maximizing the current one
nmap <C-S-U> <C-W><Up><C-W>_
nmap <C-S-D> <C-W><Down><C-W>_
nmap <C-S-H> <C-W><Left><C-W><
nmap <C-S-L> <C-W><Right><C-W><

" avoid accidentally delete
nmap <S-D> <C-D>
nmap <S-U> <C-U>

" for changing window size
"nmap <F6> <C-W>-
"nmap <F7> <C-W>+
"nmap <F8> <C-W>_  
"nmap <F9> <C-W>=

:nmap ,s :source ~/.vimrc<CR>
:nmap ,v :edit ~/.vimrc<CR>

nmap <F4> :bn<CR>
imap <F4> <Esc><F4>i
nmap <S-F4> :bN<CR>
imap <S-F4> <Esc><S-F4>i
imap <C-TAB> <Esc><C-TAB>i

map ,# :s/^/#/<CR> 
map ,/ :s/^/\/\//<CR> 
map ," :s/^/\"/<CR> 
map ,% :s/^/%/<CR> 
map ,c :s/^\/\/\\|^[#"%!;]//<CR> 

" always set spell on
"set spell


" latex (auctex is a light-weight (and better) version of latex suite)
":autocmd BufRead,BufNewFile *.tex,*.bib runtime! syntax/auctex.vim
":autocmd BufRead,BufNewFile *.tex,*.bib setf tex

" Latex Suite (JInwei Gu. 2012/6/28)
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"

:autocmd BufRead,BufNewFile *.cg,*.fx setf cg

:autocmd BufRead,BufNewFile *.pbrt setf pbrt

filetype indent on

" turn this feature on for HTML macros
filetype plugin on

" set variables for HTML editting
":let g:no_html_tab_mapping = 'yes'
:let g:no_html_toolbar = 'yes'
:let g:html_authorname = 'Jinwei Gu'
:let g:html_authoremail = 'jinweig@nvidia.com'


"==========================================
" tips from the web. for learning purpose
"==========================================
"
" VISUAL MODE Mappings
" wrap <b></b> around visually selected text
:vmap sb "zdi<b><C-R>z</b><ESC>
" wrap /* */ around visually selected text. key here is 
" the use of register "z and i_<C-R>z
:vmap sc "zdi/*<C-R>z*/<ESC>


"== add support for AsciiDoc ==
autocmd FileType mail,text,asciidoc,html setlocal spell spelllang=en
autocmd BufNewFile,BufRead *.txt set ft=asciidoc

"== add support for Asymptote ==
augroup filetypedetect
au BufNewFile,BufRead *.asy setf asy
augroup END
filetype plugin on

"== matlab related ==
"source $VIMRUNTIME/macros/matchit.vim

"autocmd BufEnter *.m compiler mlint


" These are the actual definitions...they should go near the end
" The following is for highlighting leading/trailing spaces/tabs differently.
au Syntax * syn match LeadingTab /^\t\+/ containedin=ALL
au Syntax * syn match LeadingSpace /^\ \+/ containedin=ALL
au Syntax * syn match EvilSpace /\(^\t*\)\@<!\t\+/ containedin=ALL " tabs not preceeded by tabs
au Syntax * syn match EvilSpace /[ \t]\+$/ containedin=ALL " trailing space

au BufNewFile,BufRead CMakeLists.txt runtime! indent/cmake.vim 
au BufNewFile,BufRead CMakeLists.txt set filetype=cmake

execute pathogen#infect()
