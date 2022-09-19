
set number
syntax on
set tabstop=4
set autoindent
set expandtab
set softtabstop=4
set cursorline


" Tabs
"----------------------------------------------------
" Open current directory
nmap te :tabedit
" List tabs
nmap tl :Unite tab

"----------------------------------------------------
" Windows
"----------------------------------------------------
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return>C-w>w

" Move windows
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Resize Window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-


"----------------------------------------------------
" Plugins
"----------------------------------------------------

