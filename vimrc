set nocompatible              " be iMproved, required
filetype off                  " required

"{{{ - Bundles
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Repeatable
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
" Plugin 'thinca/vim-textobj-between'
" Vim Ruby
Plugin 'vim-ruby/vim-ruby'
" Vim Rails
Plugin 'tpope/vim-rails'
" Adds end, after if, def etc.
Plugin 'tpope/vim-endwise'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" Vim Rbenv
Plugin 'tpope/vim-rbenv'
" Auto-completion
Plugin 'Shougo/neocomplete.vim'
" Snippets
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
" JSON Syntax
Plugin 'elzr/vim-json'
" Fuzzy searh
Plugin 'junegunn/fzf.vim'
" indent guides
Plugin 'nathanaelkane/vim-indent-guides'
" More colorschemes
Plugin 'flazz/vim-colorschemes'
" Search
Plugin 'rking/ag.vim'
" PHP support?
Plugin 'StanAngeloff/php.vim'
" Open vim on the right line from Unity
Plugin 'bogado/file-line'
" When you spend too much time formatting method calls
Plugin 'FooSoft/vim-argwrap'
" Golang
Plugin 'fatih/vim-go'
" Dart
Plugin 'dart-lang/dart-vim-plugin'

call vundle#end()            " required
filetype plugin indent on    " required
"}}}

"{{{ General Settings
let mapleader = ","
set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  " indent slim two spaces, not four
  autocmd! FileType *.slim set sw=2 sts=2 et

  autocmd FileType go map <buffer> :A :GoAlternate
  autocmd FileType go nnoremap <leader>t :GoTest<cr>
augroup END

color Molokai
"set background=dark

set nocompatible      " Use vim, no vi defaults
set relativenumber    " Show line numbers
set number            " Show line numbers
set ruler             " Show line and column number
set colorcolumn=80,100
syntax enable         " Turn on syntax highlighting allowing local overrides
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set termguicolors

" enable 24 bit color support
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

set viminfo='10,\"100,:20,%,n~/.viminfo

set encoding=utf-8    " Set default encoding to UTF-8

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

" keep more context when scrolling off the end of a buffer
set scrolloff=3

"" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" make all yanking/deleting copy to the system clipboard.
" set clipboard=unnamedplus

" Keep search pattern at the center of screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

nnoremap j gj
nnoremap k gk

" Double escape for removing search highlights
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" Why?
set lazyredraw

set shell=bash

"" Wild settings
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*
set wildignore+=*.apid

" Disable Arrow Keys!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
"}}}

"{{{ - Bundle Settings


" STATUS LINE:

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  set statusline=[%{tabpagenr()}:%n]\ %f\ %{fugitive#statusline()}\ %(\ %M%R%H)%)%=\ =Pos=<%l,%c%V>\ %P
  set showcmd
endif


" CUSTOM LEADERS AND SHORTCUTS:

" Silver searcher
nnoremap <leader>a :Ag!<space>
nnoremap <leader>A :AgFromSearch<cr>

" Go back to last used buffer
nnoremap <leader>b :b#<cr>

" Run rubocop on file
nnoremap <leader>r :!rubocop %<cr>

" Run rspec on file
nnoremap <leader>t :!bundle exec rspec %<cr>

" Run ci task
nnoremap <leader>T :!rake ci<cr>

" ] doesnt work with ^ on danish keyboards
nnoremap <leader>d <C-]><cr>

" ArgWrap
nnoremap <silent> <leader>w :ArgWrap<CR>

" Clipholder shortcut
noremap <leader>c "+
" vnoremap <leader>c "+

" Format JSON
nnoremap <leader>j :%!python -m json.tool

" Copy visual selection into clipholder
" NOTE: incompatible with clipholder shortcut because of viwp
" vnoremap <leader>c "+y

" Delete into black hole register to keep selection, also allows dotting?
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
" xnoremap <leader>p "_dP
xnoremap <leader>p ciw<C-r>0


" ZFZ SETTINGS:

set rtp+=/usr/local/opt/fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <leader>. :BTags<cr>

" Sane Ignore For ctrlp
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp\|vendor$',
"   \ 'file': '\.exe$\|\.so$\|\.dat$\|\.meta$'
"   \ }

" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0


" NEOCOMPLETE:

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>\<Space>" : "\<Space>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


" PHP VIM:

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" For conceal markers.
" Really no clue what this does.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" FILE BROWSING:

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"}}}

" Project vimrc support
if filereadable('.local.vim')
  source .local.vim
endif
