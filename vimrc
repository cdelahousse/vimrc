" Christian Delahousse's vimrc
" http://christian.delahousse.ca
" http://github.com/cdelahousse
" Last updated: 2013-11-30
"
" Note: g:my_vim_path references the folder where this file and other my other
" vim settings are located This was to be able to contain everything in one
" directory to ease deploying my vimrc to multiple machines

" TODO:
" * Fix Colemak plugin bindings
" * Fix QWERTY bindings
" * Make bracket matching less obvious
" * Make search results more obvious
" * Learn EasyMotion
" *	Figure out ways to highlight/change colour the words TODO, XXX, todo, etc...
" * ["FIXME", "TODO", "XXX", "todo", "xxx", "TODO:",  "NOTE:", "note:", "note", "NOTE", "NB", "xxx:", "XXX:", "todo:"]
" * Find remapping for $ and 0. These are hard to reach. Candidates: L
" * Macvim font sizes
" * fix nerdtree bindings with colemak

"--------------------------------------------
"/ ------------ VUNDLE SETTINGS -------------
"--------------------------------------------
"- Keep these settings at the top of vimrc --
"--------------------------------------------
set nocompatible "For Vundle
Bundle 'gmarik/vundle'

"Colour schemes
Bundle 'Solarized'
Bundle 'jnurmine/Zenburn'


Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'matchit.zip'
Bundle 'mattn/emmet-vim'
Bundle 'buftabs'
Bundle 'gregsexton/MatchTag.git'
Bundle 'editorconfig/editorconfig-vim'

"Syntax Highlighting
Bundle 'groenewege/vim-less'
Bundle 'nono/vim-handlebars'

"Modified Indexed search. Removed mappings.
Bundle 'cdelahousse/IndexedSearch.git'

"Disables hjkl because character-wise movements are for pussies
Bundle 'wikitopian/hardmode.git'

"TODO Figure out
"Bundle 'ervandew/supertab'
"Bundle 'Shougo/neocomplcache'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Command-T' ----> apperently ctrlp is better

"-------------------------
"/------- COLEMAK --------
"-------------------------
"I type colemak. Theses are my remappings. Keys pairs ek and nj are swapped.
" h <==
" n down
" e up
" l ==>

" k end of word
" j next search result

"Could use the following command instead of the Colemak() function,
"but but langmap breaks plugins.
"set langmap=nj,jn,ek,ke

function! Colemak()

  nnoremap n gj
  vnoremap n gj
  onoremap n j

  noremap N J
  " Keep the cursor in place while joining lines (from github/sjl)
  nnoremap N mzJ`z

  noremap j n
  nnoremap j nzzzv
  nnoremap J Nzzzv

  nnoremap e gk
  vnoremap e gk
  onoremap e k

  noremap k e
  noremap K E

  "-------
  "Windows
  "-------
  nnoremap <C-w>n <C-w>j
  nnoremap <C-w>e <C-w>k

endfunction

call Colemak()

"-------------------------
"/------- QWERTY --------
"-------------------------
"For QWERTY users
function! Qwerty()
  nnoremap n nzzzv
  nnoremap N Nzzzv

  "For long lines. Cursor goes down at line wrap instead of line end
  nnoremap j gj
  nnoremap k gk

  " Keep the cursor in place while joining lines " (from github/sjl)
  nnoremap J mzJ`z

endfunction

"call Qwerty()

"----------------------------------------
"/------- GENERAL CONFIG SETTINGS -------
"----------------------------------------

let mapleader = ","

"filetype on - VUNDLE needs this off, see system vimrc
filetype plugin on

set ttyfast "for fast terminal connection, more characters sent to screen
set shellslash " Set the forward slash to be the shell slash
set hidden "Buffers can live in background
set virtualedit=onemore " allow for cursor to go beyond last character
set viminfo+='1000,f1,:1000,/1000  "Sets bigger viminfo file.
set history=100 "sets :command history
set autochdir "Change cwd to current file whenever a window change happens

"----------------------------------------------
"/ -------------- EDITING  --------------------
"----------------------------------------------

set autoread  "Reload files changed outside vim
set wrap "wrap text
set linebreak "wrap lines at convenient points
set textwidth=80 "hard line breaks at this number
set colorcolumn=+1 " highlight column after 'textwidth'

filetype indent on

set smarttab " insert tabs line according to shiftwidth, not tabstop
set autoindent " always set autoindenting on
set smartindent "Indents smartly for c-like languages
set copyindent " copy the previous indentation on autoindenting
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set shiftround "use multiple of shiftwidth when indenting with '<' and '>'

set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

set expandtab     " expant tabs to spaces
set tabstop=2     " tab width (<tab>)
set softtabstop=2 " Generally a good idea to keep this the same as shiftwidth
set shiftwidth=2  " amount of columns for indentation

set virtualedit=block "Allow cursor to move freely in block visual mode

"-----------------------------
"/ -------- SEARCHING --------
"-----------------------------

"Case smart searching - see http://items.sjbach.com/319/configuring-vim-right
set ignorecase
set smartcase "Case sensitive search for important boundary cases
set hlsearch "Hightlight and incremental search
set incsearch
set wrapscan " set the search scan to wrap lines

"--------------------------------
"/ ------ BACKUP AND SWAP -------
"--------------------------------

set backup "Enable backups

if v:version >= 700
  set undofile "persistent undo
endif

if has("unix") || has("Darwin")
  "On windows, $TEMP is already defined, but not in linux/unix/OSX
  let $TEMP = '~/tmp,/tmp'
endif

"Setting swap and backup dir to system temp. I hate ~ files
set backupdir=$TEMP//
set directory=$TEMP//
set undodir=$TEMP//

"-------------------------------------------------
" ------ UNIX and LINUX Specific settings --------
"-------------------------------------------------
if has('unix')
  "Make :! (ie. the bash command) work in interactiv mode
  set shellcmdflag=-ic
endif

"-------------------------------------------------
" ------------- M$ Windows settings --------------
"-------------------------------------------------

" using gVIM with Cygwin on a Windows PC
if has('win32')
  source $VIMRUNTIME/mswin.vim
  behave mswin

  "Cygin as shell
  set shell=c:\\cygwin\\bin\\bash.exe shellcmdflag=-c shellxquote=\"
endif

"---------------------------------------------
"/ -------- GENERAL GUI SETTINGS -------------
"---------------------------------------------

syntax enable "Syntax highlighting

set ruler "Shows colums, rows, percentage of location in file. Like g-Ctrl-G
set showcmd " Show the current command
set showmode " Show the current mode
set visualbell "Removes beeping
set cmdheight=1 "The command-line bar height (default = 1)
set laststatus=2 "Always display status line

set number
set numberwidth=1 "min line number width

set scrolloff=12 "Viewport scroll X lines before cursor hits a side
set scroll=9 "Scroll up and down by how many lines using CTRL-D and CTRL-U
set helpheight=29
set winminheight=0 " windows can be 0 line high

"EXAMPLE ~/Dropbox/config/vim/vimrc   Line:269/595 [45%] Col:0 Buf:2 [0][0x0]
set statusline=%F\ %m\ %r\ Line:%l/%L\ [%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

set wildmenu "autocompletion menu when  <tab> is pressed
"wildmenu completion, list matches, then longest common part, then all.
set wildmode=list:longest,full
" ignores extensions on expansion/completion
set wildignore+=.git

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

set showmatch " set show matching parenthesis
set matchtime=1 "showmatch time

" Use the same symbols as TextMate for tabstops and EOLs. Useful for
" :set list! See Mapping below
set listchars=tab:»\ ,eol:¬

"Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

set background=dark

"-------------------------------------------------
"/ ------- FOR GVIM AND WHILE GUI is RUNNING -----
"-------------------------------------------------

if has('gui_running')
  colorscheme solarized

  set lines=48 columns=100 "set initial windows size

  "Remove gui cruft
  set guioptions-=m
  set guioptions-=a
  set guioptions-=t
  set guioptions-=T

  " Set up the gui cursor to look nice. Only work in gVim
  "http://www.derekwyatt.org/vim/the-vimrc-file/my-vimrc-file/
  set guicursor=n-v-c:block-Cursor-blinkon0
  set guicursor+=ve:ver35-Cursor
  set guicursor+=o:hor50-Cursor
  set guicursor+=i-ci:ver25-Cursor
  set guicursor+=r-cr:hor20-Cursor
  set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

  if has("win32")
    set guifont=Consolas:h11:cANSI
  elseif has("mac")
    set guifont=Menlo\ Regular:h18
  elseif has("unix")
    set guifont=Monospace\ 11
  endif

  "Invisible character colors -- Tabs and EOL
  highlight NonText guifg=#5a5a65
  highlight SpecialKey guifg=#5a5a65

  "highlight current line
  set cursorline

"--------------------------------------------
"/ --------- FOR TERMINAL EMULATORS ---------
"--------------------------------------------

else "if &term=~"^xterm" || &term=~'rxvt-cygwin-native'

  "Set terminal to 256 colors
  "Keep this on top of colorscheme
  " set t_Co=256

  "disable Background Color Erase (BCE) so that color schemes
  "render properly when inside 256-color tmux and GNU screen.
  "http://snk.tuxfamily.org/log/vim-256color-bce.html
  "http://sunaku.github.io/vim-256color-bce.html
  set t_ut=

  colorscheme zenburn

  "Change the zenburn seach highlights
  highlight Search ctermfg=234 ctermbg=243

  set mouse+=a "enable mouse

  "Highlight line in insert mode
  set nocursorline
  autocmd InsertLeave * set nocursorline
  autocmd InsertEnter * set cursorline
  highlight  CursorLine ctermbg=238 cterm=none

  "For Mintty
  "http://code.google.com/p/mintty/wiki/Tips

endif


"---------------------------------------------------
"/ ------- MODIFIED DEFAULT MAPPINGS --------------
"---------------------------------------------------

" Switches : to ;. Saves alot of keystrokes
" Normal mode only
nnoremap ; :

"<space> a turns off highlighting
nnoremap <silent> <space> :nohlsearch<Bar>:echo<CR>
"can't map to <esc> because of wierd control characters

"F1 always gets in the way of ESC
nnoremap <F1> <NOP>

"Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Q is ex mode, which I never use but always accidentally enter
nnoremap Q <NOP>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"allow deleting selection without updating the clipboard (yank buffer)
"http://www.pixelbeat.org/settings/.vimrc
nnoremap x "_x
nnoremap X "_X

"Keep jump in middle of window on search
"https://bitbucket.org/sjl/dotfiles/src/ef5962b5abed/vim/.vimrcw
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g; g;zz
nnoremap g, g,zz

"---------------------------------------------------------------
"/ ---------- MAPPINGS FOR INTERESTING FUNCTIONALITY -----------
"---------------------------------------------------------------

"delete buffer
nnoremap <leader>b :bd!<CR>

"Make
nnoremap <leader>sm :w<CR>:make<CR>

""In insertmode, escape when jj or kk is pressed. It's a common
""sequence in normal mode but never in insert more.
inoremap jj <ESC>gj
inoremap kk <ESC>gk
inoremap hh <ESC>h

"TODO FIX
"Write to new line without exiting insert mode or breaking current line
"https://bitbucket.org/sjl/dotfiles/src/ef5962b5abed/vim/.vimrc
inoremap <c-cr> <esc>A<CR>

"Creates nicely spaced and completed brackets.
inoremap {<CR>  {<CR>}<Esc>ko
inoremap (<CR>  (<CR>)<Esc>ko

"New line without entering insert mode
nnoremap <S-CR> o<Esc>k
nnoremap <CR> ko<Esc>j

"Source vimrc
nnoremap <leader>ss :source $MYVIMRC<CR>

"Edit vimrc
execute "nnoremap <leader>se :e " . g:my_vim_path . "/vimrc<CR>"

"Search and replace word under cursor
:nnoremap <Leader>sr :%s/<C-r><C-w>//gc<Left><Left><Left>

"For switching between the normal terminal and tmux
" nnoremap <leader>sx  :set term=screen-256color<CR>
" nnoremap <leader>sg  :set term=xterm-256color<CR>

"redraw screen
nnoremap <leader>sd :redraw!<cr>

"toggle `set list`: Displays EOL and Tabs
nnoremap <Leader>sl :set list!<CR>

" Bash like keys for the command line"
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"Move lines up and down using
"http://vim.wikia.com/wiki/Moving_lines_up_or_down_in_a_file
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

"Access system clipboard
nnoremap <leader>p  "+p
nnoremap <leader>Y  "+y$
nnoremap <leader>yy "+yy
vnoremap <leader>y  "+y

"Windows binding for pasting in insertmode
inoremap <C-v>  <C-r>+

" Split line (sister to [J]oin lines)
" from github/sjl
nnoremap S i<CR><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" sudo write
ca w!! w !sudo tee >/dev/null "%"

" Change buffer and the clear the command line (for buftab plugin) using <silent>
" This mapping conflicts with default mapping of moving cursor to top and bottom of the
" screen... But that's OK...
nnoremap <silent> <S-H> :bp<CR>
nnoremap <silent> <S-L> :bn<CR>

"Auto Close Tags
"TODO Check out rag tag
iabbrev </ </<C-X><C-O>

"---------------------------------------------------
"/ --------------- TEXT EXPANSION ------------------
"---------------------------------------------------

"Current date yyyy/mm/dd HH:MM:SS
iabbrev ydate <c-r>=strftime("%Y/%m/%d %H:%M:%S")<CR>
"Current date yyyy/mm/dd
iabbrev xdate/ <c-r>=strftime("%Y/%m/%d")<CR>
iabbrev xdate- <c-r>=strftime("%Y-%m-%d")<CR>

"Filename
iabbrev fn/  <c-r>=expand('%:t:r')<CR>

"Text Expansion
iabbrev gh/ http://github.com/cdelahousse
iabbrev cd/ http://christian.delahousse.ca

"Write date in CMDline (for filename)
cmap <F9> <C-R>=strftime("%Y-%m-%d")<CR>

"Close open tags with </w
iabbrev </ </<C-X><C-O>

"---------------------------------------------------
"/ ------------ MAPPINGS FOR PLUGINS ---------------
"---------------------------------------------------

"Defaul easymotion keybinding: <leader><leader>
let g:EasyMotion_leader_key = '<leader><leader>'

" NerdCommenter (NOTES)
"[count]<leader>cy- Like cc except that the commented line(s) are yanked first.
"<leader>c$ - Comments the current line from the cursor to the end of line.

"---------------------------------------------------
"/ -------------- PLUGIN SETTINGS ------------------
"---------------------------------------------------


"Enable neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" Remember the awesomeness of ragtag CX-<Slash>
let g:ragtag_global_maps = 1 "For Ragtag

"Bufftabs directory and file name only
let g:buftabs_only_basename=1

" Add spaces before comments text
let g:NERDSpaceDelims=1

"Add JSDoc to nerdCommenter
let g:NERDCustomDelimiters = {
    \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' } }

"TODO: Fix this
" \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' }
" \ 'handlebars': { 'left': '{{!', 'right': '}}'} }

"---------------------------------------------------
"/ ------ ENCODINGS AND FILE FORMATS SETTINGS ------
"---------------------------------------------------

set fileformat=unix  
set encoding=utf-8

"---------------------------------------------------
"/ ------ FILETYPE SPECIFIC STUFF -----------------
"---------------------------------------------------
"see here for example http://amix.dk/blog/post/19021
"" Enable omni completion.
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"Prolog
autocmd BufRead,BufNewFile   *.pl set filetype=prolog

"Make
autocmd FileType make setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

"Handlebars
autocmd BufRead,BufNewFile   *.hbs setlocal filetype=handlebars

"Git Commit messages
"http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
autocmd FileType gitcommit set textwidth=72

"/ ------ TEXT FILES -----

"Recognize markdown files
autocmd BufRead,BufNewFile   *.md setlocal filetype=markdown
autocmd BufRead,BufNewFile   *.txt setlocal filetype=text

function! SetTextOptions()
  setlocal spell
  setlocal spelllang=en
  setlocal textwidth=80
  setlocal expandtab
endfunction

"Register options
autocmd Filetype text,markdown call SetTextOptions()

"/ ------ SCHEME ---------

"http://docs.racket-lang.org/guide/Vim.html
au BufReadPost *.rkt,*.rktl,*.scm set filetype=scheme

function! SetLispySettings()
  setlocal lisp
  setlocal autoindent
  setlocal lispwords+=public-method,override-method,private-method,syntax-case,syntax-rules
  setlocal lispwords+=..more..
endfunction

autocmd Filetype scheme call SetLispySettings()

"------------------------------------------
"/ ---- SETTINGS FOR LOCAL MACHINE --------
"------------------------------------------
"Keep near bottom of vimrc

if filereadable(glob("~/.vimrc.local"))
  "Keep settings you only want stored on this machine
  source ~/.vimrc.local
endif

