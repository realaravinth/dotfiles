"set relative line numbers on
:set number
:set relativenumber
:set rnu
execute pathogen#infect()
syntax on
filetype plugin indent on

set autoindent
"set tw=4
set tabstop=4
set shiftwidth=4
set expandtab

autocmd Filetype css setlocal tabstop=2
autocmd Filetype html setlocal tabstop=2
autocmd Filetype sh setlocal tabstop=2

"color scheme
colorscheme flattened_dark
set t_Co=256

"Airline theme customization
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1 

" Nerdtree
map  <C-b> :NERDTree <CR>

" setting 80-character line marker

if exists('+colorcolumn')
  set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" SSH sync

function Sync()
    :!  if [ $(pwd | grep "/home/aravinth/code/debian-gsoc") ]; then /home/aravinth/code/debian-gsoc/copy-to-vm.sh ;fi&
endfunction

map <C-s> :call Sync() <CR>
