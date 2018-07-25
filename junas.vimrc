execute pathogen#infect()

set nocompatible

set ruler
set nonumber
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  set ft=mkd
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" These are Markdown
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,ronn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Show (partial) command in the status line
set noshowcmd
set noshowmode

" key bindings
nnoremap ; :

" ,ml appends a modeline
function! AppendModeline()
  let l:modeline = printf(" %s: set ts=%d sw=%d tw=%d :", "vim", &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" from http://www.reddit.com/r/vim/comments/p0ibb/vim_plugin_that_shows_a_userdefinable_quick/c3ljwh1
function! ToggleVimReference()
    if !exists("s:vim_reference_open") || s:vim_reference_open == 0
        let s:vim_reference_open = 1
        execute "botright vnew " . g:vim_reference_file
        execute "vertical resize " . g:vim_reference_width
    else
        update
        execute "bdelete " . g:vim_reference_file
        let s:vim_reference_open = 0
    endif
endfunction

let cue_scheme=$CUE_SCHEME

if cue_scheme == 'slight'
  " use the Solarized color scheme for light
  colorscheme solarized
  set background=light
else
  " use the xoria256 color scheme for dark
  colorscheme xoria256
  hi Folded  ctermfg=180 guifg=#dfaf87 ctermbg=234 guibg=#1c1c1c
  hi NonText ctermfg=252 guifg=#d0d0d0 ctermbg=234 guibg=#1c1c1c cterm=none gui=none
endif

set shiftround smarttab
set autoindent smartindent
set showmatch

set hidden
set nowrap
set nonumber

set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set t_vb=

set scrolloff=3
set nojoinspaces

set nobackup
set noswapfile

set diffopt+=iwhite
set diffexpr="-w -b -B"

set guioptions=

au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled = 1

imap ww <Esc>

let g:go_version_warning = 0

let g:slime_target = "tmux"

let g:slime_default_config = {"target_pane": "%0"}
