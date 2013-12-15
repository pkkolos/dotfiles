" === Vim Addons ===
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

"add system-wide path for vim addons
set runtimepath+=/usr/share/vim/addons

" === Mouse, Theme & Syntax Highlighting ===
set mouse=a    "use mouse in normal, visual, insert and command mode
set mousehide  "hide mouse pointer when typing

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

if has("syntax")
    syntax enable
    set background=dark
    if !has('gui_running')
        set t_Co=16
        colorscheme base16-eighties
    else
        let g:solarized_menu=0
        colorscheme solarized
        call togglebg#map("<F5>")
    endif
    set foldmethod=syntax
else
    set foldmethod=manual
endif

" === General Settings ===
set encoding=utf-8
set spelllang=en,el
set nospell

set title              "set the title of the window
set ttyfast            "indicates a fast terminal connection
set showcmd            "show partial command, show selected chars, lines, blocks in visual mode
set showmode           "show message in insert, replace and visual mode
set autowrite          "save current buffer when changing buffers or call make
set confirm            "operations on unsaved buffers don't fail, instead they are asking for confirmation
set history=100        "history of previous commands and search patterns
set backspace=indent,eol,start  "backspace and del always working
set novisualbell       "don't use visual bell (flash)
set selection=old      "don't let the cursor move past the last char in visual mode
set virtualedit=block  "let the cursor move past the last char in visual block mode
set guioptions-=T      "remove toolbar
set guioptions+=c      "use console dialogs instead of popups for simple choices
set report=0           "always report number of lines changed
set nojoinspaces       "when joining lines don't insert two spaces after .?!
set shell=$SHELL
set modeline
set modelines=2
set tags+=~/.vim/tags

let mapleader = "\\"

"when vimrc is edited, reload it.
au! BufWritePost .vimrc
    \ source $MYVIMRC        |
    \ setlocal tabstop=4     |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4  |
    \ setlocal expandtab

nnoremap ; :
inoremap jk <Esc>
nnoremap <silent> <leader>ts :set spell!<cr>
"save file even when you edited it without the needed permissions
cnoremap w!! execute ':silent w !sudo tee % > /dev/null' <bar> edit!

" === Indentation, Tabs, Spaces ===
set tabstop=4         "how many columns a tab counts for
set softtabstop=4     "how many columns to use when you hit tab
set shiftwidth=4      "how many columns text is indented
set shiftround        "indentation is rounded to multiple of shiftwidth
set noexpandtab       "use spaces instead of tabs
set smarttab          "use shiftwidth value for inserting tabs at the beggining of a line

set autoindent        "automatically indent a new line
set smartindent       "smart autoindentation when starting new line
set cpoptions+=I      "don't remove autoindentation when you move the cursor up/down
set formatoptions+=r  "automatically insert current comment leader in insert mode
set formatoptions+=n  "indent wrapped lines on number lists
set formatoptions+=j  "auto-format comments when joining lines
set cinoptions=l1,t0,U1

"set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set (soft)tabstop & shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
endfunction

autocmd FileType haskell,python setlocal expandtab

nnoremap <leader>[ <<
nnoremap <leader>] >>
vnoremap <leader>[ <gv
vnoremap <leader>] >gv
nnoremap <leader>rt :retab!<cr>
vnoremap <leader>rt :retab!<cr>
nnoremap <leader>ss :call Stab()<cr>
nnoremap <silent> <leader>te :set expandtab!<cr>

" === Whitespace ===
function! <sid>StripTrWhSp()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"nnoremap <leader>o m`o<Esc>``
"nnoremap <leader>O m`O<Esc>``
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
nnoremap <leader>w :call <sid>StripTrWhSp()<cr>

" === Line Numbers, Wrap & Vertical Line ===
set number             "show line numbers
set relativenumber     "show line numbers relative to the current line
set numberwidth=3      "minimal digits in line numbers
set cursorline         "highlight current line
set showbreak=+++      "string for wrapped lines
set cpoptions+=n       "use the column of line numbers for the string of wrapped lines
set formatoptions+=l   "don't break long lines in insert mode
set wrap               "auto wrap line view, but not text itself
set whichwrap=<,>,[,]  "left/right arrows move the cursor to previous/next line
set nocursorcolumn     "don't highlight current column
set colorcolumn=0      "list of highlighted screen columns
"set textwidth=80       "maximum text width (column for text wrapping)

function! g:ToggleNumMode()
    if (&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

function! g:ToggleColorColumn()
    if (&colorcolumn == 0)
        set colorcolumn=80
    else
        set colorcolumn=0
    endif
endfunc

function! g:ToggleCursorColumn()
    if (&cursorcolumn == 1)
        set nocursorcolumn
    else
        set cursorcolumn
    endif
endfunc

noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap <up> gk
noremap <down> gj
nnoremap <silent> <leader>tn :call g:ToggleNumMode()<cr>
nnoremap <silent> <leader>tv :call g:ToggleColorColumn()<cr>
nnoremap <silent> <leader>tc :call g:ToggleCursorColumn()<cr>

" === Scrolling & Folding ===
set scrolloff=2  "lines to keep around the cursor
set foldenable   "enable folding

nnoremap <space> za
nnoremap <leader>f0 :set foldlevel=0<cr>
nnoremap <leader>f1 :set foldlevel=1<cr>
nnoremap <leader>f2 :set foldlevel=2<cr>
nnoremap <leader>f3 :set foldlevel=3<cr>
nnoremap <leader>f4 :set foldlevel=4<cr>
nnoremap <leader>f5 :set foldlevel=5<cr>
nnoremap <leader>f6 :set foldlevel=6<cr>
nnoremap <leader>f7 :set foldlevel=7<cr>
nnoremap <leader>f8 :set foldlevel=8<cr>
nnoremap <leader>f9 :set foldlevel=9<cr>

autocmd FileType haskell setlocal foldmethod=indent

" === Auto-Complete & List Mode ===
set list                             "show special characters
set listchars=tab:▸\ ,trail:·,eol:↲  "define characters for tab, trailing spaces, end of line
set listchars+=extends:❯,precedes:❮  "define characters for long lines when wrap is off

"don't show trailing spaces in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:·
    au InsertLeave * :set listchars+=trail:·
augroup END

set wildmenu    "command-line completion shows a list of matches
set wildmode=longest,list:longest,full

nnoremap <silent> <leader>tl :set list!<cr>

" === Highlight, Searching & Substitution ===
set showmatch               "bracket match highlighting
set matchtime=3             "time of bracket matching
set matchpairs=(:),[:],{:}  "type of brackets to match

set incsearch   "type-ahead-find
set hlsearch    "highlight what you search for
set ignorecase  "case-insensitive search by default
set smartcase   "search case-sensitive if there is an upper-case letter

set gdefault    "when replacing, use /g by default

noremap n nzz
noremap N Nzz
cnoremap s/ s/\v
noremap / /\v
noremap ? ?\v
noremap <tab> %
nnoremap <leader>/ :noh<cr>

autocmd FileType html,xml,xslt setlocal matchpairs+=<:>

" === Statusline ===
set laststatus=2  "always show status line
set lazyredraw    "necessary for correct usage of status line colours

set statusline=%{UpdateStatuslineColour()}    "Change status line's colour in insert, visual and replace mode
set statusline+=%1*%{&paste?'[PASTE]':''}     "Paste status
set statusline+=%0*[%n]\ %f%h%m%r%w           "Buffer number, full path, help, modified, read-only, preview
set statusline+=%{strlen(&ft)>0?'\ \ \|\ ':''}%{&ft}                   "Filetype
set statusline+=\ \|\ %{strlen(&fenc)>0?&fenc:&enc}%{&bomb?'/bom':''}  "Encoding & byte order mark
set statusline+=\ \|\ %{&ff}                                           "File format (unix/dos/...)
set statusline+=%{&spell?'\ \ \|\ ':''}%{&spell?&spelllang:''}         "Spell language(s)
set statusline+=\ %<%=%{&ts}\ %{&et?'SP':'TB'}                         "(Soft)tabstop, Shiftwidth & Expandtab
set statusline+=\ \|\ LN:%l/%L\ \|\ COL:%c%V                           "Line number, column number
set statusline+=\ \|\ CHR:%03b(0x%04B)\ \|\ %P                         "Character, top/bot

hi User1 guifg=#fdf6e3 guibg=#dc322f gui=NONE ctermfg=0 ctermbg=1 cterm=NONE
hi StatusLine guifg=#073642 guibg=#93a1a1 gui=NONE ctermfg=12 ctermbg=10 cterm=NONE

function! UpdateStatuslineColour()
    let l:mode = mode()

    if (l:mode ==# 'i')
        hi StatusLine guifg=#073642 guibg=#268bd2 gui=NONE ctermfg=0 ctermbg=4 cterm=NONE
    elseif (l:mode ==? 'v' || l:mode ==# '' || l:mode ==? 's' || l:mode ==# '')
        hi StatusLine guifg=#073642 guibg=#719e07 gui=NONE ctermfg=0 ctermbg=2 cterm=NONE
    elseif (l:mode ==# 'R')
        hi StatusLine guifg=#fdf6e3 guibg=#dc322f gui=NONE ctermfg=0 ctermbg=1 cterm=NONE
    else
        hi StatusLine guifg=#073642 guibg=#93a1a1 gui=NONE ctermfg=12 ctermbg=10 cterm=NONE
    endif

    return ''
endfunction

" === Buffers, Windows & Tabs ===
"always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

cnoremap cwd lcd %:p:h
"nnoremap <leader>t :tabnew<cr>:e<space>

" === Clipboard ===
"if has('x') && has('gui')
    ""use + register for copy-paste
    "set clipboard=unnamedplus
"endif
set pastetoggle=<F3>

nnoremap <leader>y "+yy
vnoremap <leader>y "+ygv
nnoremap <leader>d "+dd
vnoremap <leader>d "+d
nnoremap <leader>p "+p
nnoremap <leader>P "+gP
vnoremap <leader>p "+gp
vnoremap <leader>P "+gP
nnoremap <leader>s `[v`]
nnoremap <leader>S `[V`]
nnoremap <silent> <F3> :set paste!<cr>
nnoremap <silent> <leader>tp :set paste!<cr>
nnoremap <leader>pp :set paste<cr>"+p<cr>:set nopaste<cr>
nnoremap <leader>PP :set paste<cr>"+gP<cr>:set nopaste<cr>

" === Undo Settings, Backup & Swap File ===
let directory = $HOME . "/.vim/tmp/swap/"
if !isdirectory(directory)
    call system('mkdir -p ' . directory)
endif
set directory=~/.vim/tmp/swap//
set swapfile

let directory = $HOME . "/.vim/tmp/backup/"
if !isdirectory(directory)
    call system('mkdir -p ' . directory)
endif
set backupdir=~/.vim/tmp/backup//
set backup

let directory = $HOME . "/.vim/tmp/undo/"
if !isdirectory(directory)
    call system('mkdir -p ' . directory)
endif
set undodir=~/.vim/tmp/undo//
if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" === Shell Commands Output ===
" Display output of shell commands in new window.
" Only one window by command, if a window already exists for a command, it will be reused.
" E.g. :Shell ls
function! s:ExecuteInShell(command, bang)
    let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

    if (_ != '')
        let s:_ = _
        let bufnr = bufnr('%')
        let winnr = bufwinnr('^' . _ . '$')
        silent! execute  winnr < 0 ? 'belowright new ' . fnameescape(_) : winnr . 'wincmd w'
        setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile wrap number
        silent! :%d
        let message = 'Execute ' . _ . '...'
        call append(0, message)
        echo message
        silent! 2d | resize 1 | redraw
        silent! execute 'silent! %!'. _
        silent! execute 'resize ' . line('$')
        silent! execute 'syntax on'
        silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
        silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
        silent! execute 'nnoremap <silent> <buffer> <cr> :call <SID>ExecuteInShell(''' . _ . ''', '''')<cr>'
        " Reexecute command with <localleader>r in a window opened by :Shell.
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<cr>'
        " Go to the previous window with <localleader>g.
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<cr>'
        nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<cr>
        silent! syntax on
    endif
endfunction

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')

autocmd FileType c nnoremap <leader>c9 :Shell gcc -Wall -pedantic -O3 -std=c99 -o %:r %<cr>

" === Plugins ===
" ==== Latex-Suite Settings ====
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_CompileRule_pdf='xelatex -shell-escape -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_UseMakefile=0
let g:Imap_UsePlaceHolders=0

" ==== Tagbar ====
nnoremap <silent> <leader>tt :TagbarToggle<cr>

" ==== Nerdtree ====
nnoremap <silent> <leader>td :NERDTreeToggle<cr>

" ==== Undotree ====
let g:undotree_setfocuswhentoggle=1
nnoremap <silent> <leader>tu :UndotreeToggle<cr>

" ==== Neocomplete ====
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 0
let g:neocomplete#force_overwrite_completefunc = 1

function! s:check_back_space()
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

"inoremap <expr><bs> pumvisible() ? neocomplcache#smart_close_popup() : "\<bs>"
inoremap <expr><cr> pumvisible() ? neocomplete#close_popup() : "\<cr>"
inoremap <expr><kEnter> pumvisible() ? neocomplete#close_popup() : "\<cr>"
inoremap <expr><S-kEnter> pumvisible() ? neocomplete#close_popup()."\<cr>" : "\<cr>"

inoremap <expr><tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<tab>" : "\<C-x>\<C-u>"
inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : <SID>check_back_space() ? "\<tab>" : "\<C-x>\<C-u>"

autocmd FileType c             setlocal omnifunc=ccomplete#Complete
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
autocmd FileType erlang        setlocal omnifunc=erlang_complete#Complete
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php           setlocal omnifunc=phpcomplete#CompletePHP

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

if has('gui_running')
    let g:neocomplete#sources#omni#input_patterns.python = ''
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.erlang = '\<[[:digit:][:alnum:]_-]\+:[[:digit:][:alnum:]_-]*'

" ==== Neosnippet ====
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_target)

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '/home/panayiotis/.vim/bundle/vim-snippets/snippets'

" ==== Ultisnips ====
"let g:UltiSnipsExpandTrigger="<C-CR>"
"let g:UltiSnipsJumpForwardTrigger="<C-tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" ==== Syntastic ====
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html', 'python'] }

let g:syntastic_auto_loc_list = 1
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '!'

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--disable=C0103 -f parseable -r n -i y'

" ==== Python-mode ====
let g:pymode_rope = 0
"let g:pymode_lint_ignore = 'E501'
let g:pymode_lint_mccabe_complexity = 15

" ==== Tabular ====
if exists(":Tabularize")
    nmap <leader>a= :Tabularize /=<cr>
    vmap <leader>a= :Tabularize /=<cr>
    nmap <leader>a: :Tabularize /:\zs<cr>
    vmap <leader>a: :Tabularize /:\zs<cr>
endif

"function! s:align()
"   let p = '^\s*|\s.*\s|\s*$'
"   if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"       let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"       let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"       Tabularize/|/l1
"       normal! 0
"       call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
"endfunction

"inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

" === Modeline ===
" vim: tabstop=4 softtabstop=4 shiftwidth=4 expandtab:
