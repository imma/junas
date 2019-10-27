let g:iced_enable_default_key_mappings = v:true

let g:vim_markdown_folding_disabled = 1

let g:go_version_warning = 0

execute pathogen#infect()

set nocompatible

set ruler
set nonumber
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set wrap
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
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,ronn} set filetype=markdown
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,ronn} call s:setupMarkup()
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,ronn} call s:setupWrapping()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Show (partial) command in the status line
set noshowcmd
set noshowmode

set shiftround smarttab
set autoindent smartindent
set showmatch

set hidden
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

set guioptions=

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

