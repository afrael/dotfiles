set nocompatible
filetype off

" Make sure we are always utf-8
setglobal termencoding=utf-8 fileencodings=
scriptencoding utf-8

autocmd BufNewFile,BufRead  *   if &modifiable 
autocmd BufNewFile,BufRead  *       set encoding=utf-8
autocmd BufNewFile,BufRead  *   endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'atweiden/vim-dragvisuals'
Plug 'mkitt/tabline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] } "Loads only when opening NERDTree
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'nixon/vim-vmath'
Plug 'mkitt/tabline.vim'

call plug#end()


" Unused for now
" Plug 'yggdroot/indentline'
" Plug 'tpope/vim-capslock'
" Plug 'othree/xml.vim'
" Plug 'tpope/vim-markdown'
" Plug 'tpope/vim-jdaddy'
" Plug 'tpope/vim-surround'
" Plug 'godlygeek/tabular'
" Plug 'scrooloose/syntastic'
" Plug 'myusuf3/numbers.vim'
" Plug 'ryanoasis/vim-devicons'
" Plug 'jceb/vim-orgmode'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'

"Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

let $TMP="~/tmp/"

" no backups
set nobackup

" no swap files
set noswapfile

" don't write backups
set nowritebackup

" change automatically to current dir
set autochdir

" set backup directory
set backupdir=~/.vim/backup

" Switch on syntax highlighting
syntax on
syntax enable

" Hide the mouse pointer while typing
set mousehide

" tabs are 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround
set smarttab

" set the statusline
set laststatus=2

" turn on line numbers
set number
set numberwidth=5

"show commandline
set showcmd

" command line completion
set path+=**
set wildmenu
set wildmode=list:longest,full

" no beeping
set visualbell

" Don't update the display while executing macros
set lazyredraw

set showmatch

" Printing options
set printoptions=header:0,duplex:long,paper:letter

" shows the mode that vim is currently in
set showmode

" turn on incremental search
set incsearch

" set the search scan to wrap lines
set wrapscan

" highlight pattern matches
set hlsearch

" set buffer for history commands and undo
set history=1000
set undolevels=1000

" make sure that unsaved buffers that are put in bg stay there
set hidden

" show hidden chars
set listchars=eol:$,tab:->,trail:~,extends:>,precedes:<

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 90 chars
set textwidth=90
set formatoptions-=cro
set wrapmargin=2
set nowrap

" Case-sensitive if has caps
set ignorecase smartcase

" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=1

" hide vim welcome screen
set shortmess+=I

" make the cw and like commands put a $ at the end instead of deleting the
" text
set cpoptions=ces$

" set the unnamed register to the clipboard
set clipboard+=unnamed

" Set folds by syntax
set foldmethod=syntax
set foldnestmax=10
set foldenable
set foldlevelstart=10

" spacegray configuration
" let g:spacegray_underline_search = 1
set termguicolors

" Set split window default
set splitbelow
set splitright

" Automatically :write before running commands
set autowrite

" Set terminal colors and encoding
set t_co=256
set encoding=utf8

" Set the color column to +5 the textwidth
set cc=+5

" Attempt to fix autoindent
set autoindent
set smartindent

" Visual selections will be square
set virtualedit=block

" Match angle brackets
set matchpairs+=<:>,?:?

" Misc features

" set relative line number
set relativenumber

" set title in title bar
set title
set titleold=

" Save buffers automatically
set autowrite

" Save buffer every 10 chars
set updatecount=10

" Reload on external changes
set autoread

" Past autoindents, line boundaries and past start insertions
set backspace=indent,eol,start

" File formats
set fileformats=dos,unix,mac

" Adjust completions to match case
set infercase

" Syntax max column is 512
set synmaxcol=512

" Fix common errors on the fly
iab    retrun  return
iab     pritn  print
iab       teh  the
iab      liek  like
iab  liekwise  likewise
iab      moer  more
iab  previosu  previous
iab       adn  and

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
"

if has("gui_running")
   set macligatures
   set guifont=FiraCode-Retina:h14
   set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:2,taamode:1,level:0.5
   if !exists("g:vimrcloaded")
      " uncomment to start maximized 
      winsize 124 46
      let g:vimrcloaded = 1
  endif
  if has("gui_win32")
    set guioptions-=T
    set guicursor+=n-v-c:blinkon0,sm:hor30-Cursor,i-ci:ver25-Cursor/lCursor-blinkwait30-blinkoff100-blinkon100
    highlight Cursor guifg=white guibg=black
    highlight iCursor guifg=white guibg=steelblue
    " set guioptions=icpM
    " set renderoptions=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
  endif
else
    set termencoding=utf8
    set term=xterm
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

if !empty($CONEMUBUILD)
    set guifont=Fira_Code_Light:h14
    set termencoding=utf8
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif  

" " Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

colorscheme dracula

" Configure Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

if !empty($CONEMUBUILD)
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
endif

" Rainbow parentheses configuration
let g:rainbow#max_level = 24
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]

augroup rainbow_parens
    autocmd!
    autocmd FileType * RainbowParentheses
augroup END

" git-gutter
let g:gitgutter_eager = 0
let g:gitgutter_enabled = 1
let g:gitgutter_max_signs = 1000

" Vim
let g:indentLine_color_term = 239

"GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Use persistent undo
if has('persistent_undo')
    set undodir=$HOME/.VIM_UNDO_FILES
    set undolevels=5000
    set undofile
endif

" Disable JSON Conceal
let g:vim_json_syntax_conceal = 0
let g:indentLine_concealcursor=""

" Leader configuration
let mapleader = ","
let maplocalleader = "\\"

"-----------------------------------------------------------------------------
" Set up keyboard mappings
"-----------------------------------------------------------------------------

" cd to the dir containing the file in the buffer
nnoremap <silent> <Leader>cd :lcd %:f<CR>

" edit the vimrc file
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>

" shortcuts for delete
nnoremap <silent> <Leader>d dd
nnoremap <silent> <Leader>c ddO

" map H and L to the beggining and EOL
nnoremap H ^
nnoremap L $

" Map folding to F9
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Remove arrow key mappings - HARDCORE!
"inoremap <Left> <nop>
"inoremap <Right> <nop>
"inoremap <Up> <nop>
"inoremap <Down> <nop>
"nnoremap <Left> <nop>
"nnoremap <Right> <nop>
"nnoremap <Up> <nop>
"nnoremap <Down> <nop>

" Dragvisuals mappings
vmap <expr> <S-LEFT> DVB_Drag('left')
vmap <expr> <S-RIGHT> DVB_Drag('right')
vmap <expr> <S-UP> DVB_Drag('up')
vmap <expr> <S-DOWN> DVB_Drag('down')
vmap <expr> D DVB_Duplicate()
let g:DVB_TrimWS=1

" vmath mappings
vmap <expr> ++ VMATH_YankAndAnalyse()
nmap        ++ vip++

" NerdTree Plugin Settings
nnoremap <F7> :NERDTreeToggle<cr>
nnoremap <S-F7> :NERDTreeClose<cr>
let NERDTreeShowBookmarks=1

" Set shortcut to clear search highlights
nmap <Leader><space> :nohlsearch<cr>

" Set shortcut to clear search highlights
nmap <Leader>mp :MarkdownPreview<cr>

" Set shortcut to clear search highlights
nmap <Leader>smp :MarkdownPreviewStop<cr>
"
" Map leader j to jq tool (needs jq tool installed) 
nnoremap <silent> <Leader>js :%!jq . <CR>

" Map numbers.vim toggles
" nnoremap <F3> :NumbersToggle<CR>
" nnoremap <F4> :NumbersOnOff<CR>

" Map tabularize shortcuts
" if exists(":Tabularize")
"     nmap <Leader>a= :Tabularize /=<CR>
"     vmap <Leader>a= :Tabularize /=<CR>
"     nmap <Leader>a: :Tabularize /:\zs<CR>
"     vmap <Leader>a: :Tabularize /:\zs<CR>
" endif

" Shortcut for :%s/.../.../g
" nmap S  [Shortcut for :s///g]  :%s//g<LEFT><LEFT>
" vmap S                         :Blockwise s//gLEFT><LEFT>
"   
" nmap <expr> M  [Shortcut for :s/<last match>//g]  ':%s/' . @/ . '//g<LEFT><LEFT>'
" vmap <expr> M                                     ':s/' . @/ . '//g<LEFT><LEFT>'
 
" Shortcut for selection whole file
vmap aa VGo1G
 
" Make backspace/delete work in visual mode
vmap <BS> x

" Syntastic Recommended settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Uncomment to start maximized
" autocmd GUIEnter * simalt ~x
