scriptencoding utf-8
set encoding=utf-8

" Plugins, vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'janko-m/vim-test'
Plug 'kchmck/vim-coffee-script'
Plug 'pbrisbin/vim-mkdir'
Plug 'neomake/neomake'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/tComment'
Plug 'airblade/vim-gitgutter'
Plug 'jgdavey/vim-blockle'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'nelstrom/vim-markdown-folding'
Plug 'ekalinin/Dockerfile.vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'posva/vim-vue'
Plug 'tpope/vim-fireplace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'
Plug 'dhruvasagar/vim-table-mode'
Plug 'kien/rainbow_parentheses.vim'
Plug 'elixir-editors/vim-elixir'

call plug#end()

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set hls

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile *.boot set filetype=clojure
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

set grepprg=rg\ --vimgrep

" Make it obvious where 110 characters is
set textwidth=100
set colorcolumn=+1

" Numbers
set number
set numberwidth=5
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
" nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
" nnoremap <silent> <Leader>t :TestFile<CR>
" nnoremap <silent> <Leader>s :TestNearest<CR>
" nnoremap <silent> <Leader>l :TestLast<CR>
" nnoremap <silent> <Leader>a :TestSuite<CR>
" nnoremap <silent> <leader>gt :TestVisit<CR>

" Rexplore faster
nnoremap <Leader>r :Rexplore<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=0
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

set relativenumber

autocmd BufNewFile,BufRead *.slim set ft=slim

set mouse=a

nnoremap <leader>bp orequire 'pry';binding.pry<esc>:w<cr>
nnoremap <leader>pf :Files<cr>
nnoremap <leader>pt :Tags<cr>
nnoremap K :grep "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap \ :grep 

" mxm/vim-jsx
let g:jsx_ext_required = 0

" vim-javascript
let g:javascript_plugin_flow = 1

autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab

" Theme config
syntax enable
set termguicolors
set background=dark
let g:gruvbox_contrast_dark= 'hard'
colorscheme gruvbox
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ }

set fo=jcrocl

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

