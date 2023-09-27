set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-rsi'
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock'
  " Plug 'thinca/vim-textobj-between'
  " Vim Ruby
  Plug 'vim-ruby/vim-ruby'
  " Vim Rails
  Plug 'tpope/vim-rails'
  " Adds end, after if, def etc.
  Plug 'tpope/vim-endwise'
  " Using vim-plug
  Plug 'elixir-editors/vim-elixir'
  " Git wrapper
  Plug 'tpope/vim-fugitive'
  " Plug 'tpope/vim-rhubarb'
  " Vim Rbenv
  Plug 'tpope/vim-rbenv'
  " Auto-completion
  Plug 'lifepillar/vim-mucomplete'
  " JSON Syntax
  Plug 'elzr/vim-json'
  " Fuzzy searh
  Plug 'junegunn/fzf.vim'
  " indent guides
  Plug 'nathanaelkane/vim-indent-guides'
  " More colorschemes
  Plug 'flazz/vim-colorschemes'
  " Search
  Plug 'rking/ag.vim'
  " Open vim on the right line from Unity
  Plug 'bogado/file-line'
  " When you spend too much time formatting method calls
  Plug 'FooSoft/vim-argwrap'
  " Golang
  Plug 'fatih/vim-go'
  " Javascript
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'prettier/vim-prettier'
  " Tests & Auto-start OmniSharp server
  " Plug 'tpope/vim-dispatch'
  " Plug 'OmniSharp/omnisharp-vim'
  " Generic test helper
  Plug 'janko-m/vim-test'
  " Docker syntax highlighting
  Plug 'ekalinin/Dockerfile.vim'
call plug#end()

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
  autocmd FileType markdown setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby set iskeyword=@,48-57,_,192-255,?
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et
  autocmd FileType *.cs set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  " indent slim two spaces, not four
  autocmd! FileType *.slim set sw=2 sts=2 et

  autocmd FileType go map <buffer> :A :GoAlternate
  autocmd FileType go nnoremap <leader>T :GoTest<cr>
  autocmd FileType go nnoremap <leader>t :GoTestFunc<cr>

  autocmd FileType elixir setlocal formatprg=mix\ format\ -
  autocmd FileType elixir nnoremap <leader>r :!mix format<cr>

  autocmd FileType mail setlocal fo+=aw
augroup END


color molokai

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
set scrolloff=5

"" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
set gdefault    " replace all occurances on lines by default

" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" If a file is changed outside of vim, automatically reload it without asking
set autoread

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

" Makes macros execute faster
set lazyredraw

set shell=/bin/zsh

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
nnoremap <leader>a :Ag! -Q<space>
nnoremap <leader>A :AgFromSearch<cr>

" Go back to last used buffer
nnoremap <leader>b :b#<cr>

" Run rubocop fix on file
if filereadable('./.rubocop_config.yml')
  nnoremap <leader>r :!./bin/rubocop -a --config=./.rubocop_config.yml %<cr>
else
  nnoremap <leader>r :!./bin/rubocop -a %<cr>
endif

" Run rubocop on current folder
nnoremap <leader>R :!./bin/rubocop --parallel<cr>

" Run current rspec
nnoremap <leader>t :TestFile<cr>

" Run all rspecs
nnoremap <leader>T :TestSuite<cr>

" Init search replace
nnoremap <leader>s :%s/

" ] doesnt work with ^ on danish keyboards
nnoremap <leader>d <C-]><cr>

" ArgWrap
nnoremap <silent> <leader>w :ArgWrap<CR>

" Clipholder shortcut
noremap <leader>c "+
" vnoremap <leader>c "+

" Format JSON
nnoremap <leader>j :%!jq .<CR>

" Copy visual selection into clipholder
" NOTE: incompatible with clipholder shortcut because of viwp
" vnoremap <leader>c "+y

" Delete into black hole register to keep selection, also allows dotting?
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
" xnoremap <leader>p "_dP
xnoremap <leader>p ciw<C-r>0

" Run all rspecs
nnoremap <leader>x :Commands<cr>

" Next in quickfix
nnoremap <leader>n :cn<cr>

" Move lines up or down
" https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" VIM TESTING:

let test#ruby#rspec#executable = 'bundle exec rspec'


let g:rails_projections = {
      \   "app/controllers/*_controller.rb": {
      \     "test": ["spec/requests/{}_controller_spec.rb"]
      \   },
      \   "spec/requests/*_controller_spec.rb": {
      \     "alternate": ["app/controllers/{}_controller.rb"]
      \   }
      \ }

" AUTO COMPLETION:

set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1
" let g:mucomplete#chains = { 'default': [ 'c-p', 'omni', 'keyn', 'incl'] }


" ZFZ SETTINGS:
set rtp+=/opt/homebrew/opt/fzf
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = []
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <leader>. :BTags<cr>
nnoremap <leader>, :Tags<cr>


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R --exclude='.git' --exclude='node_modules'
      \ --exclude='*.erb' --exclude='*.js' --exclude='*.jsx' --exclude='vendor'
      \ --exclude='*.html' --exclude='Library' --exclude='*.css'
      \ --exclude='*.scss' --exclude='*.xml' --exclude='*.ts'
      \ --exclude='spec' --exclude='*.json' --exclude='*.xsl'
      \ --exclude='*.yaml' --exclude='*.md' .


" FILE BROWSING:

let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_winsize = 40
let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"
let g:netrw_browsex_viewer="open -a Google \Chrome"
" nnoremap <silent> gx :execute 'silent! !open ' . shellescape(expand('<cWORD>'), 1)<cr>

"}}}


" FORMAT XML:

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()


" OVERWRITE COLORSCHEME:

highlight LineNr guifg=#777777

" TEMPLATES:

au BufNewFile *_spec.rb r ~/.vim/skeleton.spec

" " PRETTIER:

let g:prettier#autoformat = 0
let g:prettier#exec_cmd_path = "./node_modules/prettier"
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx Prettier

" LINT:
" let g:ale_fix_on_save = 1
" only explicitly enabled linters
" let g:ale_linters_explicit = 1
" autocmd BufWritePost *.rb !bundle exec rubocop -a --config=./.rubocop_config.yml %
" autocmd BufWritePost *.rb :RuboCop -a
" let g:vimrubocop_rubocop_cmd = "rubocop-daemon exec --"

" STANDARD RUBY
command! StandardRubyFix cexpr system('standardrb --fix .')

" OMNISHARP:

" Use the stdio version of OmniSharp-roslyn:
" let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_selector_ui = 'fzf' " Use fzf.vim

" Project vimrc support
if filereadable('.local.vim')
  source .local.vim
endif
