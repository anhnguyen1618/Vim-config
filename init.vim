set relativenumber " set line number on the left side"

set tabstop=2 " set display width of tab; 1 tab = x space with                                                           
set expandtab " transform tab to x space (x is tabstop)                                                               
set autoindent " auto indent; new line with number of space at the beginning same as previous                                                                      
set shiftwidth=2 " number of space append to lines when type >> 
set termguicolors

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
map <F9> :YcmCompleter FixIt<CR>

call plug#begin()
Plug 'https://github.com/Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/NERDTree'
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'


call plug#end()

let g:ycm_global_ycm_extra_conf = "~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

let g:ycm_autoclose_preview_window_after_insertion = 1 

let g:ycm_confirm_extra_conf = 0

let g:ycm_always_populate_location_list = 1

let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['-style=file']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let mapleader = ","

" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jt :YcmCompleter GetType<CR>

syntax on
colorscheme dracula

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

au VimEnter *  NERDTree
au BufEnter * NERDTreeMirror
