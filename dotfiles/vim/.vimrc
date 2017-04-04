set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'                  " Manage vim plugins
Plugin 'scrooloose/nerdtree'                " File tree explorer
Plugin 'scrooloose/nerdcommenter'           " Toggle code comments
Plugin 'altercation/vim-colors-solarized'   " Eye-friendly colors
Plugin 'tpope/vim-fugitive'                 " Git functionality
Plugin 'hynek/vim-python-pep8-indent'       " Indent Python code
Plugin 'elzr/vim-json'                      " JSON syntax & highlighting
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'sjbach/lusty'
"Plugin 'mileszs/ack.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Current plugins:
" python3.0.vim   -- enables better Python highlighting
" minibufexpl.vim -- buffer explorer.
"
" See remappings at end of file

" Lusty requires a ruby plugin, generates a warning if it is missing. This
" suppresses that warning because it is obnoxious:
let g:LustyJugglerSuppressRubyWarning = 1

" Set color scheme
syntax enable
set background=light
colorscheme solarized

" General
set tabstop=8       "Value of pre-existing tabs
set softtabstop=4   "Set to match shiftwidth to always use spaces
set shiftwidth=4    "Value of new indent
set expandtab       "Replace tabs with shiftwidth spaces
"set textwidth=79   "Wrap after 79 characters
set textwidth=0     "Disable text wrapping
" colorcolumn only available in v7.3+
set colorcolumn=80  "Highlight 80th column
set autoindent      "Keep indent from previous line
set smartindent     "Try to guess when indenting is needed
set encoding=utf-8  "Set default encoding to UTF8
set number          "Show line numbers
set history=300     "Set a history of 300 commands
set fileformat=unix "Use \n line endings
set encoding=utf-8  "Set default encoding to UTF-8
set nocompatible    "Enable useful VIM features
set showmatch       "Briefly jump to matching parenthesis
set paste           "Fix issues with pasting from system clipboard
set ttymouse=xterm2
"set mouse=a         "Enable mouse in terminal Vim
set backupdir=~/.vim/backup//   "Write backups to .vim dir (vs working dir)
set directory=~/.vim/swap//     "Write swap files to .vim dir (vs working dir)
set undodir=~/.vim/undo//       "Write undo files to .vim dir (vs working dir)

" Commands for JSON files
"augroup json_autocmd 
"  autocmd! 
"  autocmd FileType json set autoindent 
"  autocmd FileType json set formatoptions=tcq2l 
"  autocmd FileType json set textwidth=78 shiftwidth=2 
"  autocmd FileType json set softtabstop=2 tabstop=8 
"  autocmd FileType json set expandtab 
"  autocmd FileType json set foldmethod=syntax 
"augroup END

"Highlight floating whitespace in red
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /^\t\+/ "Beginning tabs
match BadWhitespace /\s\+$/ "Trailing whitespace

"Enable filetype checking and filetype-specific plugins and indentation
"filetype plugin indent on
filetype plugin on

"Set colorscheme. See $VIMRUNTIME/colors for the standard list.
set guifont=Monospace\ 18
colorscheme desert
"if has ("gui_running")
"	colorscheme murphy
"endif

"Plugin-specific settings
"python3.0.vim -- turn on all extra highlighting
let python_highlight_all=1

"function to enable/disable mouse
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

" Long line highlighting
highlight OverLength ctermbg=blue guibg=blue
function! ToggleOverLengthHighlight()
    if !exists("b:olhl_on") || (b:olhl_on == 'n')
        :match OverLength '\%80v.\+'
        let b:olhl_on = 'y'
        echo "Matching lines over 79 characters"
    else
        :match
        let b:olhl_on = 'n'
        echo "Disabling long line matching"
    endif
endfunction

"Toggle long line hightlighting with F1
nnoremap <silent> <F1> :call ToggleOverLengthHighlight()<CR>
nnoremap <silent> <c-1> :call ToggleOverLengthHighlight()<CR>
"Toggle NERDTree with F6 in normal mode
nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> <c-6> :NERDTreeToggle<CR>
"Toggle MiniBufExplorer with F7 in normal mode
nnoremap <silent> <F7> :TMiniBufExplorer<CR>
nnoremap <silent> <c-7> :TMiniBufExplorer<CR>
"Toggle mouse with F12
nnoremap <F12> :call ToggleMouse()<CR>

nnoremap <F2> :set number!<CR>
nnoremap <c-2> :set number!<CR>

"Split current screen
nnoremap <F4> :split<CR>

"Launch Explore with F3
nnoremap <F3> :Explore<CR>

"" Easier split (pane) navigation 
"" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR> 
nmap <silent> <c-j> :wincmd j<CR> 
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"resize split windows
nnoremap = :exe "resize +2"<cr>
nnoremap - :exe "resize -2"<cr>

"add a new line without insert mode
nnoremap <enter> o<esc>k

noremap <expr> <silent> <home> col('.') == match(getline('.'),'\s')+1 ? '0' : '^'
imap <silent> <home> <c-o><home>

"don't show certain files (e.g. .pyc binaries) in NERDTree
let NERDTreeIgnore=['\.pyc$']

set hidden                  " requested by Lusty plugin
