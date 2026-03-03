call plug#begin('~/.local/share/nvim/plugged')
  Plug 'jiangmiao/auto-pairs'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'p00f/cphelper.nvim'
  Plug 'tpope/vim-commentary'      " gcc to comment
  Plug 'tpope/vim-surround'        
  Plug 'preservim/nerdtree'        " file explorer
  Plug 'dense-analysis/ale'        " linting (optional with coc)
  Plug 'morhetz/gruvbox'
  Plug 'folke/tokyonight.nvim'
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'Mofiqul/vscode.nvim'
  Plug 'gmr458/vscode_modern_theme.nvim'
  Plug 'numToStr/Comment.nvim'
call plug#end()


augroup restore_cursor
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif
augroup END


"autocmd CursorHold * silent! call CocActionAsync('doHover')

nnoremap T :CphTest<CR>
nnoremap R :CphReceive<CR>


nnoremap W :w<CR>
inoremap <C-s> <Esc>:w<CR>

nnoremap <C-a> ggVGyG
inoremap jj <Esc>

let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ale_disable_lsp = 1

let g:python3_host_prog = expand('~/.venvs/nvim/bin/python')

nnoremap <C-n> :NERDTreeToggle<CR>


autocmd BufWritePre *.cpp call CocAction('format')



lua << EOF
require('Comment').setup()
EOF

vnoremap <C-_> :lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>

let g:cph#cpp#compile_command = "g++ -O2 -Wall -Wextra -D_GLIBCXX_DEBUG solution.cpp -o cpp.out"


set termguicolors
set background=dark

colorscheme vscode

""colorscheme gruvbox

"colorscheme tokyonight
"let g:tokyonight_style = 'moon'   " night | storm | moon

"colorscheme catppuccin



let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1


set number
" set cursorline
set mouse=a
set clipboard=unnamedplus
set hidden
set signcolumn=yes
set updatetime=300
set scrolloff=5

set ignorecase
set smartcase
set incsearch
set hlsearch

set autoindent
set smartindent

autocmd FileType c,cpp setlocal cindent

let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'

let g:fzf_layout = { 'down': '40%' }
let g:fzf_action = {
  \ 'enter': 'edit',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-x': 'split'
\ }


syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
filetype plugin indent on
" Set C++ file type
autocmd BufNewFile,BufRead *.cpp set filetype=cpp

" Compile and run C++ program in subshell
"function! CompileAndRun()
"  let fileName = expand('%')
"  if fileName =~ '\.cpp$'
"    let exeName = substitute(fileName, '\.cpp$', '', '')
"    execute 'w | !g++ -std=c++11 -Wall -Wextra -Wpedantic -O2 -o ' . exeName . ' ' . fileName
"   if v:shell_error == 0
"     let cmd = "x-terminal-emulator -e bash -c './" . exeName . "; read -p \"Press enter to exit...\"'"
"    call system(cmd)
"   redraw!
"    endif
"  else
"    echo 'Not a C++ file'
"  endif
"endfunction

"map <F5> :call CompileAndRun()<CR>



" Map keys to compile and run current file
"map <F5> :call CompileAndRun()<CR>
map <F9> :w<CR>:!clear<CR>:call CompileAndRun()<CR>
noremap <C-p> :FZF<CR>

source ~/.config/nvim/coc.vim

