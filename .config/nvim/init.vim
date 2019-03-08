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
  Plug 'editorconfig/editorconfig-vim'

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
  Plug 'StanAngeloff/php.vim', {'for': 'php'}
  "Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'

  "Plug 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php'}
  "Plug 'phpactor/ncm2-phpactor', {'for': 'php'}
  "Plug 'ncm2/ncm2-ultisnips'
  "Plug 'maralla/completor.vim'

  " LanguageServer client for NeoVim.
  "Plug 'autozimu/LanguageClient-neovim', {
  "  \ 'branch': 'next',
  "  \ 'do': 'bash install.sh',
  "  \ }

" Other Features
  Plug 'editorconfig/editorconfig-vim' " editorconfig support

call plug#end()

" Fundamental settings
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

" Lookings
  set number                   " line number
  set numberwidth=5
  set relativenumber           " Sets relative line numbers in normal mode, absolute line numbers in insert
  set cursorline               " hilight the line of the cursor
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
  set nolazyredraw             " No lazy redraw for redraw bug

" split pane navigation
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" PHPACTOR
"" context-aware menu with all functions (ALT-m)
"nnoremap <m-m> :call phpactor#ContextMenu()<cr>

"nnoremap gd :call phpactor#GotoDefinition()<CR>
"nnoremap gr :call phpactor#FindReferences()<CR>

" Extract method from selection
"vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" extract variable
"vnoremap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
"nnoremap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" extract interface
"nnoremap <silent><Leader>rei :call phpactor#ClassInflect()<CR>

" AIRLINE
" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = '|'
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
inoremap OB <nop>
inoremap OD <nop>
inoremap OC <nop>
inoremap OA <nop>

" New Mapping for Arrow Keys
nnoremap j h
nnoremap k gj
nnoremap i gk
nnoremap l l

vnoremap j h
vnoremap k gj
vnoremap i gk
vnoremap l l

nnoremap <M-l>  gt
nnoremap <M-j>  gT

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

" Fast movement through text
vnoremap <M-i> 10gk
vnoremap <M-k> 10gj

nnoremap rl g$
nnoremap rj g^

inoremap <M-.> >
inoremap <M-,> <

" Remap jk to ESC
vnoremap jk <esc>
inoremap jk <esc>

let mapleader = ","

" Simply edit and source this config file
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

"Reformat file content
nnoremap <leader>if gg=G

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
  " disable linting while typing
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_open_list = 1
  let g:ale_keep_list_window_open=0
  let g:ale_set_quickfix=0
  let g:ale_list_window_size = 5

  let g:ale_php_phpcbf_standard='PSR2'
  let g:ale_php_phpcs_standard='phpcs.xml.dist'
  let g:ale_php_phpmd_ruleset='phpmd.xml'

  let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
    \ 'javascript': ['eslint'],
    \}

  let g:ale_fix_on_save = 1

" indentline
  let g:indentLine_setConceal = 0
  let g:indentLine_fileTypeExclude = ['json', 'markdown']

  "NCM2
  "augroup ncm2
  "  au!
  "  autocmd BufEnter * call ncm2#enable_for_buffer()
  "  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  "  au User Ncm2PopupClose set completeopt=menuone
  "augroup END

  " parameter expansion for selected entry via Enter
  "inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

  " cycle through completion entries with tab/shift+tab
  "inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
  "inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

  "autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

  " UltiSnip
  let g:UltiSnipsExpandTrigger = "<M-o>"
  let g:UltiSnipsJumpForwardTrigger = "<M-o>"
  let g:UltiSnipsJumpBackwardTrigger = "<M-p>"

  " PHP7
  let g:ultisnips_php_scalar_types = 1

  " This slows down Nvim a lot
  let g:vue_disable_pre_processors=1

  " New Leader key for Emmet
  let g:user_emmet_leader_key='<C-Z>'

  " enable all function in all mode
  let g:user_emmet_mode='a'


" AUTO CMD

" Save ctags when saving php files
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" crontab filetype tweak (the way vim normally saves files confuses crontab
" so this workaround allows for editing
au FileType crontab setlocal bkc=yes

au FileType markdown setlocal conceallevel=0

au FileType vue,javascript,php setlocal shiftwidth=2
au FileType vue,javascript,php setlocal tabstop=2

au FileType vu syntax sync fromstart

"augroup languageClient | au! CompleteDone | augroup END