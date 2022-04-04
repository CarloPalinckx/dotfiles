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

    " Typescript language server
    Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } }
    " Typescript syntax highlighting 
    Plug 'herringtondarkholme/yats.vim'
    " Javascript syntax highlighting 
    Plug 'othree/yajs.vim'
    " Twig syntax highlighting
    Plug 'nelsyeung/twig.vim'
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
    " Fuzzy file finder
    Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
    " Adds graphql language support
    Plug 'jparise/vim-graphql'
    " Adds a nice gutter thats shows what line changed
    Plug 'airblade/vim-gitgutter'
    " Tmux navigator for vim
    Plug 'christoomey/vim-tmux-navigator'
    " Adds ack support for better 'find in files'
    Plug 'mileszs/ack.vim'
    " My favorite themes    
    Plug 'haishanh/night-owl.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    " Svelte syntax
    Plug 'evanleck/vim-svelte'

    call plug#end()

"  _____       _             __               
" |_   _|     | |           / _|              
"   | |  _ __ | |_ ___ _ __| |_ __ _  ___ ___ 
"   | | | '_ \| __/ _ \ '__|  _/ _` |/ __/ _ \
"  _| |_| | | | ||  __/ |  | || (_| | (_|  __/
" |_____|_| |_|\__\___|_|  |_| \__,_|\___\___|
" ----------------------------------------------------------------------------------------

    " Set vim background to equal terminal background
    set t_Co=256
    set background=dark
    set termguicolors

    " Enable syntax highlighting
    syntax enable
    " Sets active color scheme 
    colorscheme dracula 
    " Enable line numbers
    set number
    " Increase the width of the line number gutter
    set numberwidth=3
    set relativenumber
    " Make gutter background transparent 
    highlight clear SignColumn
    " Set encoding for icons
    set encoding=UTF-8 
    " Adds missing tsx highlighting
    hi tsxCloseTag guifg=#21c7a8 guibg=NONE gui=italic
    hi tsxCloseTagName guifg=#82aaff guibg=NONE gui=italic
    hi tsxTag guifg=#21c7a8 guibg=NONE gui=italic
    hi tsxTagName guifg=#82aaff guibg=NONE gui=italic
    hi tsxAttrib guifg=#82aaff guibg=NONE gui=italic
    hi tsGenerics guifg=#82aaff guibg=NONE gui=italic
    hi tsxTypes guifg=#82aaff guibg=NONE gui=italic
    hi MatchParen guifg=NONE guibg=NONE gui=bold
    hi NERDTreeOpenable guifg=NONE guibg=NONE gui=NONE

    " Add different styling to airline
    let g:airline_left_sep = ' λ ' 
    let g:airline_right_sep = ''
    let g:airline_theme = 'dracula'
    let g:airline#extensions#tabline#enabled = 0 
    let g:airline#extensions#branch#enabled = 1 
    let g:airline_section_warning = '' 
    let g:airline_section_y = '' 
    let g:airline_section_x = '' 
    set laststatus=2 " for airline

    " Adds different icons to NERDTree
    let g:NERDTreeDirArrowExpandable = ' '
    let g:NERDTreeDirArrowCollapsible = ' '
    let g:NERDTreeStatusline = ''
    let g:NERDTreeWinSize=80

    " Adds a VSCode like git gutter
    let g:gitgutter_sign_added = '█'
    let g:gitgutter_sign_modified = '█'
    let g:gitgutter_sign_removed = '█'
    let g:gitgutter_sign_modified_removed = '█'

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

    " Delete without yanking
    nnoremap <leader>d "_d
    vnoremap <leader>d "_d

    " Replace currently selected text with default register without yanking it
    vnoremap <leader>p "_dP

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
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql,*.md,*.svelte PrettierAsync
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

    " Configure Ack to show a list of files instead of opening the first hit 
    cnoreabbrev Ack Ack!
    nnoremap <Leader>a :Ack!<Space>

    " Enable silver searcher for ack.vim
    if executable('ag')
        let g:ackprg = 'ag --nogroup --nocolor --column'
    endif

"  _                                                                                 _   
" | |                                                                               | |  
" | |     __ _ _ __   __ _ _   _  __ _  __ _  ___   ___ _   _ _ __  _ __   ___  _ __| |_ 
" | |    / _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \ / __| | | | '_ \| '_ \ / _ \| '__| __|
" | |___| (_| | | | | (_| | |_| | (_| | (_| |  __/ \__ \ |_| | |_) | |_) | (_) | |  | |_ 
" |______\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___| |___/\__,_| .__/| .__/ \___/|_|   \__|
"                     __/ |             __/ |                | |   | |                   
"                    |___/             |___/                 |_|   |_|                   
" ----------------------------------------------------------------------------------------

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

    " Show hidden files in NERDTree
    let NERDTreeShowHidden=1
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
    " autocmd BufEnter * lcd %:p:h 

    set laststatus=2

    " Ignore files in NERDTree
    let NERDTreeIgnore=['\.DS_Store$', '\.git$'] 
    " ignore node_modules from navigation    
    set wildignore+=*/node_modules/*,*/dist/*,*/reports/*,*/.DS_Store
    " Open Command T with Ctrl-O (lol)
    map <C-o> :CommandT<CR>

    " Increase max files for CommandT
    let g:CommandTMaxFiles=2000000

"  __  __ _          
" |  \/  (_)         
" | \  / |_ ___  ___ 
" | |\/| | / __|/ __|
" | |  | | \__ \ (__ 
" |_|  |_|_|___/\___|
" ----------------------------------------------------------------------------------------

" Show highlight group under cursor
function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction

map gm :call SynStack()<CR>

