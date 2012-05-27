" Christian Delahousse's vimrc
" http://christian.delahousse.ca
" http://github.com/cdelahousse 
" Last updated: 2012/01/22 

"--------------------------------------------
"/ ------------ VUNDLE SETTINGS -------------
"--------------------------------------------
"- Keep these settings at the top of vimrc --
"--------------------------------------------
set nocompatible "called again in case local vimrc didn't. For Vundle

Bundle 'gmarik/vundle'
Bundle 'Solarized'
"Desert for Minnty and console
Bundle 'desert.vim'
Bundle 'The-NERD-tree' 
Bundle 'The-NERD-Commenter'
Bundle 'surround.vim'
Bundle 'matchit.zip'
Bundle 'ragtag.vim'
Bundle 'buftabs'
Bundle 'IndexedSearch'
Bundle 'superjudge/tasklist-pathogen'
"TODO FIGURE SUPERTAB OUT
Bundle 'ervandew/supertab'
"TODO Figure if htis is worth installing
"Bundle 'Command-T'

"Move along the camel case
"Use the new motions ',w', ',b' and ',e' in normal mode, operator-pending 
"mode (cp. :help operator), and visual mode.
Bundle 'bkad/CamelCaseMotion'

"----------------------------------------
"/------- GENERAL CONFIG SETTINGS -------
"----------------------------------------

"setting personal modifying key to , 
let mapleader = ","

"filetype settings
"filetype on "VUNDLE needs this off, see system vimrc
filetype plugin on "If problem with vundle, turn off

set ttyfast "fast terminal connection, more characters sent to screen, faster in term
set shellslash " Set the forward slash to be the slash of note. 

set hidden "Buffers can live in background
set virtualedit=onemore         " allow for cursor beyond last character
set gdefault " the /g flag on :s substitutions by default


set viminfo+='1000,f1,:1000,/1000  "Sets bigger viminfo file. Saves registers, command history, etc.

set history=1000	"sets :command history 

set autochdir "Change cwd to current file whenever a window change happens

"Prevent exploit 
"http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html
set modelines=0 

"---------------------------------------------------
"/ -------------- TEXT EDITING  --------------------
"---------------------------------------------------

"set autoread  "Reload files changed outside vim

"TODO SEE User guide section 30.6 for MORE ON FORMATTING COMMENTS
"set formatoptions=qn1tca "see fo-table. TODO: REVIEW

set wrap "wrap text
set linebreak "wrap lines at convenient points
set textwidth=85 "hard line breaks at this number
set colorcolumn=+1 " highlight column after 'textwidth'

filetype indent on

" Following settings inspire from http://nvie.com/posts/how-i-boosted-my-vim/
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set smartindent		"Indents smartly for c-like languages
set copyindent    " copy the previous indentation on autoindenting
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set shiftround	"use multiple of shiftwidth when indenting with '<' and '>'

"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

set noexpandtab	"Keep tabs as tabs, do not convert to spces
set tabstop=2     " tab width (<tab>)
set softtabstop=2 "Generally a good idea to keep this the same as shiftwidth
set shiftwidth=2  " amount of columns for indentation


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

set backup " backups are nice ...

if v:version >= 700
	set undofile "persistent undo
endif


if has("unix")
	"In windows, $TEMP is already defined, but not in linux/unix
	let $TEMP = '/tmp/'
endif

"Setting swap and backup dir to system temp
set backupdir=$TEMP//
set directory=$TEMP// 
set undodir=$TEMP//

"-------------------------------------------------
" ------ UNIX and LINUX Specific settings --------
"-------------------------------------------------
if has('unix')
	"Make :! (ie. the bash command) work like the bash terminal
	"This makes bash aliases load, because .bashrc is only 
	"loaded when the shell is run in interative mode.
	set shellcmdflag=-ic
endif


"-------------------------------------------------
" ------------- M$ Windows settings --------------
"-------------------------------------------------

" using gVIM with Cygwin on a Windows PC
if has('win32')
	source $VIMRUNTIME/mswin.vim
	behave mswin
	set shell=c:\\cygwin\\bin\\bash.exe shellcmdflag=-c shellxquote=\"
endif
"---------------------------------------------
"/ -------- GENERAL GUI SETTINGS -------------
"---------------------------------------------

syntax enable "Syntax highlighting

set ruler "Shows colums, rows, percentage of location in file. Like g-Ctrl-G
set showcmd " Show the current command in the lower right corner. Display the current mode (vim default: ON)
set showmode " Show the current mode

set visualbell "Removes beeping

set background=dark

set number

set scrolloff=12 "Viewport scroll X lines before cursor hits a side 
set scroll=9 "Scroll up and down by how many lines using CTRL-D and CTRL-U
set helpheight=29
set winminheight=0 " windows can be 0 line high

set cmdheight=1 "The command-line bar height (default = 1)
set laststatus=2 "Always display status line

"Format Status Line
set statusline=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

set wildmenu "autocompletion menu when  <tab> is pressed
set wildmode=list:longest,full	" comand <Tab> completion, list matches, then longest common part, then all.

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" ignores extensions on expansion/completion
set wildignore+=.git

set showmatch	" set show matching parenthesis
set matchtime=2	"Sets time the other parenthesis is highlighted when showmatch is enable

" Use the same symbols as TextMate for tabstops and EOLs. Useful for 
" :set list! See Mapping below
set listchars=tab:»\ ,eol:¬

"Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

"-------------------------------------------------
"/ ------- FOR GVIM AND WHILE GUI is RUNNING -----
"-------------------------------------------------

if has('gui_running')
	colorscheme solarized
	
	set lines=48 columns=92 "set initial windows size 
	set guioptions-=m "menu
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

	"Set font
	if has("win32")
		set guifont=Consolas:h11:cANSI "setting the GuiFont
	elseif has("unix")
		set guifont=Monospace\ 11 
	endif

	"Invisible character colors -- Tabs and EOL
	highlight NonText guifg=#5a5a65
	highlight SpecialKey guifg=#5a5a65

	"highlight current line
	set cursorline 

	set spell " spell checking on. Looks fugly in terminal
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en

"--------------------------------------------
"/ --------- FOR TERMINAL EMULATORS ---------
"--------------------------------------------

elseif &term=~"^xterm" || &term=~'rxvt-cygwin-native' 
	
	colorscheme desert

	"highlight bg color of current line and remove default underlinehlight cursor
	hi CursorLine cterm=none ctermbg=237 


	"So that insert mode is more obvious in terminals 
	"Note: This doesn't work in gnome terminal
	set nocursorline
	autocmd InsertLeave * set nocursorline
	autocmd InsertEnter * set cursorline
	

	"TODO CHANGE THIS CODE SO THAT IT's MINNTY ONLY!
	"For Mintty -Avoiding escape timeout issues
	"http://code.google.com/p/mintty/wiki/Tips
	"let &t_ti.="\e[?7727h"
	"let &t_te.="\e[?7727l"
	"noremap <Esc>O[ <Esc>
	"noremap! <Esc>O[ <Esc>

	"For Mintty - Mode-dependent cursor
	"http://code.google.com/p/mintty/wiki/Tips
	"let &t_ti.="\e[1 q"
	"let &t_SI.="\e[5 q"
	"let &t_EI.="\e[1 q"
	"let &t_te.="\e[0 q"

endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	  set mouse=a
endif

"---------------------------------------------------
"/ ------- MODIFIED DEFAULT MAPPINGS --------------
"---------------------------------------------------

" Switches : to ;. Saves alot of keystrokes
" Normal mode only
nnoremap ; :
"Switches é and É to : and , basically allowing ; to be 'pressed'
nnoremap é ;
nnoremap É ,
"NOTE: Instead of switch : to ; as one would expect, this breaks alot of
"commands and plugins. é eliminates this problem and inserts a single ;  

"F1 always gets in the way of ESC 
map <F1> <NOP>

"For long lines. Cursor goes down at line wrap instead of line end
nnoremap j gj
nnoremap k gk

" Easier moving in splits and windows
"map <C-J> <C-W>j
"map <C-K> <C-W>k
"map <C-L> <C-W>l
"map <C-H> <C-W>h
 
" Change buffer and the clear the command line (for buftab plugin) using <silent> 
" This mapping conflicts with default mapping of moving cursor to top and bottom of the
" screen... But that's OK...
map <silent> <S-H> :bp<cr>
map <silent> <S-L> :bn<cr>

"<SPACE> now turns off highlighting along with it's current functionality.
nnoremap <silent> <space> :nohlsearch<Bar>:echo<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
" (default: Y synonym for yy)
nnoremap Y y$

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

" L is easier to type, and I never use the default behavior.
"TODO FIND APPROPRIATE KEY
"noremap L $ 

"TODO: also remap 0  end of line

"---------------------------------------------------------------
"/ ---------- MAPPINGS FOR INTERESTING FUNCTIONALITY -----------
"---------------------------------------------------------------

"Quick shortcuts :
"delete buffer
nnoremap <leader>b :bd!<cr>
"quit all
nnoremap <leader>q :q!<cr> 
"write to file
nnoremap <leader>w :w!<cr>

"In insertmode, escape when jj or kk is pressed. It's a common
"sequence in normal mode but never in insert more.
inoremap jj <ESC>gj
inoremap kk <ESC>gk
inoremap hh <ESC>h

"kj is Faster than ESC
inoremap kj <ESC>

"Write to new line without exiting insertmode
"https://bitbucket.org/sjl/dotfiles/src/ef5962b5abed/vim/.vimrc
inoremap <c-cr> <esc>A<cr>

"Creates nicely spaced and completed brackets. See autoclose.vim plugin for
"other bracket and " closing combinations.
inoremap {<CR>  {<CR>}<Esc>ko
inoremap (<CR>  (<CR>)<Esc>ko

" Shortcut to rapidly toggle `set list`: Displays EOL and Tabs
map <Leader>l :set list!<CR>

"New line without entering insertmode
nnoremap <S-CR> o<Esc>k
"note: Mintty doesn't support shift enter
nnoremap <CR> ko<Esc>j

"Source _vimrc.
nmap <leader>s :source $MYVIMRC<CR>

"Edit vimrc 
execute "nmap <leader>se :e " . g:my_vim_path . "/vimrc<CR>"

" When vimrc is edited, reload it
"execute "autocmd! bufwritepost .vimrc source " . g:my_vim_path . "/.vimrc"


"Select previously pasted text
"TODO: Lookup backtick and bracket. How does this work?
"nnoremap <leader>v V`]
"note: gv does the same thing.  This is redundant


" Bash like keys for the command line"
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"Reformat a paragraph of text
nnoremap <leader>fp gqip

"Move lines up and down using ALT-J or A-K
"http://vim.wikia.com/wiki/Moving_lines_up_or_down_in_a_file
"NOTE: Does not work in terminal... GRRRR!
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

"Enable windows style copy pasting
vnoremap <C-c> "+y
inoremap <C-v>  <C-r>+
"Prevents collision with normal mode ctrl-v (Blockwise selection mode)
nnoremap <leader>p  "+p

"---------------------------------------------------
"/ --------------- TEXT EXPANSION ------------------
"---------------------------------------------------

"Current date yyyy/mm/dd HH:MM:SS
iabbrev ydate <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>
"Current date yyyy/mm/dd 
iabbrev xdate <c-r>=strftime("%Y/%m/%d")<cr>

"Text Expansion
iabbrev gh/ http://github.com/cdelahousse
iabbrev cd/ http://christian.delahousse.ca

"---------------------------------------------------
"/ -------------- WINDOWS MAPPINGS -----------------
"---------------------------------------------------

if has('Win32')

endif

"----------------------------------
"/ MAPPINGS FOR PLUGINS
"----------------------------------

"NERDTree
map <F2> :NERDTreeToggle<CR>

"for Tasklist (Todos, etc)
map <leader>t <Plug>TaskList

"<leader>ff uses JSBeautifier

" NerdCommenter
"[count]<leader>cy- Same as cc except that the commented line(s) are yanked first.
"<leader>c$ - Comments the current line from the cursor to the end of line.

"---------------------------------------------------
"/ -------------- PLUGIN SETTINGS ------------------
"---------------------------------------------------

"Nerdtree quits after I select and open a file
let NERDTreeQuitOnOpen=1

"Default completion type -- Omnicomplete
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabDefaultCompletionType = "context" "TODO Figure this out 

" Remember the awesomeness of ragtag CX-<Slash> 
let g:ragtag_global_maps = 1 "For Ragtag 

"Bufftabs directory and file name only
:let g:buftabs_only_basename=1

"Add extra terms for TaskList
let g:tlTokenList = ["FIXME", "TODO", "XXX", "todo", "xxx", "TODO:",  "NOTE:", "note:", "note", "NOTE", "NB", "xxx:", "XXX:"]

"---------------------------------------------------
"/ ------ FILETYPE SPECIFIC STUFF -----------------
"---------------------------------------------------
"see here for example http://amix.dk/blog/post/19021
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


"---------------------------------------------------
"/ ------ ENCODINGS AND FILE FORMATS SETTINGS ------
"---------------------------------------------------

"Sets all files to unix filetype. Changes EOL's to LF and strips CRLF (dos) line
"endings. I really don't like CRLF even though I work on windows. Git complains if
"there are a mixture of CRLF and LF. This fixes that by only saving as LF.
"http://vim.wikia.com/wiki/Change_end-of-line_format_for_dos-mac-unix
"set fileformats=unix,dos
set fileformat=unix   
	
"Sets Unicode. 
"http://vim.wikia.com/wiki/Working_with_Unicode
if has("multi_byte")
  if &termencoding == ""
		let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8 bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif


"--------------------------
"/ ------ JAVA STUFF -------
"--------------------------
"TODO Turn this into function and get rid of autocmd 
"TODO Change mappings
"TODO see http://vim.wikia.com/wiki/Compile_Java_with_Sun_JDK_javac

"http://stackoverflow.com/questions/6411979/compiling-java-code-in-vim-more-efficiently 
autocmd Filetype java set makeprg=javac\ %
autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
autocmd Filetype java map <F9> :make<Return>:copen<Return>
autocmd Filetype java map <F10> :cprevious<Return>
autocmd Filetype java map <F11> :cnext<Return>

"--------------------------
"/ ------ PHP STUFF -------
"--------------------------
"TODO Figure out if I should get rid of this section

" .. becomes ->
"autocmd FileType php :iabbrev .. ->

" run file with PHP CLI 
"autocmd FileType php noremap <leader>mc :w !C:\XAMPP\xampp\php\php.exe -f "%:p"<CR>

" PHP parser check (CTRL-L) (syntax check!)
"autocmd FileType php noremap <leader>ms :w !C:\XAMPP\xampp\php\php.exe -l "%:p"<CR>

"Text formatting options. Defaul is (for php) set fo=qrowcb
"and set fo=tcq for the rest. 
"***Note*** if text and comment starts fucking up check out the trouble
"shooting part of format options in HELP.
"TODO: fix 'next line is commented when newline from commented line'
autocmd FileType php set fo=tcqawb

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


"-------------------------------------------------
"/ ------ VIM ON WINDOWS WITH CYGWIN -----------
"-------------------------------------------------

if has('win32') 
	"Stuff to keep in mind in case I switch to Cygwin
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
	"set shell=C:/cygwin/bin/bash
	"set shellcmdflag=--login\ -c
	"set shellxquote=\"	
	"set shell=C:/cygwin/bin/mintty
	"set shell=C:/cygwin/bin/bash
	"set shellcmdflag=--login\ -c

	"remap ! to got to CWD. XXX Doesn't work with aliases
	"http://vim.1045645.n5.nabble.com/running-shell-command-in-the-directory-of-the-file-td1185993.html
	"cnoremap !cwd !cd '%:p:h'; 

	"may be of interest later
	"echo shellescape(expand("%:p:h"))
endif
