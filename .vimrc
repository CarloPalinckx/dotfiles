call plug#begin('~/.vim/plugged')

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'haishanh/night-owl.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'jparise/vim-graphql'
Plug 'wincent/terminus'
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
  \ }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

map <C-e> :NERDTreeToggle<CR>
map <C-q> :bprev<CR>
map <C-w> :bnext<CR>
map <C-o> :CommandT<CR>

if (has("termguicolors"))
 set termguicolors
 set background=dark
endif

set tabstop=4

set numberwidth=3
set relativenumber
set clipboard=unnamed

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:airline_left_sep = ' λ ' 
let g:airline_right_sep = ' λ '
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#branch#enabled = 1 
let g:airline_section_warning = '' 
let g:airline_section_y = '' 
let g:airline_section_x = '' 
set laststatus=2

" Don't use vim-prettier's auto-formatting
let g:prettier#autoformat=0

" Run prettier async before saving
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql,*.md PrettierAsync
autocmd BufWritePre .babelrc,.eslintrc,.prettierrc PrettierAsync

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

syntax enable
colorscheme night-owl

highlight clear SignColumn
