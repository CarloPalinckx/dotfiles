"                     .                    
"     ##############..... ##############   
"     ##############......##############   
"       ##########..........##########     
"       ##########........##########       
"       ##########.......##########        
"       ##########.....##########..        
"       ##########....##########.....      
"     ..##########..##########.........    
"   ....##########.#########.............  
"     ..################JJJ............    
"       ################.............      
"       ##############.JJJ.JJJJJJJJJJ      
"       ############...JJ...JJ..JJ  JJ     
"       ##########....JJ...JJ..JJ  JJ      
"       ########......JJJ..JJJ JJJ JJJ     
"       ######    .........                
"                   .....                  
"                     .                    
"



"  _____  _             _           
" |  __ \| |           (_)          
" | |__) | |_   _  __ _ _ _ __  ___ 
" |  ___/| | | | |/ _` | | '_ \/ __|
" | |    | | |_| | (_| | | | | \__ \
" |_|    |_|\__,_|\__, |_|_| |_|___/
"                  __/ |            
"                 |___/             
" ----------------------------------------------------------------------------------------

    call plug#begin()

    " Nord color scheme
    Plug 'arcticicestudio/nord-vim'
    " Syntax highlighting for typescript
    Plug 'leafgarland/typescript-vim'
    " Syntax highlighting for typescript with JSX
    Plug 'peitalin/vim-jsx-typescript'
    " Typescript language server
    Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } }
    " Comment lines in visual mode with 'gc'
    Plug 'tpope/vim-commentary'
    " Airline status bar
    Plug 'vim-airline/vim-airline'
     " Alternative status bar theme
    Plug 'vim-airline/vim-airline-themes' 
    " Prettier autoformat
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    " Adds a file explorer
    Plug 'scrooloose/nerdtree' 
    " Adds icons to the file explorer
    Plug 'ryanoasis/vim-devicons'  
    " Tmux window manager
    Plug 'christoomey/vim-tmux-navigator'

    call plug#end()


"  _____       _             __               
" |_   _|     | |           / _|              
"   | |  _ __ | |_ ___ _ __| |_ __ _  ___ ___ 
"   | | | '_ \| __/ _ \ '__|  _/ _` |/ __/ _ \
"  _| |_| | | | ||  __/ |  | || (_| | (_|  __/
" |_____|_| |_|\__\___|_|  |_| \__,_|\___\___|
" ----------------------------------------------------------------------------------------

    " Enable syntax highlighting
    syntax enable
    " Sets active color scheme to Nord
    colorscheme nord
    " Sets the editor font to fira
    set guifont=Fira\ Code\ Nerd\ Font
    " Enables vim's default dark background for fallback colors
    set background=dark
    " Enable line numbers
    set number
    " Increase the width of the line number gutter
    set numberwidth=3
    " User line numbers relative to cursor position for easier navigation
    set relativenumber
    " Make gutter background transparent 
    highlight clear SignColumn
    " Set encoding for icons
    set encoding=UTF-8 
     " Add different styling to airline
    let g:airline_left_sep = ' ☘ ' 
    let g:airline_right_sep = ' ★ '
    let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
    let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
    let g:airline_highlighting_cache = 1
    let g:airline_section_z=" "
    let g:airline_skip_empty_sections = 1
    let g:airline#extensions#wordcount#format = ''
    let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
    let g:airline#extensions#wordcount#enabled = 0   


    " Adds different icons to NERDTree
    let g:NERDTreeDirArrowExpandable = ' '
    let g:NERDTreeDirArrowCollapsible = ' '
    let g:NERDTreeStatusline = ''

"   _____                                    _   _____          _   _             
"  / ____|                                  | | |  __ \        | | (_)            
" | |     ___  _ __  _   _    __ _ _ __   __| | | |__) |_ _ ___| |_ _ _ __   __ _ 
" | |    / _ \| '_ \| | | |  / _` | '_ \ / _` | |  ___/ _` / __| __| | '_ \ / _` |
" | |___| (_) | |_) | |_| | | (_| | | | | (_| | | |  | (_| \__ \ |_| | | | | (_| |
"  \_____\___/| .__/ \__, |  \__,_|_| |_|\__,_| |_|   \__,_|___/\__|_|_| |_|\__, |
"             | |     __/ |                                                  __/ |
"             |_|    |___/                                                  |___/ 
" ----------------------------------------------------------------------------------------

    " Use system clipboard, useful for copy-pasting from stackoverflow
    set clipboard=unnamed 
    " Disable swapfiles, they wreak more havoc on git commits than they do good
    set noswapfile 


"  ______                         _   _   _             
" |  ____|                       | | | | (_)            
" | |__ ___  _ __ _ __ ___   __ _| |_| |_ _ _ __   __ _ 
" |  __/ _ \| '__| '_ ` _ \ / _` | __| __| | '_ \ / _` |
" | | | (_) | |  | | | | | | (_| | |_| |_| | | | | (_| |
" |_|  \___/|_|  |_| |_| |_|\__,_|\__|\__|_|_| |_|\__, |
"                                                  __/ |
"                                                 |___/ 
" ----------------------------------------------------------------------------------------

    " Set spacing to 4 spaces
    set tabstop=4
    set shiftwidth=4
    set expandtab

    " Disable auto indenting
    filetype indent off
    set nocindent nosmartindent noautoindent

    " Disable wrapping behavior
    set nowrap
    set linebreak

    " Disable auto feature of typescript-vim
    let g:typescript_indent_disable = 1

    " Don't use vim-prettier's auto-formatting
    let g:prettier#autoformat=0

    " Run prettier async before saving
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql,*.md PrettierAsync
    autocmd BufWritePre .babelrc,.eslintrc,.prettierrc PrettierAsync

"   _____                     _     _             
"  / ____|                   | |   (_)            
" | (___   ___  __ _ _ __ ___| |__  _ _ __   __ _ 
"  \___ \ / _ \/ _` | '__/ __| '_ \| | '_ \ / _` |
"  ____) |  __/ (_| | | | (__| | | | | | | | (_| |
" |_____/ \___|\__,_|_|  \___|_| |_|_|_| |_|\__, |
"                                            __/ |
"                                           |___/ 
" ----------------------------------------------------------------------------------------

    " Instantly search on input (disabled)
    " set incsearch 

    " Visually highlight search hits
    set hlsearch


"  _                                                                                 _   
" | |                                                                               | |  
" | |     __ _ _ __   __ _ _   _  __ _  __ _  ___   ___ _   _ _ __  _ __   ___  _ __| |_ 
" | |    / _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \ / __| | | | '_ \| '_ \ / _ \| '__| __|
" | |___| (_| | | | | (_| | |_| | (_| | (_| |  __/ \__ \ |_| | |_) | |_) | (_) | |  | |_ 
" |______\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___| |___/\__,_| .__/| .__/ \___/|_|   \__|
"                     __/ |             __/ |                | |   | |                   
"                    |___/             |___/                 |_|   |_|                   
" ----------------------------------------------------------------------------------------

    " Set filetypes as typescript.tsx
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
    " K to show typescript documentation in a preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

"  _   _             _             _   _             
" | \ | |           (_)           | | (_)            
" |  \| | __ ___   ___  __ _  __ _| |_ _  ___  _ __  
" | . ` |/ _` \ \ / / |/ _` |/ _` | __| |/ _ \| '_ \ 
" | |\  | (_| |\ V /| | (_| | (_| | |_| | (_) | | | |
" |_| \_|\__,_| \_/ |_|\__, |\__,_|\__|_|\___/|_| |_|
"                       __/ |                        
"                      |___/                         
" ----------------------------------------------------------------------------------------

    let NERDTreeQuitOnOpen=1

    " Automatically close NERDTree when opening a file (disabled)
    " autocmd BufEnter NERD_tree_* nmap  d<CR> <CR> :NERDTreeToggle <CR>
    " autocmd BufLeave NERD_tree_* unmap d<CR>

    " Automatically close Vim if the only open buffer is NERDTree
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " Automatically open NERDTree when a directory is opened and focus the NERDTree buffer
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

    " Toggle NERDTree with ctrl-e
    map <C-e> :NERDTreeToggle<CR>

    " Set working directory to open buffer
    autocmd BufEnter * lcd %:p:h 

    set laststatus=2

    " Disable default tmux mapping
    let g:tmux_navigator_no_mappings = 1

    nnoremap <silent> {˙} :TmuxNavigateLeft<cr>
    nnoremap <silent> {∆} :TmuxNavigateDown<cr>
    nnoremap <silent> {˚} :TmuxNavigateUp<cr>
    nnoremap <silent> {¬} :TmuxNavigateRight<cr>
    nnoremap <silent> {c-\} :TmuxNavigatePrevious<cr>


" ----------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------