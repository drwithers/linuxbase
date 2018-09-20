"Most of these are pulled from https://dougblack.io/words/a-good-vimrc.html

syntax enable " enable syntax processing

"colors for vim found in /usr/share/vim/vim<version>/colors
"blue, darkblue, default, delek, desert, elflord,
"evening, industry, koehler, morning, murphy, pablo,
"peachpuff, ron, shine, slate, torte, zellner, ...solarized
"solarized https://github.com/altercation/vim-colors-solarized
set background=dark
let g:solarized_termcolors=256 "toggle this if colors look weird
colorscheme solarized

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces

set number " show line numbers

set showcmd " show command in bottom bar

set cursorline " highlight current line

set showmatch " highlight matching [{()}]

"move vertically by visual line
nnoremap j gj
nnoremap k gk

inoremap jj <esc>
nnoremap ; :
