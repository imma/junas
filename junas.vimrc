syntax enable

set tabstop=2
set softtabstop=2
set expandtab

set nonumber

set showcmd

set cursorline

filetype indent on

set wildmenu

set lazyredraw

set showmatch

set incsearch
set hlsearch

nnoremap <leader><space> :nohlsearch<CR>

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=marker

nnoremap <space> za

inoremap jk <esc>

call pathogen#infect()

" Status bar
set laststatus=2

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" These are Markdown
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,ronn} set ft=mkd

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use modeline overrides
set modeline
set modelines=10

" Show (partial) command in the status line
set showcmd

" key bindings
nnoremap ; :

" ,ml appends a modeline
function! AppendModeline()
  let l:modeline = printf(" %s: set ts=%d sw=%d tw=%d :", "vim", &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
