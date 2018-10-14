call plug#begin('~/.local/share/nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Raimondi/delimitMate'
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 't9md/vim-choosewin'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'

Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'heavenshell/vim-jsdoc'
Plug 'moll/vim-node'
Plug 'posva/vim-vue'
Plug 'othree/es.next.syntax.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chemzqm/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ] }
Plug 'gavocanov/vim-js-indent', { 'for': [ 'javascript', 'js', 'jsx' ] }
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'cakebaker/scss-syntax.vim'
Plug 'skwp/vim-html-escape', {'for': ['html']}
Plug 'wokalski/autocomplete-flow'

call plug#end()

"=====================================================
"===================== SETTINGS ======================

set nocompatible
filetype off
filetype plugin indent on

set laststatus=2
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent                  
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set mouse=a                     "Enable mouse mode

set noerrorbells             " No beeps
set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case 
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300
set pumheight=10             " Completion window max size
set conceallevel=2           " Concealed text is completely hidden
set lazyredraw
set wildmenu
set wildmode=longest:full,full
set tabstop=2       " The width of a TAB is set to 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab 

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" ~/.viminfo needs to be writable and readable
set viminfo='200

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

" color
syntax enable
set background=dark
set termguicolors

"colorscheme solarized8
"let g:airline_solarized_bg='dark'
colorscheme base16-tomorrow-night

"colorscheme base16-default-dark

set t_8f=^[[38;2;%lu;%lu;%lum  
set t_8b=^[[48;2;%lu;%lu;%lum  

" open help vertically
augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L
  
  " filetypes
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
  autocmd Filetype html setlocal ts=2 sts=2 sw=2
  autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
  autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
augroup END

autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.es6 set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript

autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

"=====================================================
"===================== MAPPINGS ======================

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","

" Some useful quickfix shortcuts for quickfix
map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

" put quickfix window always to the bottom
augroup quickfix
    autocmd!
    autocmd FileType qf wincmd J
    autocmd FileType qf setlocal wrap
augroup END

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Center the screen
nnoremap <space> zz

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Source the current Vim file
nnoremap <leader>pr :Runtime<CR>

" Close all but the current one
nnoremap <leader>o :only<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" New buffer tab
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" move line up down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

nnoremap <F6> :setlocal spell! spell?<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Do not show stupid q: window
map q: :q

" Don't move on * I'd use a function for this but Vim clobbers the last search
" when you're in a function so fuck it, practicality beats purity.
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

"===================== PLUGINS ================


" ================== Javascript =============== 
" Use JSON in .babelrc files
autocmd BufRead,BufNewFile .babelrc setfiletype json

" Allow JSX in .js files
let g:jsx_ext_required=0

let g:used_javascript_libs = 'vue'
autocmd BufReadPre *.vue let b:javascript_lib_use_vue = 1
autocmd FileType vue syntax sync fromstart
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
let g:vue_disable_pre_processors=1

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" flow syntax highlighting
let g:javascript_plugin_flow = 1

" JSDoc syntax highlighting
let g:javascript_plugin_jsdoc = 1

" https://github.com/othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore,react,flux,chai'

" ==================== Fugitive ===============
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>

" ==================== FZF ====================

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }

nmap <C-p> :FzfHistory<cr>
imap <C-p> <esc>:<C-u>FzfHistory<cr>

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" ==================== delimitMate ============
let g:delimitMate_expand_cr = 1   
let g:delimitMate_expand_space = 1    
let g:delimitMate_smart_quotes = 1    
let g:delimitMate_expand_inside_quotes = 0    
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'   

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" ==================== NerdTree ===============
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"

let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" faster bookmarking in NERDTree
autocmd Filetype nerdtree nnoremap <buffer> <leader>B :Bookmark<space>
autocmd Filetype nerdtree nnoremap <buffer> <leader>b :Bookmark<space><CR>

" NERDTree {{{
let NERDTreeIgnore = ['\.DS_Store$', '\.pyc$', '\.javac']
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1

" nerdtree mappings
let NERDTreeMapChangeRoot = 'u'
let NERDTreeMapUpdir = 'U'
let NERDTreeMapUpdirKeepOpen = 'c'

" ==================== ag =====================
let g:ackprg = 'ag --vimgrep --smart-case'                                                   

" ==================== markdown ===============
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['go=go', 'viml=vim', 'bash=sh']
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1

" ==================== vim-json ===============
let g:vim_json_syntax_conceal = 0

" ====== Various other plugin settings ========
nmap  -  <Plug>(choosewin)

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim: sw=2 sw=2 et

" ============== airline ===============
let g:airline_extensions = ["bufferline"]
let g:bufferline_echo = 0
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 0

