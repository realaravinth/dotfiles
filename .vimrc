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

"color scheme:

" Solarized dark:
"colorscheme flattened_dark
"set t_Co=256

" medic_chalk
"colorscheme medic_chalk

" archman
" colorscheme archman

" identity
"colorscheme identity

" moonlight
" colorscheme moonlight

colorscheme wombat256grf


"Airline theme customization
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1 
"AirlineTheme wombat

" Nerdtree
map  <C-m> :NERDTree <CR>

" setting 80-character line marker

if exists('+colorcolumn')
  set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Setting splits open direction
set splitright
set splitbelow

" copy paste wih correct indentation
set paste

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[ q"  " default cursor (usually blinking block) otherwi
