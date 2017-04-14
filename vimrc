" Christian Delahousse's vimrc
" http://christian.delahousse.ca
" http://github.com/cdelahousse
" Last updated: 2015-08-03
"
" TODO:
" * Fix search blink
" * Search and replace highlighting
" * Learn EasyMotion
" * Ack.vim or Ag.vim
" * Look into Hard Mode
" * Vim Smooth Scroll
" * Comments formatting.
" * Figure out ways to highlight/change colour the words TODO, XXX, todo, etc...
"   ["FIXME", "TODO", "XXX", "todo", "xxx", "TODO:",  "NOTE:", "note:",
      "note", "NOTE", "NB", "xxx:", "XXX:", "todo:"]
" * Find remapping for $ and 0. These are hard to reach. Candidates: L

"--------------------------------------------
"/ ------------ VUNDLE SETTINGS -------------
"--------------------------------------------
"- Keep these settings at the top of vimrc --
"--------------------------------------------

" Required for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle/')

Plugin 'VundleVim/Vundle.vim'

"Colour schemes
Plugin 'Solarized'
Plugin 'jnurmine/Zenburn'

"Syntax Highlighting and indenting
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

"Plugins
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'matchit.zip'
Plugin 'bling/vim-bufferline'
Plugin 'jceb/vim-orgmode'
"Match tags
Plugin 'gregsexton/MatchTag.git'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bkad/CamelCaseMotion'
"Most Recently used
Plugin 'yegappan/mru'
Plugin 'wincent/command-t'
Plugin 'hhvm/vim-hack'
Plugin 'flowtype/vim-flow'
Plugin 'SirVer/ultisnips'
" Gutter SCM changes
Plugin 'mhinz/vim-signify'
" Terminal intergration: bracketed paste, autofocus events, mouse, bar cursor
Plugin 'wincent/terminus'

" UtilSnips snippeds
Plugin 'honza/vim-snippets'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'

"Modified Indexed search. Removed mappings.
Plugin 'cdelahousse/IndexedSearch.git'

"Disables hjkl because character-wise movements are for pussies
Plugin 'wikitopian/hardmode.git'

" PEP8 Python indenting
Plugin 'vim-scripts/indentpython.vim'

" PEP8 Python syntax checking
Plugin 'nvie/vim-flake8'

" Finicky plugins that cause a lot of grief
if (g:FINICKY)
  Plugin 'YouCompleteMe', {'pinned': 1}
else
  " TODO Maybe try neocachecomplete?
endif

call vundle#end()

filetype plugin indent on    " required for vundle

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

set wrap
set linebreak "wrap lines at convenient points
set textwidth=80 "hard line breaks at this number
" Make me aware of long lines
set colorcolumn=+1
" Hightlight the 101st character
call matchadd('ColorColumn', '\%101v')

filetype indent on
set smarttab " insert tabs line according to shiftwidth, not tabstop
set autoindent
set smartindent "Indents smartly for c-like languages
set copyindent " copy the previous indentation on autoindenting
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set shiftround "use multiple of shiftwidth when indenting with '<' and '>'

"TODO: figure this out
" set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

set expandtab     " expant tabs to spaces
set tabstop=2     " tab width (<tab>)
set softtabstop=2 " Generally a good idea to keep this the same as shiftwidth
set shiftwidth=2  " amount of columns for indentation

set virtualedit=block "Allow cursor to move freely in block visual mode

set iskeyword-=_ "Don't allow underscores in words

set modeline

"-----------------------------
"/ -------- SEARCHING --------
"-----------------------------

set ignorecase
set smartcase "Case sensitive search for important boundary cases
set hlsearch
set incsearch
set wrapscan

"--------------------------------
"/ ------ BACKUP AND SWAP -------
"--------------------------------

set backup
set undofile

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

syntax enable

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

set completeopt-=preview "disable scratch window on omnicompletion
set wildmenu "autocompletion menu when  <tab> is pressed
"wildmenu completion, list matches, then longest common part, then all.
set wildmode=list:longest,full
" ignores extensions on expansion/completion
set wildignore+=.git

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

set showmatch " show matching bracket when inserting a bracket
set matchtime=1

set list
set listchars=tab:»~,trail:·,precedes:«,extends:»

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

  set mouse+=a "enable mouse
  colorscheme zenburn

  highlight Search ctermfg=234 ctermbg=243
  highlight MatchParen ctermfg=234 ctermbg=242 cterm=none
  highlight CursorLine ctermbg=238 cterm=none
  highlight CursorColumn ctermbg=238 cterm=none

  "Highlight cursor line in insert mode
  set nocursorline
  autocmd InsertLeave * setlocal nocursorline nocursorcolumn
  autocmd InsertEnter * setlocal cursorline cursorcolumn

endif


"-----------------------------
"/ ------- MAPPINGS ----------
"-----------------------------

" Switches : to ;. Saves alot of keystrokes
" Normal mode only
" nnoremap ; :

"<BACKSPACE> a turns off highlighting
"can't map to <esc> because of wierd control characters
nnoremap <silent> <BACKSPACE> <BACKSPACE>:nohlsearch<Bar>:echo<CR>

"F1 always gets in the way of ESC
nnoremap <F1> <NOP>

"Disable arrow keys
noremap <Up> :echo "Use HJKL"<CR>
noremap <Down> :echo "Use HJKL"<CR>
noremap <Left> :echo "Use HJKL"<CR>
noremap <Right> :echo "Use HJKL"<CR>

"Q is ex mode, which I never use but always accidentally enter
nnoremap Q <NOP>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"Do not fill the yank register with single chars
nnoremap x "_x
nnoremap X "_X

"Keep jump in middle of window on search
"https://bitbucket.org/sjl/dotfiles/src/ef5962b5abed/vim/.vimrcw
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g; g;zz
nnoremap g, g,zz

"delete buffer
nnoremap <leader>b :bd!<CR>

"Make
nnoremap <leader>sm :w<CR>:silent make<CR>:redraw!<CR>

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

"show buffer list and ability to choose one
nnoremap <leader>l :buffers<CR>:buffer<Space>

"Source vimrc
nnoremap <leader>ss :source $MYVIMRC<CR>

"Edit vimrc
execute "nnoremap <leader>se :e " . expand('<sfile>') . "<CR>"

"Search and replace word under cursor. Start on current line
" TODO: fix the number of <left>
nnoremap <leader>sr :,$s/<C-r><C-w>/<C-r><C-w>/gc<bar>1,''-&&<left><left><left><left><left><left><left><left><left><left><left>
vnoremap <leader>sr "hy:,$s/<C-r>h/<C-r>h/gc<bar>1,''-&&<left><left><left><left><left><left><left><left><left><left><left>

"redraw screen
nnoremap <leader>sd :redraw!<cr>

"toggle `set list`: Displays EOL and Tabs
nnoremap <leader>sl :set list!<CR>

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
" This mapping conflicts with default mapping of moving cursor to top and bottom
" of the screen... But that's OK...
" Also close quickfix window
nnoremap <silent> <S-H> :cclose<CR>:bp<CR>
nnoremap <silent> <S-L> :cclose<CR>:bn<CR>

"Auto Close Tags
"TODO Check out rag tag
iabbrev </ </<C-X><C-O>


"Smart indent when entering insert mode with i on empty lines
"http://stackoverflow.com/questions/3003393/
"Use `cc` as alternative
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_ddO"
  else
    return "i"
  endif
endfunction

nnoremap <expr> i IndentWithI()

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

"camelCaseMotion
"Replace the default w, b and e mappings instead of defining
"additional mappings ,w, ,b and ,e
"Note: for some reason ,w, ,b and ,e still works. I should look into disabling
"this.
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"Replace default iw text-object and define ib and ie motions:
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" JSX in non .jsx files
let g:jsx_ext_required = 0

" Expand utilsnips
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger = '<tab>'

"---------------------------------------------------
"/ -------------- PLUGIN SETTINGS ------------------
"---------------------------------------------------

" Remember the awesomeness of ragtag CX-<Slash>
let g:ragtag_global_maps = 1

" Bufftabs directory and file name only
let g:buftabs_only_basename=1

" Add spaces before comments text
let g:NERDSpaceDelims=1

" for JSDoc and handlebars
let g:NERDCustomDelimiters = {
    \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' },
    \ 'mustache': { 'left': '{{!--', 'right' : '--}}'}
    \ }

" netrw tree mode
let g:netrw_liststyle=3
let g:netrw_browsex_viewer = has('mac') ? 'open' : 'xdg-open'
" Give netrw better columns
" let g:netrw_liststyle=1

" Use fast find for command t
let g:CommandTFileScanner='find'

" Hide tmp commit message files
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_Use_Current_Window = 1
let MRU_Max_Entries = 1000

"Bufferline
" Hide Buffer Number
let g:bufferline_show_bufnr = 0
let g:bufferline_rotate = 1

"Allow flow for 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1


"---------------------------------------------------
"/ ------ ENCODINGS AND FILE FORMATS SETTINGS ------
"---------------------------------------------------

set fileformat=unix
set encoding=utf-8

"---------------------------------------------------
"/ ------ FILETYPE SPECIFIC STUFF -----------------
"---------------------------------------------------

"Prolog
autocmd BufRead,BufNewFile *.pl set filetype=prolog

"Make
autocmd FileType make setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

"Git Commit messages
"http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
autocmd FileType gitcommit set textwidth=72

"Python (PEP8)
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
" enable all Python syntax highlighting features
let python_highlight_all = 1

autocmd FileType python autocmd BufWritePost <buffer> call Flake8()
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

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
"/ ---- FUNCTION DEFINITIONS -------------
"------------------------------------------

" Blink on next search item
" http://programming.oreilly.com/2013/10/more-instantly-better-vim.html
" https://docs.google.com/file/d/0Bx3f0gFZh5Jqc0MtcUstV3BKdTQ/edit
" USAGE:
"   nnoremap <silent> n n:call BlinkCursorLine(0.4)<cr>
function! BlinkCursorLine (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction

function! MyBlinkCursorLine()
  :call BlinkCursorLine(0.3)
endfunction

function! MoveCursorPositionOnLastExit()
  if line("'\"") > 1 && line("'\"") <= line("$")
    execute "normal! g`\""
  endif
endfunction

function! SourceIfFileExists(path)
  let expanded = glob(a:path)
  if filereadable(expanded)
    exec ":source " . expanded
  endif
endfunction

"--------------------------------
"/ -- KEYBOARD LAYOUT BINDINGS --
"--------------------------------

" I use a keyboard layout called Colemak
function! Colemak()

  "left (<=) is `h`, right (=>) is `l` as with QWERTY
  "Keys swapped are nNejJkK

  "down
  nnoremap n gj
  vnoremap n gj
  onoremap n j

  "Up
  nnoremap e gk
  vnoremap e gk
  onoremap e k

  "Join lines
  "Keep the cursor in place while joining lines (from github/sjl)
  noremap N J
  nnoremap N mzJ`z

  "Next/prev search result
  "Keep result centered (zzzv)
  "Invert line color on next item. See HLNext definition
  noremap <silent> j n:call MyBlinkCursorLine()<cr>
  nnoremap <silent> j nzzzv:call MyBlinkCursorLine()<cr>
  nnoremap <silent> J Nzzzv:call MyBlinkCursorLine()<cr>

  "Move to end of next word
  noremap k e
  noremap K E

" NOTE: I could have used `langmap` instead of this Colemak() function,
" but but langmap breaks a few plugins.
" `set langmap=nj,jn,ek,ke`

endfunction

"For QWERTY keyboard layout users. Resets everything to approximate vim defaults.
function! Qwerty()
  nnoremap j gj
  vnoremap j gj
  onoremap j j

  vnoremap J J
  onoremap J J
  nnoremap J mzJ`z

  nnoremap k gk
  vnoremap k gk
  onoremap k k

  noremap e e
  noremap E E

  vnoremap <silent> n n:call MyBlinkCursorLine()<cr>
  onoremap n n
  nnoremap <silent> n nzzzv:call MyBlinkCursorLine()<cr>

  nnoremap <silent> N Nzzzv:call MyBlinkCursorLine()<cr>
  vnoremap N N
  onoremap N N
endfunction

"-----------------
"/ ---- CALLS ----
"-----------------

"Set keybindings
call Colemak()
" call Qwerty()

autocmd BufReadPost * call MoveCursorPositionOnLastExit()

"Source Local settings. Keep this near bottom of vimrc
call SourceIfFileExists("~/.vimrc.local")

