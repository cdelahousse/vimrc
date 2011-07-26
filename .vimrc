"-----------------------
" Vundle Settings
"-----------------------
Bundle 'gmarik/vundle'
Bundle 'Solarized'
"desert scheme for terminal 
Bundle 'desert.vim'
Bundle 'The-NERD-tree' 
Bundle 'The-NERD-Commenter'
Bundle 'surround.vim'
Bundle 'matchit.zip'
Bundle 'ragtag.vim'
"minibuffexplorer improved - http://fholgado.com/minibufexpl
"Bundle 'fholgado/minibufexpl.vim'  "Disabled for buftabs 
Bundle 'buftabs'
Bundle 'IndexedSearch'
Bundle 'superjudge/tasklist-pathogen'
Bundle 'ervandew/supertab'
Bundle 'html5.vim'
Bundle 'ZenCoding.vim'
Bundle 'jsbeautify'
Bundle 'jshint.vim'

"-----------------
"/ GENERAL CONFIG SETTINGS
"----------------

"setting personal modifying key to , 
let mapleader = ","

"filetype settings
"filetype on "VUNDLE needs this off, see system vimrc
filetype plugin on "If problem with vundle, turn off
filetype indent on

"Prevent exploit 
"http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html
set modelines=0 

set ttyfast "fast terminal connection, more characters sent to screen, faster in term

set shellslash " Set the forward slash to be the slash of note.  Backslashes
"suck, This is really only applicable to Windows but I like to have a vimrc
"that works no matter what OS I'm currently on

set hidden "switch buffer without saving
						
"Case smart searching - see http://items.sjbach.com/319/configuring-vim-right
set ignorecase 
set smartcase
"Hightlight and incremental search
set hlsearch
set incsearch

set wrapscan " set the search scan to wrap lines 

"set virtualedit=onemore         " allow for cursor beyond last character


" Use the same symbols as TextMate for tabstops and EOLs. Useful for 
" :set list! See Mapping below
set listchars=tab:�\ ,eol:�
"Invisible character colors -- Tabs and EOL

"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

set gdefault " the /g flag on :s substitutions by default

set showmatch	" set show matching parenthesis
set matchtime=2	"Sets time the other parenthesis is highlighted when showmatch is enable

"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

set viminfo+='1000,f1,:1000,/1000  "Sets bigger viminfo file. Saves registers, command history, etc.

set history=1000	"sets :command history XXX Does viminfo set this?

set autochdir "Change cwd to current file whenever a window change happens


"Cygwin Shell stuff
if has('win32') 
	"http://vim.wikia.com/wiki/Use_cygwin_shell
	"http://vim.wikia.com/wiki/Running_the_win32-version_of_Vim_from_cygwin
	"http://vim.wikia.com/wiki/Get_a_shell_command_for_changing_to_the_current_directory
	"http://vim.wikia.com/wiki/Execute_a_shell_command_in_the_directory_shown_in_file_explorer
	"KEYWORDS: cygwin, native gvim, win32 gvim
	"http://vim.1045645.n5.nabble.com/solution-of-gvim-cygwin-td1147217.html
	"http://www.manuel-strehl.de/tips_and_tricks/vim_and_win.en.html
	"http://www.manuel-strehl.de/tips_and_tricks/vim_and_win_revised.en.html
	"http://vim.wikia.com/wiki/Running_the_win32-version_of_Vim_from_cygwin
	"http://vim.wikia.com/wiki/Run_native-Windows_Vim_from_cygwin_without_a_wrapper
	"http://tech.groups.yahoo.com/group/vim/message/79093
	"http://vim.1045645.n5.nabble.com/gvim-shell-td1142359.html
	"http://stackoverflow.com/questions/3164181/getting-gvim-to-automatically-translate-a-cygwin-path
	"http://superuser.com/questions/298792/how-to-use-cyg-wrapper-to-fork-a-new-tab-in-win32-gvim/
	"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=win32+gvim+cygwin#q=win32+gvim+cygwin&hl=en&prmd=ivns&ei=uI4uTuj3IcXRrQfipJymAw&start=10&sa=N&bav=on.2,or.r_gc.r_pw.&fp=4314f23e9084643a&biw=1440&bih=785
"http://alecthegeek.wordpress.com/2008/10/09/handy-hack-run-vim-for-windows-under-cygwin/
"

	"TODO Look in to vim shell http://www.wana.at/vimshell/
	"TODO Figure out how to switch to CWD of file
	"TODO Get this working with Mintty and not CMD.exe
	set shell=C:/cygwin/bin/bash
	set shellcmdflag=--login\ -c
	set shellxquote=\"	
	"set shell=C:/cygwin/bin/mintty
	"set shell=C:/cygwin/bin/bash
	"set shellcmdflag=--login\ -c
	
	"remap ! to got to CWD. XXX Doesn't work with aliases
	"http://vim.1045645.n5.nabble.com/running-shell-command-in-the-directory-of-the-file-td1185993.html
	cnoremap !cwd !cd '%:p:h'; 

	"may be of interest later
	"echo shellescape(expand("%:p:h"))

elseif has('unix')

endif

"Sets all files to unix filetype. Changes EOL's to LF and strips CRLF (dos) line
"endings. I really don't like CRLF even though I work on windows. Git complains if
"there are a mixture of CRLF and LF. This fixes that by only saving as LF.
"http://vim.wikia.com/wiki/Change_end-of-line_format_for_dos-mac-unix
set fileformats=unix,dos
"set fileformat=unix   "force unix
	
"-----------------
"/ GUI SETTINGS
"-----------------

syntax enable

set ruler "Shows colums, rows, percentage of location in file. Like g-Ctrl-G
set showcmd " Show the current command in the lower right corner. Display the current mode (vim default: ON)
set showmode " Show the current mode

set visualbell "Removes beeping

set background=dark

set number

set scrolloff=12 "Viewport scroll X lines before cursor hits a side 
set scroll=9 "Scroll up and down by how many lines using CTRL-D and CTRL-U
set helpheight=29
set winminheight=0				" windows can be 0 line high

set cmdheight=1 "The command-line bar height (default = 1)
set laststatus=2 "Always display status line

"Format Status Line
set statusline=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

set wildmenu			"autocompletion menu when  <tab> is pressed
set wildmode=list:longest,full	" comand <Tab> completion, list matches, then longest common part, then all.

" ignores extensions on expansion/completion
set wildignore+=.git

"Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

"Settings for gVim
if has('gui_running')
	colorscheme solarized
	
	set lines=999 columns=95 "set initial windows size 
	set guioptions-=m
	set guioptions-=a
	set guioptions-=t
	set guioptions-=T
	
	
	" Set up the gui cursor to look nice
	"http://www.derekwyatt.org/vim/the-vimrc-file/my-vimrc-file/
	"Only works with gVim

	set guicursor=n-v-c:block-Cursor-blinkon0
	set guicursor+=ve:ver35-Cursor
	set guicursor+=o:hor50-Cursor
	set guicursor+=i-ci:ver25-Cursor
	set guicursor+=r-cr:hor20-Cursor
	set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
	set guifont=Consolas:h11:cANSI "setting the GuiFont
	
	"highlight current line
	set cursorline 

	set spell " spell checking on. Looks fugly in terminal
"Settings for Terminal
elseif &term=~'xterm' || &term=~'rxvt-cygwin-native' || &term=~'xterm-256color'
	
	colorscheme desert
	
	"highlight bg color of current line and remove default underlinehlight cursor
	hi CursorLine cterm=none ctermbg=237


	"So that insert mode is more obvious in terminals 
	set nocursorline
	autocmd InsertLeave * set nocursorline
	autocmd InsertEnter * set cursorline


	"For Mintty -Avoiding escape timeout issues
	"http://code.google.com/p/mintty/wiki/Tips
	let &t_ti.="\e[?7727h"
	let &t_te.="\e[?7727l"
	noremap <Esc>O[ <Esc>
	noremap! <Esc>O[ <Esc>

	"For Mintty - Mode-dependent cursor
	"http://code.google.com/p/mintty/wiki/Tips
	let &t_ti.="\e[1 q"
	let &t_SI.="\e[5 q"
	let &t_EI.="\e[1 q"
	let &t_te.="\e[0 q"

endif

"Text formatting options. Defaul is (for php) set fo=qrowcb
"and set fo=tcq for the rest. 
"***Note*** if text and comment starts fucking up check out the trouble
"shooting part of format options in HELP.
"TODO: fix 'next line is commented when newline from commented line'
autocmd FileType php set fo=tcqawb

"TODO SEE User guide section 30.6 for MORE ON FORMATTING COMMENTS

"---------------------------------------------------
"/ -------------- TEXT EDITING  --------------------
"---------------------------------------------------
set wrap "wrap text
set textwidth=85 "hard line breaks at this number
set colorcolumn=+1 " highlight column after 'textwidth'
"set formatoptions=qn1tca "see fo-table. TODO: REVIEW

" Following settings inspire from http://nvie.com/posts/how-i-boosted-my-vim/
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set shiftround	"use multiple of shiftwidth when indenting with '<' and '>'

set noexpandtab	"Keep tabs as tabs, do not convert to spces
set tabstop=2     " tab width (<tab>)
set softtabstop=2 "Generally a good idea to keep this the same as shiftwidth
set shiftwidth=2  " amount of columns for indentation


"---------------------------------------------------
"/ -------------- CUSTOM MAPPINGS ------------------
"---------------------------------------------------

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Switches : to ;. Saves alot of keystrokes
nnoremap ; :
"Switches � and � to : and , basically allowing ; to be "pressed"
nnoremap � ;
nnoremap � ,
"NOTE: Instead of switch : to ; as one would expect, this breaks alot of
"commands and plugins. � eliminates this problem and inserts a single ;  

"Flipping these motions around because I use 't' more than 'f' but can reach
"the f key with more ease.
"noremap t f
"noremap f t
"noremap T F
"noremap F T

"TODO: FIX ME! -- F1 always gets in the way of ESC 
map <F1> <ESC>

"In insertmode, escape when jj or kk is pressed. It's a common
"sequence in normal mode but never in insert more.
inoremap jj <ESC>j
inoremap kk <ESC>k
inoremap hh <ESC>h

"For long line. Cursor goes down at line wrap instead of line end
nnoremap j gj
nnoremap k gk

" Easier moving in tabs and windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
 
" Change buffer and the clear the command line (for buftab) using <silent> 
"Conflicts with default mapping of moving cursor to top and bottom of the
" screen... But that's OK...
map <silent> <S-H> :bp<cr>
map <silent> <S-L> :bn<cr>

" Yank from the cursor to the end of the line, to be consistent with C and D.
" (default: Y synonym for yy)
nnoremap Y y$

" L is easier to type, and I never use the default behavior.
"TODO FIND APPROPRIATE KEY
"noremap L $ 

"Quick shortcuts 
nnoremap <leader>b :bd!<cr> 
nnoremap <leader>q :q!<cr>
nnoremap <leader>w :w!<cr>

"---------------------------------------------------
"/ MAPPINGS FOR INTERESTING FUNCTIONALITY
"---------------------------------------------------

"Quick Return https://bitbucket.org/sjl/dotfiles/src/ef5962b5abed/vim/.vimrc
inoremap <c-cr> <esc>A<cr>

"Creates nicely spaced and completed brackets. See autoclose.vim plugin for
"other bracket and " closing combinations.
inoremap {<CR>  {<CR>}<Esc>ko
inoremap (<CR>  (<CR>)<Esc>ko

" Shortcut to rapidly toggle `set list`: Displays EOL and Tabs
map <Leader>l :set list!<CR>

"New line without insertmode
"Mintty doesn't support shit enter
nmap <S-Enter> ko<Esc>j

"Carriage return without exiting normal mode
nnoremap <CR> o<Esc>k

"<SPACE> now turns off highlighting along with it's current functionality.
nnoremap <silent> <space> :nohlsearch<Bar>:echo<CR>

"Source _vimrc
nmap <leader>s :source $MYVIMRC<CR>

"Edit vimrc 
execute "nmap <leader>se :e " . g:my_vim_path . "/.vimrc<CR>"

" When vimrc is edited, reload it
execute "autocmd! bufwritepost .vimrc source " . g:my_vim_path . "/.vimrc"

"allow deleting selection without updating the clipboard (yank buffer) via
"http://www.pixelbeat.org/settings/.vimrc Underscore register = blackhole added h to
"fix bug
noremap x "_xh 
noremap X "_X

" Keep search matches in the middle of the window.
"https://bitbucket.org/sjl/dotfiles/src/ef5962b5abed/vim/.vimrcw
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

"Select previously pasted text
"TODO: Lookup backtick and bracket. How does this work?
nnoremap <leader>v V`]

"Reformat a paragraph of text
nnoremap <leader>fp gqip

iabbrev xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iabbrev cd@ christian@delahousse.ca
iabbrev gh/ http://github.com/cdelahousse
iabbrev cd/ http://delahousse.ca

"Most Recently Used Files (replaces :MRU)
map <leader>mf :browse oldfile<CR>
"%:p:h:8 gets the current file's directory and :8 is what puts it
"into dos short form
"
" Bash like keys for the command line"
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"---------------------------------------------------
"/ -------------- WINDOW MAPPINGS ------------------
"---------------------------------------------------

if has('Win32')

	"TODO Find appropriate keys for mappings

	"open explorer in the current file's directory map
	",e :!start explorer %:p:h:8<CR>

	"open windows command prompt in the current file's directory
	"map ,c :!start cmd /k cd %:p:h:8<CR>

	"open cygwin bash in the current file's directory
	"map ,b :!start bash --login -i -c 'cd `cygpath "%:p:h:8"`;bash'<CR>
endif

"----------------------------------
"/ MAPPINGS FOR PLUGINS
"----------------------------------

"NERDTree
map <F2> :NERDTreeToggle<CR>

map <leader>t <Plug>TaskList
" <leader>t is for Tasklist (Todos, etc)

"<leader>ff uses JSBeautifier


"-----------------
"/ PLUGINS
"-----------------

"Default completion type -- Omnicomplete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Remember the awesomeness of ragtag CX-<Slash> 
let g:ragtag_global_maps = 1 "For Ragtag 

"Bufftabs directory and file name only
:let g:buftabs_only_basename=1

"XXX Minibufexp REPLACED BY buftabs
"Note: <leader>mbe mbc mbt is miniBufExplorer
":au BufEnter -MiniBufExplorer- setlocal laststatus=1
"Show the miniBufExplorer from the start
"let g:miniBufExplorerMoreThanOne = 0

"Add extra terms for TaskList
let g:tlTokenList = ["FIXME", "TODO", "XXX", "todo", "xxx", "TODO:", "note", "NOTE", "NB"]


"-----------------
"  FILETYPE STUFF
"-----------------
"see here for example http://amix.dk/blog/post/19021
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"-----------------
"/ PHP Stuff
"-----------------

" .. becomes ->
autocmd FileType php :iabbrev .. ->

" run file with PHP CLI 
autocmd FileType php noremap <leader>mc :w !C:\XAMPP\xampp\php\php.exe -f "%:p"<CR>

" PHP parser check (CTRL-L) (syntax check!)
autocmd FileType php noremap <leader>ms :w !C:\XAMPP\xampp\php\php.exe -l "%:p"<CR>


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


"See http://www.slideshare.net/ZendCon/vim-for-php-programmers-presentation
"slide 52 about Linting and syntax stuff. NEED TO LOOK INTO THIs! Andrei
"Zmiskksfdjdfjsfds slides
" :set makeprg=php\ -l\ %
" :set errorformat=%m\ in\ %f\ on\ lin\ %l


" set make command when editing php files
"set makeprg=C:\XAMPP\xampp\php\php.exe\ -l\ %
"set errorformat=%m\ in\ %f\ on\ line\ %l
"http://phpslacker.com/2009/02/05/vim-tips-for-php-programmers/
"To use, simply issue �:make %� command inside of VIM to check the syntax of 
"your php against the interpreter. Syntax highlighting can only do so much

"---------------------------------------
"/ KEEP FOLLOWING NEAR BOTTOM OF VIMRC 
"---------------------------------------

set backup " backups are nice ...
set undofile "persistent undo
"Setting swap and backup dir to system temp
set backupdir=$TEMP//
set directory=$TEMP// 
set undodir=$TEMP//

"Delete recent swapfiles
"if has('win32')
	"silent execute '!del "'.$TEMP.'\*~"'
"elseif has('unix')
	"silent execute '!rm "'.$TEMP.'/*~"'
"endif

"---------------------------------------
"/ Random Scripts
"---------------------------------------

"Sets Unicode. See http://vim.wikia.com/wiki/Working_with_Unicode
if has("multi_byte")
  if &termencoding == ""
		let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8 bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
