" === Plugins ===

    call plug#begin()

    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " Typescript language server
    Plug 'pangloss/vim-javascript' " JS language support
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' } " Styled-component language support
    Plug 'jparise/vim-graphql' " GraphQl language support
    Plug 'evidens/vim-twig' " Twig language support
    Plug 'arcticicestudio/nord-vim' " Nord editor theme
    Plug 'vim-airline/vim-airline' " Airline status bar
    Plug 'vim-airline/vim-airline-themes' " Alternative status bar theme
    Plug 'tpope/vim-commentary' " Easier line commenting
    Plug 'scrooloose/nerdtree' " Adds a file explorer
    Plug 'ryanoasis/vim-devicons' " Adds icons to the file explorer 
    Plug 'airblade/vim-gitgutter' " Adds a git status to the gutter

    " Autoformatting
    Plug 'prettier/vim-prettier', { 
      \ 'do': 'yarn install',
      \ 'branch': 'release/1.x',
      \ }

    " Adds fuzzy file finding
    Plug 'wincent/command-t', {
      \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
      \ }

    call plug#end()

" === Typescript ===

    set signcolumn=yes " always show signcolumns
    set cmdheight=1 " Better display for messages

    " Show type definitions on Ctrl-i
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <C-i> <Plug>(coc-definition)

" === Theme === 

    " Add different styling to airline
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

    " Highlight matching [{()}]
    set noshowmatch
    let g:loaded_matchparen=1

    syntax enable
    set guifont=Fira\ Code\ Nerd\ Font
    colorscheme nord
    set background=dark

    if (has("termguicolors"))
     set termguicolors
    endif

    " Remove fixed gutter color
    highlight clear SignColumn

" === Navigation ===

    set encoding=UTF-8 " Set encoding for icons

    " Adds different icons
    let g:NERDTreeDirArrowExpandable = ' '
    let g:NERDTreeDirArrowCollapsible = ' '
    let g:NERDTreeStatusline = ''
    let NERDTreeQuitOnOpen=1

    map <C-e> :NERDTreeToggle<CR>

    autocmd BufEnter * lcd %:p:h " Set working directory to open buffer

    set laststatus=2

" === CommandT ===

    map <C-o> :CommandT<CR>

" === Formatting ===

    " 4 spaces
    set tabstop=4
    set shiftwidth=4
    set expandtab

    " Don't use vim-prettier's auto-formatting
    let g:prettier#autoformat=0

    " Run prettier async before saving
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql,*.md PrettierAsync
    autocmd BufWritePre .babelrc,.eslintrc,.prettierrc PrettierAsync

    " Disable auto indenting
    filetype indent off
    set nocindent nosmartindent noautoindent

    " Wrapping behavior
    set nowrap
    set linebreak

" === Search ===

    " Instantly search on input
    set incsearch 
    set hlsearch

" === Gutter ===

    " Line number settings
    set numberwidth=3
    set relativenumber
    set number

    " Adds a nicer git gutter
    let g:gitgutter_sign_added = '█'
    let g:gitgutter_sign_modified = '█'
    let g:gitgutter_sign_removed = '█'
    let g:gitgutter_sign_modified_removed = '█'

" === Copying ===

    set clipboard=unnamed " Use system clipboard
    set noswapfile " Disable swapfiles

