"-----------------
"/ GENERAL CONFIG SETTINGS
"----------------

"setting personal modifying key to , -- ppl have suggested <SPACE> too 
let mapleader = ","

"filetype settings
filetype on
filetype plugin on
filetype indent on

set wrapscan " set the search scan to wrap lines 

set shellslash " Set the forward slash to be the slash of note.  Backslashes
"suck, This is really only applicable to Windows but I like to have a vimrc
"that works no matter what OS I'm currently on



set hidden					"see http://dailyvim.blogspot.com/2009/04/set-hidden.html

set history=1000			"sets :command history
set wildmenu				"autocompletion menu when  <tab> is pressed
set wildmode=list:longest,full	" comand <Tab> completion, list matches, then longest common part, then all.
						
"Case smart searching - see http://items.sjbach.com/319/configuring-vim-right
set ignorecase 
set smartcase
"Hightlight and incremental search
set hlsearch
set incsearch

set virtualedit=onemore         " allow for cursor beyond last character

set spell                       " spell checking on

" Use the same symbols as TextMate for tabstops and EOLs. Useful for 
" :set list! See Mapping below
set listchars=tab:»\ ,eol:¬
"Invisible character colors -- Tabs and EOL

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


set gdefault " the /g flag on :s substitutions by default

"TODO FIGURE OUT TABBING
" Folliwng settings from http://nvie.com/posts/how-i-boosted-my-vim/
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set shiftround	"use multiple of shiftwidth when indenting with '<' and '>'

set noexpandtab	"Keep tabs as tabs, do not convert to spces
set tabstop=2     " tab width (<tab>)
set softtabstop=2 "Generally a good idea to keep this the same as shiftwidth
set shiftwidth=2  " amount of columns for indentation

set showmatch	" set show matching parenthesis
set matchtime=2	"Sets time the other parenthesis is highlighted when showmatch is enable

"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo


set viminfo+='1000,f1,:1000,/1000  "Sets bigger viminfo file. Saves registers, command history, etc.

set autochdir "Change cwd to current file whenever a window change happens




"-----------------
"/ GUI SETTINGS
"-----------------

set visualbell "Removes beeping

color desert 
syntax on
set number

set scrolloff=6 "Viewport scroll X lines before cursor hits a side
set scroll=9 "Scroll up and down by how many lines using CTRL-D and CTRL-U
set helpheight=29
set lines=999 columns=115 "set initial windows size
set winminheight=0				" windows can be 0 line high TODO: LOOK this UP!

if has('gui_running')
	set guioptions-=m
	set guioptions-=a
	set guioptions-=t
	set guioptions-=T
endif

set viminfo='1000,f1,:1000,/1000  " big viminfo :)

" Set up the gui cursor to look nice http://www.derekwyatt.org/vim/the-vimrc-file/my-vimrc-file/
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

"highlight current line
set cursorline 
"XXX are these two lines correct? TODO CHECK THEM OUT
hi cursorline guibg=#333333		" highlight bg color of current line
hi CursorColumn guibg=#333333   " highlight cursor
     
set guifont=Consolas:h11:cANSI "setting the GuiFont

set showcmd " Show the current command in the lower right corner. Display the current mode (vim default: ON)
set showmode " Show the current mode
set cmdheight=1 "The command-line bar height (default = 1)
set laststatus=2 "Always display status line
set ruler "Shows colums, rows, percentage of location in file. Like g-Ctrl-G

"Format Status Line
set statusline=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]


"Text formatting options. Defaul is (for php) set fo=qrowcb
"and set fo=tcq for the rest. 
"***Note*** if text and comment starts fucking up check out the trouble
"shooting part of format options in HELP.
"TODO: fix 'next line is commented when newline from commented line'
autocmd FileType php set fo=tcqawb

"TODO SEE User guide section 30.6 for MORE ON FORMATTING COMMENTS

"-----------------
"/ MAPPINGS
"-----------------

" Switches : to ;. Saves alot of keystrokes
nnoremap ; :
"Switches é and É to : and , basically allowing ; to be "pressed"
nnoremap é ;
nnoremap É ,
"NOTE: Instead of switch : to ; as one would expect, this breaks alot of
"commands and plugins. é eliminates this problem and inserts a single ;  

"Flipping these motions around because I use 't' more than 'f' but can reach
"the f key with more ease.
noremap t f
noremap f t
noremap T F
noremap F T

" Make vim act like a browser
map <space> <c-d>
map <s-space> <c-u>

"F1 always gets in the way of ESC 
"TODO: FIX ME!
map! <F1> <ESC>

"In insertmode, escape when jj or kk is pressed. It's a common
"sequence in normal mode but never in insert more.
inoremap jj <ESC>j
inoremap kk <ESC>k

"For long line. Cursor goes down at line wrap instead of line end
nnoremap j gj
nnoremap k gk

" Easier moving in tabs and windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Change buffer.  Conflicts with default mapping of moving cursor to top and bottom of the
" screen... But that's OK...
map <S-H> :bp<cr>
map <S-L> :bn<cr>

" Yank from the cursor to the end of the line, to be consistent with C and D.
" (default: Y synonym for yy)
nnoremap Y y$


"---------------------------------------------------
"/ MAPPINGS FOR INTERESTING FUNCTIONALITY
"---------------------------------------------------

"Creates nicely spaced and completed brackets. See autoclose.vim plugin for
"other bracket and " closing combinations.
inoremap {<CR>  {<CR>}<Esc>ko
inoremap (<CR>  (<CR>)<Esc>ko

" Shortcut to rapidly toggle `set list`: Displays EOL and Tabs
map <Leader>l :set list!<CR>

"New line without insertmode
nmap <S-Enter> ko<Esc>j

"Carriage return without exiting normal mode
nmap <CR> o<Esc>k

"ESC now turns off highlighting along with it's current functionality.
nnoremap <esc> :noh<return>:<backspace>

"Source _vimrc
nmap <leader>s :source $MYVIMRC<CR>

"Edit _vimrc on Laptop <Leader>s(ource)e(dit)l(aptop)
nmap <leader>sel :e D:\Dropbox\My Dropbox\!config\vim\_vimrc<CR>

"Change working directory to file and echo it
nmap <leader>md :lcd %:p:h<CR>:echo getcwd()<cr>

"allow deleting selection without updating the clipboard (yank buffer)
"via http://www.pixelbeat.org/settings/.vimrc
"Underscore register = blackhole
"TODO: Fix this... vnoremp?
vnoremap x "_x 
vnoremap X "_X

"----------------------------------
"/ MAPPINGS FOR PLUGINS
"----------------------------------

"NERDTree
map <F2> :NERDTreeToggle<CR>

"Most Recently Used Files
map <leader>mf :MRU<CR>

"Highlights Hex colors with corresponding color
if exists('*HexHighlight()')
  nmap <leader>hc :call HexHighlight()<Return>
endif


" <leader>ff is the default JS Beautifier mapping
" <leader>t is for Tasklist (Todos, etc)
"

"-----------------
"/ PLUGINS
"-----------------

" Remember the awesomeness of ragtag CX-<Slash> 
let g:ragtag_global_maps = 1 "For Ragtag 

"Note: <leader>mbe mbc mbt is miniBufExplorer
"TODO Change MiniBufExplorer statusline
:au BufEnter -MiniBufExplorer- setlocal laststatus=1
"Show the miniBufExplorer from the start
let g:miniBufExplorerMoreThanOne = 0

"Add extra terms for TaskList
let g:tlTokenList = ["FIXME", "TODO", "XXX", "todo", "xxx", "TODO:", "note", "NOTE", "NB"]

"-----------------
"/ PHP Stuff
"-----------------

" run file with PHP CLI 
autocmd FileType php noremap <leader>mc :w !C:\XAMPP\xampp\php\php.exe -f "%:p"<CR>

" PHP parser check (CTRL-L) (syntax check!)
autocmd FileType php noremap <leader>ms :w !C:\XAMPP\xampp\php\php.exe -l "%:p"<CR>

au FileType php set omnifunc=phpcomplete#CompletePHP

"From http://phpslacker.com/2009/02/05/vim-tips-for-php-programmers/

"highlights interpolated variables in sql strings and does sql-syntax 
"highlighting. yay "If you like SQL syntax highlighting inside Strings: 
autocmd FileType php let php_sql_query=1
" does exactly that. highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1
" discourages use oh short tags. c'mon its deprecated remember
autocmd FileType php let php_noShortTags=1


"Enable HTML syntax highlighting inside strings:  
autocmd FileType php let php_htmlInStrings = 1

"Forhighlighting parent error ] or ): 
autocmd FileType php let php_parent_error_close = 1



"---------------------------------------
"/ KEEP FOLLOWING NEAR BOTTOM OF VIMRC 
"---------------------------------------

"Gets rid of TILDE backup files that VIM likes so much.
"See http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
"TODO FIX THIS
silent execute '!mkdir c:\temp\'
silent execute '!del  c:\temp\*~'
set backupdir=c:\temp
set directory=c:\temp






"TODO : LOOK INTO THIS to complement what's on top
"From  http://spf13.com/post/ultimate-vim-config
" Setting up the directories {
"set backup                      " backups are nice ...
"set backupdir=$HOME/.vimbackup//  " but not when they clog .
"set directory=$HOME/.vimswap//  " Same for swap files
"set viewdir=$HOME/.vimviews//   " same for view files

""" Creating directories if they don't exist
"silent execute '!mkdir -p $HOME/.vimbackup'
"silent execute '!mkdir -p $HOME/.vimswap'
"silent execute '!mkdir -p $HOME/.vimviews'
"au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
"au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)

"-------------------
"XXX TO EXPLORE
"-------------------
"Sets Unicode. See http://vim.wikia.com/wiki/Working_with_Unicode
if has("multi_byte")
  if &termencoding == ""
	let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8 bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif


"See http://www.slideshare.net/ZendCon/vim-for-php-programmers-presentation
"slide 52 about Linting and syntax stuff. NEED TO LOOK INTO THIs! Andrei
"Zmiskksfdjdfjsfds slides
" :set makeprg=php\ -l\ %
" :set errorformat=%m\ in\ %f\ on\ lin\ %l



" set "make" command when editing php files
set makeprg=C:\XAMPP\xampp\php\php.exe\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
"http://phpslacker.com/2009/02/05/vim-tips-for-php-programmers/
"To use, simply issue “:make %” command inside of VIM to check the syntax of 
"your php against the interpreter. Syntax highlighting can only do so much


" auto switch to folder where editing file
"http://phpslacker.com/2009/02/05/vim-tips-for-php-programmers/
""Often one would open a file for editing in VIM from a different working directory eg. vim ~/somewhere_else/myfile.php. This command automagically changes vim’s current working directory to that of the file you’ve opened making it easy to open other files which are close by on the filesystem
"MAY BREAK MINIBUFFEXPLORER"
"autocmd BufEnter * lcd %:p:h


"For when you forget to sudo.. Really Write the file.
""cmap w!! w !sudo tee % >/dev/null





