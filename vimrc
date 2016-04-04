" Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
    " Personal vimrc of Mario Carballo Zama
    " Arlefreak
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    " AAAAAAAAAAA~                     AAAAAA
    " AAAAAAAAAAAAA          .AAAAA.   AAAAAA
    " AAAAAA AAAAAAAA       .AAAAAAA.  AAAAAA
    " AAAAAA  DAAAAAAA      .AAAAAAA.  AAAAAA
    " AAAAAA    AAAAAAAA     AAAAAAA   AAAAAA
    " AAAAAA     IAAAAAAAO    AAAAA    AAAAAA
    " AAAAAA       DAAAAAAA            AAAAAA
    " AAAAAA         AAAAAAAD          AAAAAA
    " AAAAAA          AAAAAAAA         AAAAAA      arlefreak.com
    " AAAAAAAAAAAAAAAAAAAAAAAAAA       AAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAD     AAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAA    AAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  AAAAAA
    " AAAAAA                  AAAAAAAA AAAAAA
    " AAAAAA                    AAAAAAAAAAAAA
    " AAAAAA                      AAAAAAAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
" }

" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
    
    " Arrow Key Fix {
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }
" }

" Bundles {
    " Config {
        if !1 | finish | endif

        if has('vim_starting')

        " Required:
            set runtimepath+=~/.vim/bundle/neobundle.vim/
        endif

        " Required:
        call neobundle#begin(expand('~/.vim/bundle/'))

        " Let NeoBundle manage NeoBundle
        " Required:
        NeoBundleFetch 'Shougo/neobundle.vim'
    " }

    " Unite {
        NeoBundleLazy 'Shougo/unite.vim' , {
            \ 'autoload': {
            \   'commands': [
            \       'Unite',
            \       'UniteWithBufferDir',
            \       'UniteWithCurrentDir',
            \       'UniteWithProjectDir',
            \   ],
            \ },
        \ }

        NeoBundle 'arlefreak/vim-unite-config', {
                    \ 'depends' : 'Shougo/unite.vim'
                    \ } " Settings for Unite
        NeoBundle 'Shougo/neomru.vim', { 
                    \ 'depends' : 'Shougo/unite.vim'
                    \ } " Better mru
        NeoBundle 'Shougo/unite-outline', {
                    \ 'depends' : 'Shougo/unite.vim'
                    \ } " Tags Unite source
        NeoBundle 'Shougo/neoyank.vim', {
                    \ 'depends' : 'Shougo/unite.vim'
                    \ } " Yank history for unite
        NeoBundle 'tacroe/unite-mark', {
                    \ 'depends' : 'Shougo/unite.vim'
                    \ } " Marks soruce for unite
        NeoBundle 'tsukkee/unite-tag', {
                    \ 'depends' : 'Shougo/unite.vim'
                    \ } " Unite Tag source
    " }

    " Utilities {
        NeoBundleLazy 'Shougo/deoplete.nvim', {
                    \ 'autoload': {
                        \ 'insert': 1,
                        \ },
                    \ } " Neovim Autocomplete
        NeoBundle 'Shougo/neosnippet.vim'
        NeoBundle 'Shougo/neosnippet-snippets'
        NeoBundle 'tpope/vim-vinegar'                            " Netrw helper
        NeoBundle 'tpope/vim-obsession'                          " Session Managment
        NeoBundle 'tpope/vim-eunuch'                             " Unix helpers
        NeoBundle 'tpope/vim-commentary'                         " Toggle comments
        NeoBundle 'tpope/vim-surround'                           " Sorroundings
        NeoBundle 'tpope/vim-repeat'                             " More . command
        NeoBundle 'wellle/targets.vim'                           " Better motions
        NeoBundle 'kana/vim-textobj-user'                        " Custom text object
        NeoBundle 'kana/vim-textobj-line'                        " Line text object
        NeoBundle 'scrooloose/syntastic',                        " Syntax check
        NeoBundle 'Raimondi/delimitMate',                        " Auto close quotes parentesis etc
        NeoBundle 'mhinz/vim-grepper'                            " Multiple grep support
        NeoBundle 'sjl/gundo.vim',                               " Undo tree
        NeoBundle 'vim-scripts/loremipsum'                       " Lorem ipsum text
        NeoBundle 'Chiel92/vim-autoformat'                       " AutoFormat code
        NeoBundle 'mhinz/vim-startify'                           " Start Screen
        NeoBundle 'godlygeek/tabular'                            " Align code
        NeoBundle 'Shougo/vimproc', {
              \ 'build' : {
              \     'windows' : 'make -f make_mingw32.mak',
              \     'cygwin' : 'make -f make_cygwin.mak',
              \     'mac' : 'make -f make_mac.mak',
              \     'unix' : 'make -f make_unix.mak',
              \    },
              \ }
    " }
    "

    " Prose {
        NeoBundle 'reedes/vim-pencil'                            " Better Writting
        NeoBundleLazy 'junegunn/goyo.vim', {
                    \ 'commands' : ['Goyo']
                    \ }                                          " Distraction-free writing in Vim
    " }

    " Git {
        NeoBundle 'tpope/vim-fugitive'                           " Git wrapper
        NeoBundle 'airblade/vim-gitgutter'                       " Git gutter simbols
    " }

    " Languages and Frameworks {
        NeoBundleLazy 'mattn/emmet-vim', {
                    \ 'autoload': {
                        \ 'filetypes': 'html',
                \ }} " Html5 Plugin
        NeoBundleLazy 'othree/html5.vim', {
                    \ 'autoload': {
                        \ 'filetypes': 'html',
                \ }} " Html5 Plugin
        NeoBundle 'elzr/vim-json', {
                    \ 'autoload': {
                        \ 'filetypes': 'json',
                \ }} " Json
        NeoBundleLazy 'pangloss/vim-javascript', {
                    \ 'autoload': {
                        \ 'filetypes': 'javascript',
                \ }} " Sintax and ident plugins
        NeoBundleLazy 'mxw/vim-jsx', {
                    \ 'autoload': {
                        \ 'filetypes': 'javascript',
                \ }} " Stylus plugin
        NeoBundleLazy 'wavded/vim-stylus', {
                    \ 'autoload': {
                        \ 'filetypes': 'styl',
                \ }} " Stylus plugin
        NeoBundle 'klen/python-mode/', {
                    \ 'autoload': {
                        \ 'filetypes': ['python', 'python3'],
                \ }} " Python mode
        NeoBundleLazy 'davidhalter/jedi-vim', {
                    \ 'autoload': {
                        \ 'filetypes': ['python', 'python3'],
                \ }} " Python autocomplete
        NeoBundle 'vim-scripts/django.vim', {
                    \ 'autoload': {
                        \ 'filetypes': ['python', 'python3', 'html'],
                    \ }}
        NeoBundleLazy 'OmniSharp/omnisharp-vim' , {
                    \ 'autoload' : {
                        \ 'filetypes' : ['cs', 'cs']
                    \ }
                \ }
        NeoBundleLazy 'OrangeT/vim-csharp' , {
                    \ 'autoload' : {
                        \ 'filetypes' : ['cs', 'cs']
                    \ }
                \ }
        NeoBundleLazy 'tweekmonster/braceless.vim', {
                    \ 'autoload' : {
                        \ 'filetypes' : ['stylus', 'styl']
                    \ }
                    \}
        NeoBundle 'rust-lang/rust.vim'         " Rust Language Support
        NeoBundle 'racer-rust/vim-racer'       " AutoComplete for vim
        NeoBundle 'tpope/vim-dispatch'         " Asynchronous build and test dispatcher
    " }

    " Vim UI {
        NeoBundle 'tpope/vim-flagship'                           " Statusline
        NeoBundle 'nathanaelkane/vim-indent-guides',             " Ident visual guide
        NeoBundle 'gregsexton/MatchTag',                         " Highlite Matching tag
        NeoBundle 'altercation/vim-colors-solarized'
        NeoBundle 'w0ng/vim-hybrid'
        NeoBundle 'whatyouhide/vim-gotham'
    " }

    call neobundle#end()
    NeoBundleCheck
" }

" General {
    set background=dark
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    set complete-=i             " Complete only on current buffer http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
    set nrformats-=octal        " Ctrl A considers numbers starting with 0 octal
    set autoread
    scriptencoding utf-8

    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif " Always switch to the current file directory

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    " set spell                           " Spell checking on
    " set spell spelllang=es_es
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    function! ResCur()
    if line("'\"") <= line("$")
      silent! normal! g`"
      return 1
    endif
    endfunction

    augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
    augroup END

    set backup                  " Backups are nice ...
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undone
        set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif

    let loaded_matchparen = 1
" }

" Vim GUI {

    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
    endif

    if has('nvim')
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    if OSX() && filereadable(expand("~/.vim/bundle/vim-gotham/colors/gotham.vim"))
        colorscheme gotham
    elseif filereadable(expand("~/.vim/bundle/vim-hybrid/colors/hybrid.vim"))
        let g:hybrid_custom_term_colors = 1
        colorscheme hybrid
    elseif  filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        colorscheme solarized             " Load a colorscheme
    endif

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
    endif

    if has('statusline')
        set laststatus=2
        set showtabline=2
        set guioptions-=e

        if !isdirectory(expand("~/.vim/bundle/vim-flagship"))
            set statusline=%t       "tail of the filename
            set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
            set statusline+=%{&ff}] "file format
            set statusline+=%h      "help file flag
            set statusline+=%m      "modified flag
            set statusline+=%r      "read only flag
            set statusline+=%y      "filetype
            set statusline+=%=      "left/right separator
            set statusline+=%c,     "cursor column
            set statusline+=%l/%L   "cursor line/total lines
            set statusline+=\ %P    "percent through file

            set statusline+=%#warningmsg#
            set statusline+=%*
            if version >= 700
              au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
              au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
            endif
        endif
    endif

    set tabpagemax=15               " Only show 15 tabs
    set noshowmode
    set cursorline                  " Highlight current line
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set relativenumber
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=longest:full,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set display+=lastline
    set foldenable                  " Auto fold code
    set list
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
    set fillchars=vert:│,fold:-
    highlight VertSplit cterm=none ctermbg=none ctermfg=247

    " Netrw {
        let g:netrw_liststyle = 3
        let g:netrw_preview   = 1
        let g:netrw_winsize   = 20
    " }
" }

" Formatting {
    set wrap                        " wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set smarttab                    " Smart tab actions
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
" }

" Key (re)Mappings {
    let mapleader="\<Space>"
    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " Disable arrows
    noremap <Up> <NOP>
    noremap <Down> <NOP>
    noremap <Left> <NOP>
    noremap <Right> <NOP>

    nmap <leader>t  : enew<CR>
    nmap <leader>l  : bnext<CR>
    nmap <leader>h  : bprevious<CR>
    nmap <leader>bq : bp <BAR> bd #<CR>
    nmap <leader>bl : ls<CR>:buffer<Space>

    nnoremap <leader>H  :tabprevious<CR>
    nnoremap <leader>L  :tabnext<CR>
    nnoremap <leader>T  :tabnew<CR>

    " Language {
        nnoremap [spell] <nop>
        nmap <leader>s [spell]
        nnoremap <silent> [spell]s :setlocal spell spelllang=es_es<cr>
        nnoremap <silent> [spell]g :setlocal spell spelllang=en_en<cr>
    " }

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$
    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv
    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>
    " Easier formatting
    nnoremap <silent> <leader>q wip

    inoremap <C-U> <C-G>u<C-U>

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Use <C-L> to clear the highlighting of :set hlsearch.
    if maparg('<C-L>', 'n') ==# ''
        nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
    endif
" }

" Plugins {
    " Gundo {
        if isdirectory(expand("~/.vim/bundle/gundo.vim"))
            let g:gundo_prefer_python3 = 1
            nnoremap <leader>g :GundoToggle<CR>
        endif
    " }

    " Tabular {
        if isdirectory(expand("~/.vim/bundle/tabular"))
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            nmap <Leader>a1= :Tabularize 1=<CR>
            nmap <Leader>a=> :Tabularize /=><CR>
            vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
    "}

    " JSBeutifier {
        if isdirectory(expand("~/.vim/bundle/js-beautify"))
            autocmd FileType javascript noremap <buffer><leader>jb :call JsBeautify()<cr>
            autocmd FileType html noremap <buffer><leader>jb :call HtmlBeautify()<cr>
            autocmd FileType css noremap <buffer><leader>jb :call CSSBeautify()<cr>
        endif
    " }

    " Syntastic {
        if isdirectory(expand("~/.vim/bundle/syntastic"))
            let g:syntastic_always_populate_loc_list = 1
            let g:syntastic_auto_loc_list = 1
            let g:syntastic_check_on_open = 1
            let g:syntastic_check_on_wq = 0

            set statusline+=%{SyntasticStatuslineFlag()}

            let g:syntastic_mode_map = { 'mode': 'active',
                \ 'active_filetypes': [],
                \ 'passive_filetypes': ['html'] }
            let g:syntastic_javascript_checkers = ['eslint']
        endif
    " }

    " NeoMake {
    " }

    " Emmet {
        if isdirectory(expand("~/.vim/bundle/emmet-vim"))
            let g:user_emmet_install_global = 0
            autocmd FileType html,css EmmetInstall
            iabbrev </ </<C-X><C-O>
        endif
    " }

    " Vim-airline {
        if isdirectory(expand("~/.vim/bundle/vim-airline"))
            set laststatus=2
            let g:airline_theme='gotham'
            let g:airline_detect_paste=1
            let g:Powerline_symbols = 'fancy'"
            let g:airline_powerline_fonts = 1
            let g:airline#extensions#tabline#enabled = 1
            let g:airline#extensions#tabline#fnamemod = ':t'
            let g:airline#extensions#tabline#left_sep = ' '
            let g:airline#extensions#tabline#left_alt_sep = '░'
            " Disable powerline arrows and setting blank seperators creates a rectangular box
            let g:airline_left_sep = '█▓░'
            let g:airline_right_sep = '░▓█'
            let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
            let g:airline_section_c = airline#section#create([''])
        endif
    " }

    " Flagship {
        if isdirectory(expand("~/.vim/bundle/vim-flagship"))
            autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag")
            autocmd User Flags call Hoist("global", "%{&ignorecase ? '[IC]' : ''}")
        endif
    " }

    " Tmux-Line {
        if isdirectory(expand("~/.vim/bundle/tmuxline.vim"))
            " let g:tmuxline_theme = 'iceberg'
        endif
    " }

    " Deoplete {
        if isdirectory(expand("~/.vim/bundle/deoplete.nvim"))
            let g:deoplete#enable_at_startup = 1
            let g:deoplete#enable_smart_case = 1
            au BufNewFile,BufRead *.{stylus,styl} set ft=stylus.css
            let g:deoplete#omni_patterns = {}
            let g:deoplete#omni_patterns.rust = '[(\.)(::)]'
        endif
    " }

    " NeoSnippet {
        if isdirectory(expand("~/.vim/bundle/neosnippet.vim"))
            " Plugin key-mappings.
            imap <C-k>     <Plug>(neosnippet_expand_or_jump)
            smap <C-k>     <Plug>(neosnippet_expand_or_jump)
            xmap <C-k>     <Plug>(neosnippet_expand_target)

            imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                  \ "\<Plug>(neosnippet_expand_or_jump)"
                  \: pumvisible() ? "\<C-n>" : "\<TAB>"
            smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                  \ "\<Plug>(neosnippet_expand_or_jump)"
                  \: "\<TAB>"

            " For conceal markers.
            if has('conceal')
              set conceallevel=2 concealcursor=niv
            endif
        endif
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " Rust {
        if isdirectory(expand("~/.vim/bundle/rust.vim"))
            " let g:rustfmt_autosave = 1
            nmap <leader>f :Autoformat<cr>
            let g:formatdef_rustfmt = '"rustfmt"'
            let g:formatters_rust = ['rustfmt']
            let g:racer_cmd = expand("~/.cargo/bin/racer")
            let $RUST_SRC_PATH= expand("~/.rust/src/")
        endif
    " }

    " PyMode {
        " Disable if python support not present
        if !has('python') && !has('python3')
            let g:pymode = 0
        endif

        if isdirectory(expand("~/.vim/bundle/python-mode"))
            let g:pymode_lint_checkers = ['pyflakes']
            let g:pymode_trim_whitespaces = 0
            let g:pymode_options = 0
            let g:pymode_rope = 0
        endif
    " }

    " Fugitive {
        if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
            nnoremap <silent> <leader>gc :Gcommit<CR>
            nnoremap <silent> <leader>gb :Gblame<CR>
            nnoremap <silent> <leader>gl :Glog<CR>
            nnoremap <silent> <leader>gp :Git push<CR>
            nnoremap <silent> <leader>gr :Gread<CR>
            nnoremap <silent> <leader>gw :Gwrite<CR>
            nnoremap <silent> <leader>ge :Gedit<CR>
            " Mnemonic _i_nteractive
            nnoremap <silent> <leader>gi :Git add -p %<CR>
            nnoremap <silent> <leader>gg :SignifyToggle<CR>
            set statusline+=%{fugitive#statusline()} " Git integration
        endif
    "}

    " Obsession {
        if isdirectory(expand("~/.vim/bundle/vim-obsession/"))
            set statusline+=%{ObsessionStatus()}     " ObsessionStatus
        endif
    "}

    " indent_guides {
        if isdirectory(expand("~/.vim/bundle/vim-indent-guides/"))
            let g:indent_guides_start_level = 2
            let g:indent_guides_guide_size = 1
            let g:indent_guides_enable_on_vim_startup = 1
        endif
    " }

    " Startify {
        if isdirectory(expand("~/.vim/bundle/vim-startify/"))
            let g:startify_list_order = [
                \ [' Sessions '],
                \ 'sessions',
                \ [' Bookmarks '],
                \ 'bookmarks',
                \ [' MRU (dir)'],
                \ 'dir',
                \ [' MRU '],
                \ 'files',
            \ ]
            let g:startify_bookmarks = [ {'v': '~/.vim/'}, {'z': '~/.zshrc'} ]
            let g:startify_files_number = 5
            let g:startify_session_autoload = 1
            let g:startify_change_to_vcs_root = 1
            " let g:startify_custom_footer = [
            "             \' ',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            "             \'   AAAAAAAAAAA~                     AAAAAA',
            "             \'   AAAAAAAAAAAAA          .AAAAA.   AAAAAA',
            "             \'   AAAAAA AAAAAAAA       .AAAAAAA.  AAAAAA',
            "             \'   AAAAAA  DAAAAAAA      .AAAAAAA.  AAAAAA',
            "             \'   AAAAAA    AAAAAAAA     AAAAAAA   AAAAAA',
            "             \'   AAAAAA     IAAAAAAAO    AAAAA    AAAAAA',
            "             \'   AAAAAA       DAAAAAAA            AAAAAA',
            "             \'   AAAAAA         AAAAAAAD          AAAAAA',
            "             \'   AAAAAA          AAAAAAAA         AAAAAA      arlefreak.com',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAA       AAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAD     AAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAA    AAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  AAAAAA',
            "             \'   AAAAAA                  AAAAAAAA AAAAAA',
            "             \'   AAAAAA                    AAAAAAAAAAAAA',
            "             \'   AAAAAA                      AAAAAAAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            " \]
        endif
    " }

    " Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }

    " Pencil {
        let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
        augroup pencil
            autocmd!
            autocmd FileType markdown,mkd call pencil#init()
            autocmd FileType text         call pencil#init()
        augroup END
    " }

    " Goyo and Limelight {
        if isdirectory(expand("~/.vim/bundle/goyo.vim/"))
            " let g:goyo_margin_top=0
            " let g:goyo_margin_bottom=0
            nnoremap <leader>G :Goyo<CR>
        endif
    " }
" }

" Functions {
    " Initialize directories {
        function! InitializeDirectories()
            let parent = $HOME
            let prefix = 'vim'
            let dir_list = {
                        \ 'backup': 'backupdir',
                        \ 'views': 'viewdir',
                        \ 'swap': 'directory' }

            if has('persistent_undo')
                let dir_list['undo'] = 'undodir'
            endif

            let common_dir = parent . '/.' . prefix

            for [dirname, settingname] in items(dir_list)
                let directory = common_dir . dirname . '/'
                if exists("*mkdir")
                    if !isdirectory(directory)
                        call mkdir(directory)
                    endif
                endif
                if !isdirectory(directory)
                    echo "Warning: Unable to create backup directory: " . directory
                    echo "Try: mkdir -p " . directory
                else
                    let directory = substitute(directory, " ", "\\\\ ", "g")
                    exec "set " . settingname . "=" . directory
                endif
            endfor
        endfunction
        call InitializeDirectories()
    " }
" }