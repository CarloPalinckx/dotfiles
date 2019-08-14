call plug#begin('~/.vim/plugged')

" === Language plugins ===

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" === Theme plugins === 
Plug 'arcticicestudio/nord-vim'
Plug 'Rigellute/rigel'
Plug 'haishanh/night-owl.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'wincent/terminus'
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
  \ }
Plug 'prettier/vim-prettier', { 
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ }
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

call plug#end()

" === Keybindings === 

map <C-o> :CommandT<CR>
nmap <C-i> <Plug>(coc-definition)
map <C-e> :NERDTreeToggle<CR>

" === General settings === 

" Set working directory to open buffer
autocmd BufEnter * lcd %:p:h

" Highlight matching [{()}]
set noshowmatch
let g:loaded_matchparen=1

" Instantly search on input
set incsearch 
set hlsearch

" Use system clipboard
set clipboard=unnamed

" 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Disable auto indenting
filetype indent off
set nocindent nosmartindent noautoindent

" Line number settings
set numberwidth=3
set relativenumber
set number

" Wrapping behavior
set nowrap
set linebreak

" Disable swapfiles
set noswapfile

" === Typescript === 

" Better display for messages
set cmdheight=1

" always show signcolumns
set signcolumn=yes

" === NerdTree === 

let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
let g:NERDTreeStatusline = ''
let NERDTreeQuitOnOpen=1

" === DevIcons ===
set encoding=UTF-8

" === Airline === 

let g:airline_left_sep = ' ⍺ ' 
let g:airline_right_sep = ' Ω '
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_highlighting_cache = 1
let g:airline_section_z=" "
let g:airline_skip_empty_sections = 1
let g:airline#extensions#wordcount#format = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#enabled = 0

set laststatus=2

" === Prettier === 

" Don't use vim-prettier's auto-formatting
let g:prettier#autoformat=0

" Run prettier async before saving
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql,*.md PrettierAsync
autocmd BufWritePre .babelrc,.eslintrc,.prettierrc PrettierAsync

" === Color scheme === 
syntax enable
set guifont=Fira\ Code\ Nerd\ Font
colorscheme nord
set background=dark

" Fix busted colors for night-owl
" colorscheme night-owl
" highlight Comment guifg=#011627
" highlight Comment guibg=#637777
" highlight Error guifg=Red guibg=NONE
" highlight Error guifg=Red guibg=NONE

if (has("termguicolors"))
 set termguicolors
endif

" Remove fixed gutter color
highlight clear SignColumn

" === SuperTab ===

" Reverse tab order
let g:SuperTabDefaultCompletionType = "<c-n>"

" === Coc ===

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show type definitions on Ctrl-i
nnoremap <silent> <C-i> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"=== Git gutter ===

let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'
let g:gitgutter_sign_modified_removed = '█'

"=== Functions === 

" Rename file in buffer

command! -nargs=* -complete=file -bang Rename call Rename(<q-args>, '<bang>')

function! Rename(name, bang)
	let l:name    = a:name
	let l:oldfile = expand('%:p')

	if bufexists(fnamemodify(l:name, ':p'))
		if (a:bang ==# '!')
			silent exe bufnr(fnamemodify(l:name, ':p')) . 'bwipe!'
		else
			echohl ErrorMsg
			echomsg 'A buffer with that name already exists (use ! to override).'
			echohl None
			return 0
		endif
	endif

	let l:status = 1

	let v:errmsg = ''
	silent! exe 'saveas' . a:bang . ' ' . l:name

	if v:errmsg =~# '^$\|^E329'
		let l:lastbufnr = bufnr('$')

		if expand('%:p') !=# l:oldfile && filewritable(expand('%:p'))
			if fnamemodify(bufname(l:lastbufnr), ':p') ==# l:oldfile
				silent exe l:lastbufnr . 'bwipe!'
			else
				echohl ErrorMsg
				echomsg 'Could not wipe out the old buffer for some reason.'
				echohl None
				let l:status = 0
			endif

			if delete(l:oldfile) != 0
				echohl ErrorMsg
				echomsg 'Could not delete the old file: ' . l:oldfile
				echohl None
				let l:status = 0
			endif
		else
			echohl ErrorMsg
			echomsg 'Rename failed for some reason.'
			echohl None
			let l:status = 0
		endif
	else
		echoerr v:errmsg
		let l:status = 0
	endif

	return l:status
endfunction


