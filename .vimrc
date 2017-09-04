"
" Plugins
"
call plug#begin('~/.vim/plugged')
" Sensible .vimrc defaults
Plug 'tpope/vim-sensible'
" Alignment commands
Plug 'junegunn/vim-easy-align'
" Code-completion for various languages. We do not use it for typescript since
" the diagnostics UI doesn't work for said language.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Git commands
Plug 'tpope/vim-fugitive'
" Git changes overview in sidebar
Plug 'airblade/vim-gitgutter'
" Theme
Plug 'morhetz/gruvbox'
" Status/tabline
Plug 'vim-airline/vim-airline'
" Highlights parenthesis pairs with colors according to nesting level
Plug 'kien/rainbow_parentheses.vim'
" Unix commands (e.g., Move, Chmod, Mkdir, etc.)
Plug 'tpope/vim-eunuch'
" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Dependency of tsuquyomi
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Code-completion for typescript
Plug 'Quramy/tsuquyomi'
" Syntax highlighting for typescript
Plug 'leafgarland/typescript-vim'
" Diagnostics UI. We use it for non-C-family languages (since YouCompleteMe's
" diagnostics ui only supports C-family languages)
Plug 'scrooloose/syntastic'
" Git motion highlighting
Plug 'easymotion/vim-easymotion'
" Case-sensitive, plural-sensitive substitutions/conversions
Plug 'tpope/tpope-vim-abolish'
" Handlebars (.hbs) support
Plug 'mustache/vim-mustache-handlebars'
call plug#end()



"
" Indentation
"
set tabstop=4
set shiftwidth=4
set noexpandtab
filetype plugin indent off



"
" Save swap files in home directory subdir
"
set dir=$HOME/.vimtmp/swap//
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif



"
" Custom Commands
"

" Override the <Leader>
let mapleader = ","

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>



"
" Use bash-like filename completion
"
set wildmode=longest,list
set wildmenu



"
" YouCompleteMe
"

" Disable for typescript (tsuquyomi covers this)
let g:ycm_filetype_specific_completion_to_disable = {
	\'typescript': 1
	\}
"let g:ycm_python_binary_path = 'python3'
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1



"
" Gruvbox
"
syntax on
set background=dark
"set termguicolors
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox



"
" Airline
"
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 2



"
" RainbowParentheses
"
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces



"
" CtrlP
"
let g:ctrlp_custom_ignore = { 'dir': '\vnode_modules' }



"
" Tsuquyomi
"

" Syntastic covers this part
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_single_quote_import = 1



"
" Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
	\ "mode": "active",
	\ "active_filetypes": [],
	\ "passive_filetypes": ["python"] }
let g:syntastic_python_python_exec = 'python3.6'

" Tsuquyomi covers this part
let g:syntastic_typescript_checkers = ['tsuquyomi']



"
" EasyMotion
"

" Use just a single <Leader> to activate (Default is two <Leader>s)
map <Leader> <Plug>(easymotion-prefix)

" Override Vim's default search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" Also override the next/previous for better higlighting
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Cross-window two-char motion (overrides default s which is substitute)
nmap s <Plug>(easymotion-overwin-f2)

" Case-upgrading for global searches (as done with /). E.g.: v -> v and V. But V -> V.
let g:EasyMotion_smartcase = 1

