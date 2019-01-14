call plug#begin('~/.config/nvim/plugged')
Plug 'ervandew/supertab'
Plug 'troydm/zoomwintab.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug '/usr/local/opt/fzf'
Plug 'yssl/QFEnter'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'mileszs/ack.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'Shougo/neocomplcache'        " Depenency for Shougo/neosnippet
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'  " Default snippets for many languages
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
call plug#end()

filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

if has("gui_vimr")
  color nord
else
  color nord
endif

let mapleader="\<Space>"

set number                          " show line numbers
set lazyredraw                      " Don't redraw while executing macros (good performance config)
set nohlsearch                      " Don't continue to highlight searched phrases.
set hlsearch                        " Highlight search results
set magic                           " For regular expressions turn magic on
set smartindent                     " automatically insert one extra level of indentation
set splitright                      " To make vsplit put the new buffer on the right of the current buffer
set expandtab                       " use spaces instead of tabs
set nowrap                          " don't wrap text
set fo-=t                           " don't automatically wrap text when typing
set hidden                          " A buffer becomes hidden when it is abandoned
set incsearch                       " when search with /, it will move the highlight as you add characters to the search keyword
set display+=lastline               "When included, as much as possible of the last line in a window will be displayed.  When not included, a last line that doesn't fit is replaced with "@" lines
set autoindent
set updatetime=250
set laststatus=2
set showmatch
set smartcase
set wildmenu
set nobackup
set nowritebackup
set noswapfile
set clipboard+=unnamedplus
" set autowrite
" set autoread
" set complete-=i
" set viminfo^=!
" set backspace=indent,eol,start
" set sessionoptions-=options

autocmd FileType make setlocal sw=2 ts=2 sts=2 noexpandtab
autocmd FileType json setlocal sw=2 ts=2 sts=2
autocmd FileType vim setlocal sw=2 ts=2 sts=2
autocmd FileType yaml setlocal sw=2 ts=2 sts=2


inoremap fd <esc>

" move inside a long line
nnoremap <buffer> k gk
nnoremap <buffer> j gj

" bind Ctrl+<movement> keyt to move around the windows, instead of using Ctrl+w + <movement>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" select all
map <Leader>a ggVG


" Insert newline without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" better indentation
vnoremap < <gv
" better indentation
vnoremap > >gv

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" commenting
nmap ,, gcc
vmap ,, gc

" vim-go
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'
let g:go_list_type = "quickfix"
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_version_warning = 0
let g:go_auto_type_info = 1
let g:go_metalinter_enabled = ['vet', 'errcheck']
" let g:go_metalinter_autosave = 1

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" init.vim
map <Leader>rc :e $MYVIMRC<CR>

" fzf.vim
map <Leader>ff :Files<CR>
map <Leader>bb :Buffers<CR>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" deoplete
let g:deoplete#enable_at_startup = 1

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" quickfix plugin
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']


" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

" neosnippet
let g:go_snippet_engine = "neosnippet"
