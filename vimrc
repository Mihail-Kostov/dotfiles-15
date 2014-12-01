set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" other plugins

Plugin 'bling/vim-airline'
Plugin 'chrisbra/Colorizer'
Plugin 'davidhalter/jedi-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'smancill/conky-syntax.vim'
Plugin 'tpope/vim-surround'
Plugin 'xuhdev/SingleCompile'

call vundle#end()            " required
filetype plugin indent on

" general settings

autocmd! bufwritepost .vimrc source %   " apply changes to vimrc
set clipboard=unnamedplus               " normal clipboard
syntax on                               " syntax highlight
set autoread
set nobackup                            " no swap and backup files
set noswapfile

" UI
set t_Co=256
let g:hybrid_use_Xresources = 1
colorscheme hybrid

set number
autocmd InsertEnter * :set nornu        " number in insert mode
autocmd InsertLeave * :set rnu          " rel numbers in normal
set nowrap                              " do not wrap lines
set cursorline                          " highlight current line
set laststatus=2                        " Always display status bar
set showcmd
set splitbelow                          " new splits below and to the right
set splitright
set mouse=a

" tabs
set tabstop=4                           " Set tab=4 spaces
set shiftwidth=4
set expandtab                           " Use spaces instead of tabs
set smarttab

" code folding
set foldmethod=indent                   " code folding settings
set foldnestmax=2
set nofoldenable

" wildmode
set completeopt=longest,menuone
set wildignore+=*.so,*.swp,*.zip,*.o,*.pyc,*.javac,*.out,*.luac,*.class
set wildignore+=*.bmp,*.jpg,*.jpeg,*.png,*.gif
set wildignore+=*.exe,*.dll,*.manifest,*.gz
set wildignore+=*/Downloads/*,*/temp/*,*/Documents/*,*/Pictures/*,*/Videos/*
set wildmenu
set wildmode=longest:full,full

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

if has('gui_running')
    set guioptions = " remove everything gui
    set guifont=Monaco\ for\ Powerline\ 9 " set font
endif
set guiheadroom=0

" Removes trailing spaces
    function! TrimWhiteSpace()
        %s/\s\+$//e
    endfunction
autocmd filetype c,cpp,css,hmtl,java,lua,perl,python,sh,text,xml autocmd BufWritePre * :call TrimWhiteSpace()


" keymappings

" friendly keymaps
let mapleader="\<Space>"

nnoremap ; :
vnoremap ; :

inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>gV
vnoremap kj <Esc>gV

" navigate wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Delete current buffer
inoremap <C-q> <Esc>:bp\|bd #<CR>
nnoremap <C-q> :bd<CR>

" tab and buffer navigation like firefox
nnoremap <C-tab>   :bnext<CR>
inoremap <C-tab>   <C-o>:bnext<CR>
nnoremap <C-S-tab> :tabnext<CR>
inoremap <C-S-tab> <C-o>:tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

" save with C-s
noremap <C-s> :update<CR>
inoremap <C-s>  <C-o>:update<CR>

" cd to current file
cnoremap cd. :lcd%:p:h<CR>:pwd<CR>

" Y consistent with D and C
nnoremap Y y$

" Clear search highlight
nnoremap <BS> :noh<CR>

" indent code better
vnoremap < <gv
vnoremap > >gv

" Insert timestamp
nmap <F5> "=strftime("%A, %d %B %Y %H:%M %Z")<C-M>p


" package specific keymappings

" neocomplete
" use TAB completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" NERDTree
map <F2> :NERDTreeToggle<CR>

" Single compile
nnoremap <F9> :SCCompile<cr>
nnoremap <F10> :SCCompileRun<cr>


" package specific options

" airline
let g:airline_powerline_fonts = 1

" colorizer
let g:colorizer_auto_filetype='css,html,xdefaults'

" ctrl-p
let g:ctrlp_reuse_window  = 'startify'
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$|\/images',
  \ 'file': '\.(dat|DS_Store)$'
  \ }

" Jedi
let g:jedi#completions_enabled = 0
autocmd FileType python setlocal completeopt-=preview

" neocomplete
let g:neocomplete#enable_at_startup = 1

" startify
autocmd FileType startify setlocal buftype=
let g:startify_bookmarks = [
    \ '~/xcomp_confs',
    \ '~/.vimrc',
    \ ]
let g:startify_list_order = [
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ['   Recently used:'],
  \ 'files',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ]

" syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_full_redraws = 1
let g:syntastic_auto_jump = 2 " Jump to syntax errors
let g:syntastic_auto_loc_list = 1 " Auto-open the error list
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=W391'

