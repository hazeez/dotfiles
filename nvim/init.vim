".vimrc / init.vim
" the following vim configuration works for vim and neovim

" ensure vim-plug is installed and load it
call plug#begin()


"setting the leader key to comma
let mapleader = ","
"let mapleader = "\<Space>"

" comma + w for splitting the screen
nnoremap <leader>w <C-w>v<C-w>l
" comma + q to quit the vertical split screen
nnoremap <leader>q :q<cr>
" comma + t to start the terminal
nnoremap <leader>t :terminal<cr>
" comma + , to go to the settings file
nnoremap <leader>, :e c:\users\hafiz\appdata\local\nvim\init.vim<cr>
" comma tab to bring up the Scratch file
nnoremap <leader><Tab> :Scratch<cr>
" comma h for disabling the search highlight
nnoremap <leader>h :nohlsearch<Bar>:echo<CR>

" Load color schemes
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jonathanfilip/vim-lucius'  " nice white colortheme
Plug 'lifepillar/vim-solarized8'
" Plug 'micha/vim-colors-solarized'
Plug 'morhetz/gruvbox'

" list of plugins
Plug 'tmhedberg/SimpylFold' " simply fold plugin
Plug 'vim-scripts/indentpython.vim' "auto indentation plugin
Plug 'scrooloose/nerdtree'  " file list
Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plug 'vim-airline/vim-airline'  " make statusline awesome
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'Vimjas/vim-python-pep8-indent'  "better indenting for python
Plug 'kien/ctrlp.vim'  " fuzzy search files
Plug 'tweekmonster/impsort.vim'
Plug 'w0rp/ale'  " python linters
Plug 'airblade/vim-gitgutter'  " show git changes to files in gutter
Plug 'tpope/vim-fugitive' " executing git commands from within vim
Plug 'tpope/vim-commentary'  "comment-out by gc
Plug 'roxma/nvim-yarp'  " dependency of ncm2
Plug 'ncm2/ncm2'
Plug 'davidhalter/jedi-vim'   " jedi for python
Plug 'HansPinckaers/ncm2-jedi'  " fast python completion (use ncm2 if you want type info or snippet support)
Plug 'ncm2/ncm2-bufword'  " buffer keyword completion
Plug 'ncm2/ncm2-path'  " filepath completion
Plug 'vim-scripts/YankRing.vim' " yankring to get access to previously yanked text
Plug 'tpope/vim-surround' " surrounding brackets
Plug 'tpope/vim-repeat' " repeat the surrounding action
Plug 'mtth/scratch.vim' " scratch file that will never be saved
Plug 'tell-k/vim-autopep8' " auto format according to pep8 standard
" Plug 'cohama/lexima.vim' " auto surround

call plug#end()

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"enable code folding remap
nnoremap <space> za

"key remap for code commenting
nnoremap <leader>c gcc
xnoremap <leader>c gcc

"key remap for quickly closing and saving files
nnoremap <C-w> :q<cr>
nnoremap <C-s> :w<cr>
nnoremap <C-q> :q!<cr>

"leader map for refreshing the file
nnoremap <leader>r :e<cr>

" tabs:
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

"python indentation settings
au BufNewFile,BufRead *.py,*.php
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"settings for web development
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"setting the font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont='Fira Code':h11:cANSI
  endif
endif

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" reassigning the ctrl p shortcut as it conflicts with yankring
nnoremap <leader>b :CtrlPBuffer<CR>
nmap <F6> :NERDTreeToggle<CR>
map <F7> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
nmap <F8> :Autopep8<CR>
nmap <F9> :vertical resize -5<CR>
nmap <F10> :vertical resize +5<CR>
nmap <F11> :resize -5<CR>
nmap <F12> :resize +5<CR>

set scrolloff=3 " keep three lines between the cursor and the edge of the screen

"set encoding
set encoding=utf-8

" for ncm2
set shortmess+=c

set wrapscan  " begin search from top of file when nothing is found anymore

set autoread " detect when a file is changed

set history=1000
set textwidth=120

set backspace=indent,eol,start " make backspace work in a sane manner
set clipboard=unnamed

"searching
set ignorecase " case insensitive searching
set smartcase "case sensitive if expression contains a capital letter
set hlsearch "highlight search results
set incsearch "set incremental search like modern browsers
set cpoptions+=x " stay at search item when <esc>
set nolazyredraw " when drawing macros - not sure what this does at the moment

" wrapping
set breakindent "preserve horizontal spacing when wrapping
set showbreak=..
set lbr "wrap words

"keep command line clean
set noshowmode
set noshowcmd

set laststatus=2 "always show statusline

set magic "magin on for regex
set mouse=a "change cursor per mode
set nu "set line number

set splitbelow
set splitright

"enable folding
set foldmethod=indent
set foldlevel=80

"set background to dark and the color scheme
" set t_Co=256
set background=dark
let g:gruvbox_invert_selection=0
colorscheme gruvbox

" colorscheme solarized8

" let g:lucius_style="light"
" let g:lucius_contrast="low"
" colo lucius
" set background=light


set noerrorbells  " remove bells (i think this is default in neovim)
set visualbell
set t_vb=
set relativenumber
set viminfo='20,<1000  " allow copying of more than 50 lines to other applications

let g:scratch_autohide = 1
let g:scratch_insert_autohide = 1
let g:scratch_top = 1
let g:scratch_horizontal = 1
let g:scratch_height = 15

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
" make it FAST
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

set pumheight=5

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : "\<CR>"

let g:airline_powerline_fonts = 1
let g:airline_section_y = ""
let g:airline#extensions#tabline#enabled = 1

" Airline settings
" do not show error/warning section
let g:airline_section_error = ""
let g:airline_section_warning = ""

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" ale options
let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
let g:ale_list_window_size = 4
let g:ale_sign_column_always = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = '1'

" Options are in .pylintrc!
highlight VertSplit ctermbg=253

let g:ale_sign_error = '‼'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = '0'
let g:ale_lint_on_save = '1'
nmap <silent> <C-M> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)

" highlight python and self function
autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-9_]+\ze(\[|\s|$|,|\]|\)|\.|:)/hs=s+1
autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
hi def link pythonFunction Function
autocmd BufEnter * syn match Self "\(\W\|^\)\@<=self\(\.\)\@="
highlight self ctermfg=239

" jedi options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0

" Impsort option
hi pythonImportedObject ctermfg=127
hi pythonImportedFuncDef ctermfg=127
hi pythonImportedClassDef ctermfg=127

" Remove all trailing whitespace by pressing C-S
nnoremap <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" move between defs python:
" note: this break shortcuts with []
nnoremap [[ [m
nnoremap ]] ]m

nnoremap <silent><nowait> [ [[
nnoremap <silent><nowait> ] ]]

function! MakeBracketMaps()
    nnoremap <silent><nowait><buffer> [ :<c-u>exe 'normal '.v:count.'[m'<cr>
    nnoremap <silent><nowait><buffer> ] :<c-u>exe 'normal '.v:count.']m'<cr>
endfunction

augroup bracketmaps
    autocmd!
    autocmd FileType python call MakeBracketMaps()
augroup END

" neovim options
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <C-a> <Esc>
nnoremap <C-x> <Esc>

" vimgutter options
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0

" ctrl p options
let g:ctrlp_custom_ignore = '\v\.(npy|jpg|pyc|so|dll)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" mapping Esc
tnoremap <Esc> <C-\><C-n> "to move terminal to normal mode

"autopep8 settings 
let g:autopep8_disable_show_diff=1 " disable diff window
let g:autopep8_on_save = 1 " autopep8 on save

"setting the airline theme
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='light'

"fixing gitgutter issues
let s:grep_available = 0
set updatetime=250 "fixing slow gitgutter

"customize key mapping for gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

"undo git hunks
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hv <Plug>(GitGutterPreviewHunk)

" ctrlp settings
let g:ctrlp_map = '<tab>'
let g:ctrlp_cmd = 'CtrlP'

" setting ctrlp to set its working directory to the nearest repo dir
let g:ctrlp_working_path_mode = 'ra'

" setting wild ignore 
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
