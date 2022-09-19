" IMPORTANT BUILTIN HOTKEYS:
" - gf - go to file specified in the cursor

"===================
" Basic vim configs
"===================


:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set syntax
:set nocompatible

" 1
" FINDING FILES WITHOUT PLUGINS:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" :set path+=**
:set  path+=src
" Display all matching files when we tab complete
:set wildmenu

" NOW WE CAN:
" - Hit tab to :find files when we tab complete
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer
" 2
" CTAGS

" 3
" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - C-x,C-n (^x^n) for just this file
" - C-x,C-f for filenames (works with the path trick!)
" - C-x,C-] for tags
" - C-n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use C-n and C-p to go back and forth in the suggestion list



let g:polyglot_disabled = {}
let g:polyglot_disabled = ['sensible']

" CTAGS:
" - Press Ctrl+] to jump to definition
" - Press Ctrl+T to jump back
" - Ctrl+W, Ctrl+] to open definition in horizontal split

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Now remapped to:
" - Ctrl+\ to open definition in new tab
" - Alt+] to open definition in vertical split

" You can also use:
" - Ctrl+Left MouseClick to go to definition
" - Ctrl+Right MouseClick to jump back

"===========
" Plugins
"===========


call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' "Status Bar below
Plug 'morhetz/gruvbox' "Theme/Colorscheme
Plug 'elvessousa/sobrio' "Theme/Colorscheme
Plug 'dracula/vim', { 'as': 'dracula' } "Theme/Colorscheme
Plug 'arcticicestudio/nord-vim' "Theme/Colorscheme
Plug 'https://github.com/preservim/nerdtree' "NerdTree - sidebar-file-explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "NerdTree Highlighting
Plug 'ryanoasis/vim-devicons' "NerdTree Icons
Plug 'tpope/vim-surround' "Surrounding ysw)
Plug 'preservim/tagbar' "Tagbar for code navigation
Plug 'neoclide/coc.nvim' "Conqueror of Completion - Autocompletion for languages
Plug 'https://github.com/ap/vim-css-color.git' "Color shown in CSS files
Plug 'godlygeek/tabular' "Tabularize data, see Github repo for examples
Plug 'yegappan/mru' "Search and Open recent files
Plug 'voldikss/vim-floaterm' "Floating windows for vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "Fuzzy File Search Dependency
Plug 'junegunn/fzf.vim' "Fuzzy File Search
Plug 'leafgarland/typescript-vim' "Typescript support for intellisense
Plug 'peitalin/vim-jsx-typescript' "tsx/jsx support for intellisense
Plug 'sheerun/vim-polyglot' "Language syntax highlighting
Plug 'tpope/vim-commentary' "Comment and uncommenter with gcc and gc
Plug 'SirVer/ultisnips' "React Snippets
Plug 'mlaursen/vim-react-snippets' "Reac Snippets

call plug#end()

" set ColorScheme
" other available themes are:
" 1. dracula
" 2. nord
" 3. gruvbox
" 4. sobrio
colorscheme sobrio 


"============
" HOTKEYS
"============


"LEADER"
"leader key is space
let mapleader =" "

"Spell Checking and Correction
map <F4> :setlocal spell! spelllang=en_us<cr>
"set spell spelllang=en_us
hi SpellBad ctermfg=red guifg=red
" function to fix spelling of one word
function! Fixspell()
    normal! 1z=
endfunction 
"Fix Spelling
nnoremap <leader>z :call Fixspell()<CR>
nnoremap <leader>l :normal! 1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w<Cr>


"====================
" HOTKEYS - Floaterm
"====================

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return>C-w>w

"Floaterm next
nnoremap <leader>j :FloatermNext<CR>
"Floaterm previous tab
nnoremap <leader>k :FloatermPrev<CR>
"Floaterm w/ terminal 
nnoremap <leader>n :FloatermNew<CR>
"Floaterm Toggle tabs
nnoremap <leader>t :FloatermToggle<CR>
"Floaterm Configs
let g:floaterm_autohide = 0
let g:floaterm_autoclose = 2
let g:floaterm_height = 30
let g:floaterm_width  = 120
"Open Floater w/ neovim 
nnoremap <leader>v :FloatermNew nvim .<CR>
"Open Floater w/ vifm FileManager
nnoremap <leader>f :FloatermNew vifm<CR>
"Open file history
nnoremap <leader>h :MRU<CR>

" nnoremap <C-b> :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" Toggle Nerd Tree with Ctrl+b
nnoremap <C-b> :NERDTreeToggle<CR>

"Toggle Tagbar with F8
nnoremap <F8> :TagbarToggle<CR>

"Select auto Completion suggestion using Tab key
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

"Jump to definition of variable, Ctrl+O to jump back
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

"Update Plugins
nnoremap <F6> :PlugInstall<CR>
"Clean ununsed Plugins
nnoremap <F7> :PlugClean<CR>

" Set custom icon to NerdTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

"===================
" Fuzzy File Finder
"===================


" Configure fzf
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let $FZF_DEFAULT_COMMAND = 'ag -g ""'


"============
"  Terminal
"============

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" Resize splits, Space -, Space + 
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>



"============
" air-line 
"============


let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" COC CONFIGS:

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

