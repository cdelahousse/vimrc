" Christian Delahousse's vimrc
" http://christian.delahousse.ca
" http://github.com/cdelahousse 
" Last updated: 2013/01/03 
"
" See changelog
"
"
" Note: g:my_vim_path references the folder 
" where this file and other my other vim settings are located
" This was to be able to contain everything in one directory to ease deploying my
" vimrc to multiple machines
"
"--------------------------------------------
"/ ------------ VUNDLE SETTINGS -------------
"--------------------------------------------
"- Keep these settings at the top of vimrc --
"--------------------------------------------
set nocompatible "called again in case local vimrc didn't. For Vundle

"Package Management. Essential
Bundle 'gmarik/vundle'

"Colour schemes
Bundle 'Solarized'
Bundle 'jnurmine/Zenburn'

Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/nerdtree' 
"Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'matchit.zip'

Bundle 'buftabs'
Bundle 'IndexedSearch'
Bundle 'superjudge/tasklist-pathogen'
"TODO FIGURE SUPERTAB OUT
"Bundle 'ervandew/supertab'
"Figure out
"Bundle 'Shougo/neocomplcache'
"Bundle 'Lokaltog/vim-easymotion'

"align shit
"http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
"Bundle 'godlygeek/tabular'

"For ctags
"Bundle 'majutsushi/tagbar'

"TODO Figure if htis is worth installing
"Bundle 'Command-T' ----> apperently ctrlp is better

"----------------------------------------
"/------- GENERAL CONFIG SETTINGS -------
"----------------------------------------
"setting personal modifying key to , 

let mapleader = ","

"filetype on "VUNDLE needs this off, see system vimrc
filetype plugin on "If problem with vundle, turn off

set ttyfast "fast terminal connection, more characters sent to screen, faster in term
set shellslash " Set the forward slash to be the shell slash
set hidden "Buffers can live in background
set virtualedit=onemore         " allow for cursor beyond last character
set gdefault " the /g flag on :s substitutions by default

set viminfo+='1000,f1,:1000,/1000  "Sets bigger viminfo file. Saves registers, command history, etc.

set history=100	"sets :command history 

set autochdir "Change cwd to current file whenever a window change happens

"Prevent exploit 
"http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html
set modelines=0 

"----------------------------------------------
"/ -------------- EDITING  --------------------
"----------------------------------------------

"set autoread  "Reload files changed outside vim

"TODO SEE User guide section 30.6 for MORE ON FORMATTING COMMENTS
"set formatoptions=qn1tca "see fo-table. TODO: REVIEW

set wrap "wrap text
set linebreak "wrap lines at convenient points
set textwidth=80 "hard line breaks at this number
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

"Allow cursor to move freely in block visual mode
set virtualedit=block

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

	"Cygin as shell
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

" When completing by tag, show the whole tag, not just the function name
set showfulltag

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

else "if &term=~"^xterm" || &term=~'rxvt-cygwin-native' 
	
	"Set terminal to 256 colors
	"Keep this on top of colorscheme
	set t_Co=256

	"for tmux
	"TODO: Adds weird block character when not in tmux. Fix this. Put this within an if
	"statment or something
	set term=screen-256color

	"let g:solarized_termcolors=256
	colorscheme zenburn

	"highlight bg color of current line and remove default underlinehlight cursor
	hi CursorLine cterm=none ctermbg=237 


	"Highlight line in insert mode
	set nocursorline
	autocmd InsertLeave * set nocursorline
	autocmd InsertEnter * set cursorline
	
	"For Mintty
	"http://code.google.com/p/mintty/wiki/Tips

endif


"---------------------------------------------------
"/ ------- MODIFIED DEFAULT MAPPINGS --------------
"---------------------------------------------------

" Switches : to ;. Saves alot of keystrokes
" Normal mode only
nnoremap ; :
"I sometimes type with a french keyboard
nnoremap é ;
nnoremap É ,

"F1 always gets in the way of ESC 
nnoremap <F1> <NOP>

"Q is ex mode, which I never use but always accidentally enter
nnoremap Q <NOP>

"Fuck man pages
nnoremap K <NOP>

"For long lines. Cursor goes down at line wrap instead of line end
nnoremap j gj
nnoremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
" (default: Y synonym for yy)
nnoremap Y y$

"allow deleting selection without updating the clipboard (yank buffer) via
"http://www.pixelbeat.org/settings/.vimrc Underscore register = blackhole added h to
"fix bug
noremap x "_xh 
noremap X "_X

"Keep jump in middle of window on search
"https://bitbucket.org/sjl/dotfiles/src/ef5962b5abed/vim/.vimrcw
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g; g;zz
nnoremap g, g,zz

" Keep the cursor in place while joining lines
" (from github/sjl)
nnoremap J mzJ`z

" L is easier to type, and I never use the default behavior.
"TODO FIND APPROPRIATE KEY
"Remaps beg of line
"noremap L $ 

"TODO also remap 0  end of line to somethingbetter

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

"XXX TESTING SPEED OF VIM WITHOUT THESE inoremaps. VIM IS SLOWING DOWN
""In insertmode, escape when jj or kk is pressed. It's a common
""sequence in normal mode but never in insert more.
"inoremap jj <ESC>gj
"inoremap kk <ESC>gk
"inoremap hh <ESC>h

""kj is Faster than ESC
"inoremap kj <ESC>

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
nnoremap <CR> ko<Esc>j

"Source _vimrc.
nmap <leader>s :source $MYVIMRC<CR>

"Edit vimrc 
execute "nmap <leader>se :e " . g:my_vim_path . "/vimrc<CR>"

" When vimrc is edited, reload it
"execute "autocmd! bufwritepost .vimrc source " . g:my_vim_path . "/.vimrc"

"redraw screen because tmux/gnu screen sometimes screws up
nnoremap <leader>sr :redraw!<cr>


" Bash like keys for the command line"
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"Reformat a paragraph of text
nnoremap <leader>fp gqip

"TODO Make this into something that I can preview inbrowser
"Markdown
nnoremap <leader>mm :%!markdown <cr>

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

"NOTE: Maybe I should switch to <leader>c, <leader>v to get out of ol'
"windows habits

"Prevents collision with normal mode ctrl-v (Blockwise selection mode)
nnoremap <leader>p  "+p

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
" from github/sjl
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" sudo write
ca w!! w !sudo tee >/dev/null "%"

" Change buffer and the clear the command line (for buftab plugin) using <silent> 
" This mapping conflicts with default mapping of moving cursor to top and bottom of the
" screen... But that's OK...
map <silent> <S-H> :bp<cr>
map <silent> <S-L> :bn<cr>

"<SPACE> now turns off highlighting along with it's current functionality.
nnoremap <silent> <space> :nohlsearch<Bar>:echo<CR>


"Open vim in current directory
"http://vimcasts.org/episodes/the-edit-command/
"cnoremap %% <C-R>=expand('%:h').'/'<cr>
"nnoremap <leader>ew :e %%
"nnoremap <leader>es :sp %%
"nnoremap <leader>ev :vsp %%
"nnoremap <leader>et :tabe %%


"---------------------------------------------------
"/ --------------- TEXT EXPANSION ------------------
"---------------------------------------------------

"Current date yyyy/mm/dd HH:MM:SS
iabbrev ydate <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>
"Current date yyyy/mm/dd 
iabbrev xdate/ <c-r>=strftime("%Y/%m/%d")<cr>
iabbrev xdate- <c-r>=strftime("%Y-%m-%d")<cr>

"Filename
inoremap fn/  <c-r>=expand('%:t:r')<cr>

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

"NERDTree
map <F2> :NERDTreeToggle<CR>

"for Tasklist (Todos, etc)
map <leader>t <Plug>TaskList

"Tagbar --> cTags
nmap <F8> :TagbarToggle<CR>

"Defaul easymotion keybinding: <leader><leader>
let g:EasyMotion_leader_key = '<leader><leader>'

" NerdCommenter (NOTES)
"[count]<leader>cy- Same as cc except that the commented line(s) are yanked first.
"<leader>c$ - Comments the current line from the cursor to the end of line.

"---------------------------------------------------
"/ -------------- PLUGIN SETTINGS ------------------
"---------------------------------------------------


"Enable neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

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
let g:tlTokenList = ["FIXME", "TODO", "XXX", "todo", "xxx", "TODO:",  "NOTE:", "note:", "note", "NOTE", "NB", "xxx:", "XXX:", "todo:"]


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

"--------------------------
"/ ------ TEXT FILES ----- 
"--------------------------

"Recognize markdown files
autocmd BufRead,BufNewFile   *.md setlocal filetype=markdown
autocmd BufRead,BufNewFile   *.txt setlocal filetype=text

"Set options
function! SetTextOptions()
	setlocal spell	 "Spelling errors
	setlocal textwidth=0 
	setlocal expandtab "spaces, not tabs
endfunction

"Register options
autocmd Filetype text,markdown call SetTextOptions()


"--------------------------
"/ ------ SCHEME --------- 
"--------------------------

"http://docs.racket-lang.org/guide/Vim.html
au BufReadPost *.rkt,*.rktl,*.scm set filetype=scheme

function! SetLispySettings()
	setlocal lisp
	setlocal autoindent
	setlocal expandtab
	setlocal lispwords+=public-method,override-method,private-method,syntax-case,syntax-rules
	setlocal lispwords+=..more..
endfunction

autocmd Filetype scheme call SetLispySettings() 



"--------------------------
"/ ------ JAVA STUFF -------
"--------------------------
"TODO Turn this into function and get rid of autocmd 
"TODO Change mappings
"TODO see http://vim.wikia.com/wiki/Compile_Java_with_Sun_JDK_javac

"http://stackoverflow.com/questions/6411979/compiling-java-code-in-vim-more-efficiently 
"autocmd Filetype java set makeprg=javac\ %
"autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"autocmd Filetype java map <F9> :make<Return>:copen<Return>
"autocmd Filetype java map <F10> :cprevious<Return>
"autocmd Filetype java map <F11> :cnext<Return>

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

"------------------------------------------
"/ ------ SETTINGS FOR MACHINE -----------
"------------------------------------------
if filereadable(glob("~/.vimrc.local")) 
	"Keep settings you only want stored on this machine
	source ~/.vimrc.local
endif

"http://news.ycombinator.com/item?id=1464623
"http://peter-hoffmann.com/2010/refresh-browser-on-save-with-inotify-and-xdotool.html
"Install XDOTOOL == fake linux input mouse and keyboard
"Refresshes browse
"autocmd BufWriteCmd *.html,*.css,*.haml :call Refresh_browser()
    "function()! Refresh_browser()
        "if &modified
            "write
            "silent !xdotool search --class google-chrome key ctrl+r
        "endif
    "endfunction
    "

"Strips trailing whitespace
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction


