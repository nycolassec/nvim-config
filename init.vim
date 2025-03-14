" Global Sets """"""""""
syntax on            " Enable syntax highlight
set number           " Enable line numbers
set relativenumber   " Show relative numbers
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=12      " Minimum number of lines to keep above and below the cursor
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set cmdheight=2      " Give more space for displaying messages
set updatetime=100   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set mouse=a          " Enable mouse support
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any
set hlsearch          " Hilight search

let NERDTreeQuitOnOpen=1 " Hidden NERDTREE when open a file
let NERDTreeShowHidden=1 "Show hidden files

let mapleader = '\'
let g:airline_theme = 'violet'
" Global Sets """"""""""


" Remaps """"""""""
  nmap <space>ee :NERDTreeToggle<CR>

  " Shortcuts for split navigation
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

  " Adding an empty line below, above and below with insert
    nmap op o<Esc>k
    nmap oi O<Esc>j
    nmap oo A<CR>

  " Create a tab
    nmap te :tabe<CR>

  " Navigate between buffers
    nmap ty :bn<CR>
    nmap tr :bp<CR>

  " Delete a buffer
    nmap td :bd<CR>

  " Create splits
    nmap th :split<CR>
    nmap tv :vsplit<CR>

  " Close splits and others
    nmap tt :q<CR>


  " Call command shortcut
    nmap tc :!
" Remaps """"""""""


" Auto CMD """"""""""
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
" Auto CMD """"""""""


" Plug Plugins """"""""""
call plug#begin()
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree'

    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'dense-analysis/ale'
    "Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
    Plug 'honza/vim-snippets'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
call plug#end()
" Plug Plugins """"""""""


" ALE """"""""""
let g:ale_linters = {
\   'cpp':[],
\   'c':[],
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'cpp': ['clang-format'],
\   'c': ['clang-format'],
\}

let g:ale_fix_on_save = 1
" ALE """"""""""


" Telescope """"""""""
if (has("nvim"))
      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif
" Telescope """"""""""


" Themes """""""""""
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"let g:airline_theme = 'sonokai'
"let g:sonokai_style = 'andromeda'
"let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 0
"let g:sonokai_diagnostic_line_highlight = 1
"let g:sonokai_current_word = 'bold'
"colorscheme sonokai

colorscheme catppuccin-macchiato " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

if (has("nvim")) "Transparent background. Only for nvim
    highlight Normal guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
endif
" Themes """""""""""


" AirLine """"""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" AirLine """"""""""


" COC """"""""""
"let g:coc_global_extensions = ['coc-snippets', 'coc-explorer', 'coc-pairs', 'coc-clangd',]
" COC """"""""""

" Coc Snippets """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
"xmap <leader>x  <Plug>(coc-convert-snippet)

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? " " \<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ <SID>check_back_space() ? " "\<TAB>" :
"      \ coc#refresh()

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"let g:coc_snippet_next = '<tab>'
" Coc Snippets """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Coc Explorer """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":nnoremap <space>e :CocCommand explorer<CR>

"let g:coc_explorer_global_presets = {
"\   '.vim': {
"\     'root-uri': '~/.vim',
"\   },
"\   'cocConfig': {
"\      'root-uri': '~/.config/coc',
"\   },
"\   'tab': {
"\     'position': 'tab',
"\     'quit-on-open': v:true,
"\   },
"\   'tab:$': {
"\     'position': 'tab:$',
"\     'quit-on-open': v:true,
"\   },
"\   'floating': {
"\     'position': 'floating',
"\     'open-action-strategy': 'sourceWindow',
"\   },
"\   'floatingTop': {
"\     'position': 'floating',
"\     'floating-position': 'center-top',
"\     'open-action-strategy': 'sourceWindow',
"\   },
"\   'floatingLeftside': {
"\     'position': 'floating',
"\     'floating-position': 'left-center',
"\     'floating-width': 50,
"\     'open-action-strategy': 'sourceWindow',
"\   },
"\   'floatingRightside': {
"\     'position': 'floating',
"\     'floating-position': 'right-center',
"\     'floating-width': 50,
"\     'open-action-strategy': 'sourceWindow',
"\   },
"\   'simplify': {
"\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
"\   },
"\   'buffer': {
"\     'sources': [{'name': 'buffer', 'expand': v:true}]
"\   },
"\ }

" Use preset argument to open it
"nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
"nnoremap <space>ef :CocCommand explorer --preset floating<CR>
"nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
"nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
"nnoremap <space>el :CocList explPresets


" C/C++ """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_c_clangformat_options = '"-style={
\ BasedOnStyle: google,
\ IndentWidth: 4,
\ ColumnLimit: 100,
\ AllowShortBlocksOnASingleLine: Always,
\ AllowShortFunctionsOnASingleLine: Inline,
\ FixNamespaceComments: true,
\ ReflowComments: false,
\ }"'









