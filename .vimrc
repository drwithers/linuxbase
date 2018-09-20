"These are pulled from https://dougblack.io/words/a-good-vimrc.html

"colors for vim found in /usr/share/vim/vim<version>/colors
"blue, darkblue, default, delek, desert, elflord,
"evening, industry, koehler, morning, murphy, pablo,
"peachpuff, ron, shine, slate, torte, zellner, ...solarized
"https://vimawesome.com/plugin/solarized-8
"git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8
"set background=dark
"colorscheme solarized8
colorscheme peachpuff

"syntax enable " enable syntax processing

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces

set number " show line numbers

"set showcmd " show command in bottom bar

"set cursor line " highlight current line

"set showmatch " highlight matching [{()}]

"move vertically by visual line
nnoremap j gj
nnoremap k gk

inoremap jj <esc>
inoremap ; :
