" Install Vim-Plug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd!
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
" Logging
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ianks/gruvbox'
Plug 'iCyMind/NeoSolarized'
Plug 'flazz/vim-colorschemes'
Plug 'sickill/vim-monokai'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'       " high quality colorschemes

" Completion/Templating
Plug 'scrooloose/nerdcommenter'

" Command extention
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'

" Utils
Plug 'w0rp/ale'                      " Linting and error checking
Plug 'SirVer/ultisnips'              " Definitive Snippets
Plug 'phux/vim-snippets'             " Snippets collections
Plug 'chrisbra/Colorizer'            " colorize colors
Plug 'mhinz/vim-signify'             " show VCS changes
Plug 'mileszs/ack.vim'               " ack/rg support
Plug 'igankevich/mesonic'            " Meson Plugin for Vim
Plug 'jremmen/vim-ripgrep'           " Add rg search
Plug 'mrk21/yaml-vim'                " YAML formatting plugin
Plug 'sbdchd/neoformat'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'ararslan/license-to-vim'
Plug 'Vimjas/vim-python-pep8-indent'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'gcmt/taboo.vim'
Plug 'tpope/vim-obsession'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'gregsexton/MatchTag'           " Show matching html tag

" File Specific
Plug 'pangloss/vim-javascript'
Plug 'ekalinin/Dockerfile.vim'
Plug 'Yggdroot/indentLine'           " highlighting 4sp indenting
Plug 'sheerun/vim-polyglot'          " newer language support
Plug 'reisub0/hot-reload.vim'        " Hot reload for Flutter
Plug 'dart-lang/dart-vim-plugin'     " Dart Syntax Highlight & Commands
Plug 'chr4/nginx.vim'                " Nginx Syntax Highlighting
Plug 'lepture/vim-jinja'             " Syntax plugin for Jinja template
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Code Analysis and Completion
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Other Features
Plug 'editorconfig/editorconfig-vim' " editorconfig support

call plug#end()

call glaive#Install()

" Fundamental settings
let g:loaded_matchparen = 1
set encoding=utf-8           " encoding is utf 8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac
filetype on
filetype plugin on
filetype plugin indent on
syntax on

" Some useful settings
set smartindent
set expandtab                " tab to spaces
set tabstop=2                " the width of a tab
set shiftwidth=2             " the width for indent
set foldenable               " enable folding
set foldmethod=indent        " folding by indent
set foldlevel=99
set ignorecase               " ignore the case when search texts
set smartcase                " if searching text contains uppercase case will not be ignored
set clipboard+=unnamedplus   " Copies using system clipboard
set mouse=a mousemodel=popup " enable mouse support
set wildmenu                 " Show the choices when inserting commands
set lazyredraw

" Lookings
set number                   " line number
set numberwidth=5
"set relativenumber           " Sets relative line numbers in normal mode, absolute line numbers in insert
"set cursorline               " hilight the line of the cursor
set ruler
"set cursorcolumn             " hilight the column of the cursor
set nowrap                   " no line wrapping
"colorscheme gruvbox          " use the theme gruvbox
colorscheme wombat256mod
set background=dark          " use the light version of gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set showmatch                " Show matching parentesis
set autoread                 " Reload changed  files
set nobackup                 " remove the .ext~ files, but not the swapfiles
set writebackup
set noswapfile
set grepprg=rg\ --vimgrep    " use ripgreg instead of grep
set splitbelow               " Set the correct position of splitting
set splitright

" AIRLINE
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'gruvbox'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" NERDTREE
nnoremap <leader>f :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let NERDTreeMapOpenSplit='I'
let NERDTreeMapActivateNode='l'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" MAPPINGS
" select all mapping
noremap <leader>a ggVG

" allow Tab and Shift+Tab to
" tab  selection in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" most of the time I should use ` instead of ' but typing it with my keyabord
" is a pain, so just toggle them
nnoremap ' `
nnoremap ` '

" Space in normal mode for code folding
nnoremap <space> za

" Reimplement i behaviuor
nnoremap I i

" Go To Previus/Next Location of pointer
" Next
nnoremap <C-n> <C-i>
" Previus
nnoremap <C-p> <C-o>

" Disable arrow keys during insert mode
"inoremap OB <nop>
"inoremap OD <nop>
"inoremap OC <nop>
"inoremap OA <nop>

" New Mapping for Arrow Keys
nnoremap j h
nnoremap k gj
nnoremap i gk
nnoremap l l

vnoremap j h
vnoremap k gj
vnoremap i gk
vnoremap l l

" Move between tabs
nnoremap <M-l>  gt
nnoremap <M-j>  gT

" Move between tabs (on Mac)
"nnoremap ì  gt
"nnoremap ê  gT

" Navigation through PANES
nnoremap <C-j> <C-W><C-H>
nnoremap <C-i> <C-W><C-K>
nnoremap <C-k> <C-W><C-J>
nnoremap <C-l> <C-W><C-L>

" Change . to : in command mode
nnoremap . :

" Remap . behaviour
nnoremap - .

" Make uppercase
nnoremap mu <esc>viwUviw<esc>
inoremap <c-U> <esc>viwUea

" Replace work with yanked one
nnoremap riw viwp

" Fast movement through text
nnoremap <M-i> 10gk
nnoremap <M-k> 10gj

" Fast movement through text (on Mac)
nnoremap é 10gk
nnoremap ë 10gj

nnoremap rl g$
nnoremap rj g^

inoremap <M-.> >
inoremap <M-,> <

" Remap jk to ESC
vnoremap jk <esc>
inoremap jk <esc>

let mapleader = ","

" ####################
"     COC MAPPINGS
" ####################

"Easily restart CoC for LSP development
nnoremap <leader>cr :CocRestart<CR>
nnoremap <leader>cl :CocCommand workspace.showOutput

" Refresh completion results
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo Mappings
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Show all diagnostics
nnoremap <silent> <leader>w  :<C-u>CocList diagnostics<cr>

" Show all simbols
nnoremap <silent> <leader>l  :<C-u>CocList outline<cr>

" Go to previousely opened file in current buffer
nnoremap <leader>fb <C-^>


" Simply edit and source this config file
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

"Reformat file content
nnoremap <leader>if :FormatCode<CR>

" Easily open file in split and tabs and search for them
nnoremap <leader>ep :Files<CR>
nnoremap <leader>v :vsp<CR>:Files<CR>
nnoremap <leader>h :split<CR>:Files<CR>
nnoremap <leader>t :tabe<CR>:Files<CR>

" Reload syntax from start
nnoremap <leader>s :syntax sync fromstart<CR>

" Remove search results
nnoremap <silent><ESC> :nohlsearch<CR>

"####################
" Plugins Settings  "
"####################
" COC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"let g:coc_snippet_next = '<TAB>'
"let g:coc_snippet_prev = '<S-TAB>'



" ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
let g:ale_list_window_size = 5

let g:ale_php_phpcbf_standard='1TBS'
"let g:ale_php_phpcbf_standard= 'PSR2'
"let g:ale_php_phpcs_standard='phpcs.xml.dist'
"let g:ale_php_phpmd_ruleset='phpmd.xml'

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_linters_explicit = 1

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint'],
      \}

let g:ale_linters = {
      \ 'php': ['php', 'psalm'],
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint'],
      \}

let g:ale_fix_on_save = 1

" indentline
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['json', 'markdown']

" UltiSnip
let g:UltiSnipsExpandTrigger = "<M-o>"
let g:UltiSnipsJumpForwardTrigger = "<M-o>"
let g:UltiSnipsJumpBackwardTrigger = "<M-p>"

" This slows down Nvim a lot
let g:vue_disable_pre_processors=1

" New Leader key for Emmet
let g:user_emmet_leader_key='<C-Z>'

" enable all function in all mode
let g:user_emmet_mode='a'

" License-to-vim
let g:license_author = 'Giacomo Alberini'
let g:license_email = 'giacomoalbe@gmail.com'

" Python Neovim Integration
let g:python3_host_prog = '/home/giacomo/.pyenv/versions/neovim3/bin/python'

" AUTO CMD
augroup AUTOCMD
  " crontab filetype tweak (the way vim normally saves files confuses crontab
  " so this workaround allows for editing
  au FileType crontab setlocal bkc=yes

  au FileType markdown setlocal conceallevel=0

  au FileType vue,javascript setlocal shiftwidth=2
  au FileType vue,javascript setlocal tabstop=2

  au FileType vu syntax sync fromstart

  " add yaml stuffs
  au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
