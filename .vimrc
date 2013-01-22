call pathogen#infect('bundle')
" Enable really nice non-vi compatible features.
set nocompatible
" Turn on line numbers -:set rnu or :set nu
set relativenumber
" Turn on mouse support
set mouse=a
" Have the status bar tell us our mode
set modeline
" Show the modeline even if only 1 window is displayed
set ls=2
" Make it so that search highlights nicely
set hlsearch
set incsearch
" Allow us to use arrows after hitting Esc.
set esckeys
" Show our line position on the ruler.
set ruler
" Set an 80 char limit.
set colorcolumn=80
" autoindent all lines.
set autoindent
" Don't auto-move to the start of lines.
set nostartofline
" Make it so that we can backspace over auto-indent.
set backspace=2
" A zany autocomplete menu.
set wildmenu
set wildmode=list:longest,full
" Ignore cruft
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" Show all tabs, and trailing spaces.
set list listchars=tab:>-,trail:.,extends:>
" Turn on syntax highlighting.
syntax on
" Set a dark background for the solarized colour scheme.
set background=dark
" Use the solarized color scheme.
colorscheme solarized
" Ensure that indentation is on.
filetype indent plugin on
" Set tabs to be 2 spaces wide
set tabstop=2
" Set indendation to be 2 spaces wide.
set shiftwidth=2
" Convert tabs to spaces.
set expandtab
"folding settings
set foldmethod=indent   "fold based on indent
set foldlevel=99         "this is just what i use
""Setup the Tasklist plugin to map to \td
"map <leader>td <Plug>TaskList
""Setup a key binding for Gundo (an 'undo history' tool)
"map <leader>g :GundoToggle<CR>
"Setup a key binding for Pep8 (a Python style/lint tool)
let g:pep8_map='<leader>8'

" Quick pane navigation
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Command-T
let g:CommandTMatchWindowReverse   = 1
let g:CommandTMaxHeight            = 10
let g:CommandTMaxFiles             = 30000
let g:CommandTMaxCachedDirectories = 10
let g:CommandTScanDotDirectories   = 1
map <leader>f :CommandTFlush<CR>

" Make it so that arrow keys work in Command T in tmux.
if &term =~ "screen" || &term =~ "xterm"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim
