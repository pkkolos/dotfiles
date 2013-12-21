" -----------------------------------------------------------------------------
" Panayiotis Kkolos
" Layout inspired by Ethan Schoonover's vimrc (github.com/altercation)
" Modified: 2013-12-21
" -----------------------------------------------------------------------------
" Environment                                    {{{
" -----------------------------------------------------------------------------
    " Setup Addons                               {{{
    " -------------------------------------------------------------------------
        " setup bundle support (in separate file)
        if filereadable(expand("~/.vimrc.bundles"))
            source ~/.vimrc.bundles
        endif
        " add system-wide path for vim addons
        set runtimepath+=/usr/share/vim/addons
    " }}}
    " Syntax Highlighting, Theme                 {{{
    " -------------------------------------------------------------------------
        filetype plugin indent on
        syntax enable
        set t_Co=16
        set background=dark
        colorscheme base16-eighties
    " }}}
    " Swap, Backup, Undo                         {{{
    " -------------------------------------------------------------------------
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

        if has('persistent_undo')
            let directory = $HOME . "/.vim/tmp/undo/"
            if !isdirectory(directory)
                call system('mkdir -p ' . directory)
            endif
            set undodir=~/.vim/tmp/undo//
            set undofile
            set undolevels=1000
            set undoreload=10000
        endif
    " }}}
    " General Settings                           {{{
    " -------------------------------------------------------------------------
        set encoding=utf-8
        set shell=$SHELL
        set tags+=~/.vim/tags
        set pastetoggle=<F3>

        set title         "set the title of the window
        set mouse=a       "use mouse in normal, visual, insert and command mode
        set autochdir
        set autowrite     "save current buffer when changing buffers
        set confirm       "operations on unsaved buffers don't fail
                          "instead they are asking for confirmation
        set modeline
        set modelines=2
        set history=100   "history of previous commands and search patterns

        set spelllang=en,el
        set nospell
    " }}}
    " Compatible Options                         {{{
    " -------------------------------------------------------------------------
        set cpoptions=aABceFsIn
        " a +d  When included, a ":read" command with a file name argument will
        "       set the alternate file name for the current window.
        " A +d  When included, a ":write" command with a file name argument
        "       will set the alternate file name for the current window.
        " B +d  A backslash has no special meaning in mappings, abbreviations
        "       and the "to" part of the menu commands. Remove this flag to be
        "       able to use a backslash like a CTRL-V. For example, the command
        "       ":map X \<Esc>" results in X being mapped to:
        "           'B' included:  "\^["    (^[ is a real <Esc>)
        "           'B' excluded:  "<Esc>"  (5 characters)
        " c +d  Searching continues at the end of any match at the cursor
        "       position, but not further than the start of the next line. When
        "       not present searching continues one character from the cursor
        "       position. With 'c' "abababababab" only gets three matches when
        "       repeating "/abab", without 'c' there are five matches.
        " C -   Do not concatenate sourced lines that start with a backslash.
        "       See |line-continuation|.
        " e +d  When executing a register with ":@r", always add a <CR> to the
        "       last line, also when the register is not linewise. If this flag
        "       is not present, the register is not linewise and the last line
        "       does not end in a <CR>, then the last line is put on the
        "       command-line and can be edited before hitting <CR>.
        " f -   When included, a ":read" command with a file name argument will
        "       set the file name for the current buffer, if the current buffer
        "       doesn't have a file name yet.
        " F +d  When included, a ":write" command with a file name argument
        "       will set the file name for the current buffer, if the current
        "       buffer doesn't have a file name yet. Also see |cpo-P|.
        " g -   Goto line 1 when using ":edit" without argument.
        " H -   When using "I" on a line with only blanks, insert before the
        "       last blank. Without this flag insert after the last blank.
        " I +   When moving the cursor up or down just after inserting indent
        "       for 'autoindent', do not delete the indent.
        " j -   When joining lines, only add two spaces after a '.', not after
        "       '!' or '?'. Also see 'joinspaces'.
        " l -   Backslash in a [] range in a search pattern is taken literally,
        "       only "\]", "\^", "\-" and "\\" are special.
        "       See |/[]|
        "          'l' included: "/[ \t]"  finds <Space>, '\' and 't'
        "          'l' excluded: "/[ \t]"  finds <Space> and <Tab>
        "       Also see |cpo-\|.
        " m -   When included, a showmatch will always wait half a second. When
        "       not included, a showmatch will wait half a second or until a
        "       character is typed. |'showmatch'|
        " n +   When included, the column used for 'number' and
        "       'relativenumber' will also be used for text of wrapped lines.
        " o -   Line offset to search command is not remembered for next
        "       search.
        " P -   When included, a ":write" command that appends to a file will
        "       set the file name for the current buffer, if the current buffer
        "       doesn't have a file name yet and the 'F' flag is also included
        "       |cpo-F|.
        " q -   When joining multiple lines leave the cursor at the position
        "       where it would be when joining two lines.
        " r -   Redo ("." command) uses "/" to repeat a search command, instead
        "       of the actually used search string.
        " s +d  Set buffer options when entering the buffer for the first time.
        "       This is like it is in Vim version 3.0. And it is the default.
        "       If not present the options are set when the buffer is created.
        " W -   Don't overwrite a readonly file. When omitted, ":w!" overwrites
        "       a readonly file, if possible.
        " y -   A yank command can be redone with ".".
        " + -   When included, a ":write file" command will reset the
        "       'modified' flag of the buffer, even though the buffer itself
        "       may still be different from its file.
        " * -   Use ":*" in the same way as ":@". When not included, ":*" is an
        "       alias for ":'<,'>", select the Visual area.
        " > -   When appending to a register, put a line break before the
        "       appended text.
        " ; -   When using |,| or |;| to repeat the last |t| search and the
        "       cursor is right in front of the searched character, the cursor
        "       won't move. When not included, the cursor would skip over it
        "       and jump to the following occurrence.
        " \ -   Backslash in a [] range in a search pattern is taken literally,
        "       only "\]" is special  See |/[]|
        "          '\' included: "/[ \-]"  finds <Space>, '\' and '-'
        "          '\' excluded: "/[ \-]"  finds <Space> and '-'
        "       Also see |cpo-l|.
        " / -   When "%" is used as the replacement string in a |:s| command,
        "       use the previous replacement string. |:s%|
        " { -   The |{| and |}| commands also stop at a "{" character at the
        "       start of a line.
    " }}}
" }}}
" Vim UI                                         {{{
" -----------------------------------------------------------------------------
    " Insert Mode                                {{{
    " -------------------------------------------------------------------------
        set backspace=indent,eol,start  "make backspace more flexible
    " }}}
    " Search, Replace                            {{{
    " -------------------------------------------------------------------------
        set hlsearch    "highlight what you search for
        set incsearch   "highlight as you type
        set ignorecase  "case-insensitive search by default
        set smartcase   "case-sensitive if there is an upper-case letter
        set gdefault    "when replacing, use /g by default
    " }}}
    " Display                                    {{{
    " -------------------------------------------------------------------------
        set list                             "show special characters
        set listchars=tab:▸\ ,trail:·,eol:↲  "for tabs, trailing spaces,
        set listchars+=extends:❯,precedes:❮  "end of line and long lines
        set showmatch                        "bracket match highlighting
        set matchtime=3                      "time of bracket matching
        set matchpairs=(:),[:],{:}           "type of brackets to match
        set display=lastline                 "display as much as possible
                                             "of the last line
    " }}}
    " Navigation                                 {{{
    " -------------------------------------------------------------------------
        set scrolloff=2        "lines to keep around the cursor
        set selection=old      "don't let the cursor move past
                               "the last char in visual mode
        set virtualedit=block  "let the cursor move past the
                               "last char in visual block mode
        set whichwrap=<,>,[,]  "left/right arrows move the cursor
                               "to previous/next line
    " }}}
    " Completion                                 {{{
    " -------------------------------------------------------------------------
        set wildmenu                            "command-line completion
                                                "shows a list of matches
        set wildmode=longest,list:longest,full
        set omnifunc=syntaxcomplete#Complete
    " }}}
    " Folding                                    {{{
    " -------------------------------------------------------------------------
        set foldenable         "enable folding
        set foldmethod=syntax  "fold based on syntax
        set foldlevelstart=99  "start with all foldings opened
    " }}}
    " Location Indicators                        {{{
    " -------------------------------------------------------------------------
        set number          "show line numbers (compatibility)
        set relativenumber  "show relative line numbers
        set numberwidth=3   "minimal digits in line numbers
        set cursorline      "highlight current line
        set nocursorcolumn  "don't highlight current column
        set colorcolumn=0   "list of highlighted screen columns
        set showbreak=+++   "string for wrapped lines
    " }}}
    " Status Indicators                          {{{
    " -------------------------------------------------------------------------
        set showcmd       "show partial command and selected chars,
                          "lines or blocks in visual mode
        set showmode      "show message in insert, replace and visual mode
        set laststatus=2  "always show status line
        set novisualbell  "don't use visual bell (flash)
        set report=0      "always report number of lines changed
    " }}}
    " Statusline Format                          {{{
    " -------------------------------------------------------------------------
        " change status line's colour in insert, visual and replace mode
        set statusline=%{UpdateStatuslineColour()}
        " paste status
        set statusline+=%1*%{&paste?'[PASTE]':''}
        " buffer number, full path, help, modified, read-only, preview
        set statusline+=%0*[%n]\ %f%h%m%r%w
        " filetype
        set statusline+=%{strlen(&ft)>0?'\ \ \|\ ':''}%{&ft}
        " encoding & byte order mark
        set statusline+=\ \|\ %{strlen(&fenc)>0?&fenc:&enc}%{&bomb?'/bom':''}
        " file format (unix/dos/...)
        set statusline+=\ \|\ %{&ff}
        " spelling language(s)
        set statusline+=%{&spell?'\ \ \|\ ':''}%{&spell?&spelllang:''}
        " tabstop number, expandtab status
        set statusline+=\ %<%=%{&ts}\ %{&et?'SP':'TB'}
        " line number, column number
        set statusline+=\ \|\ LN:%l/%L\ \|\ COL:%c%V
        " character code, top/bot
        set statusline+=\ \|\ CHR:%03b(0x%04B)\ \|\ %P

        hi User1 guifg=#fdf6e3 guibg=#dc322f gui=NONE
        hi User1 ctermfg=0 ctermbg=1 cterm=NONE
        hi StatusLine guifg=#073642 guibg=#93a1a1 gui=NONE
        hi StatusLine ctermfg=12 ctermbg=10 cterm=NONE

        function! UpdateStatuslineColour()
            let l:mode = mode()

            if (l:mode ==# 'i')
                hi StatusLine guifg=#073642 guibg=#268bd2 gui=NONE
                hi StatusLine ctermfg=0 ctermbg=4 cterm=NONE
            elseif (l:mode ==? 'v' || l:mode ==# '' ||
                        \ l:mode ==? 's' || l:mode ==# '')
                hi StatusLine guifg=#073642 guibg=#719e07 gui=NONE
                hi StatusLine ctermfg=0 ctermbg=2 cterm=NONE
            elseif (l:mode ==# 'R')
                hi StatusLine guifg=#fdf6e3 guibg=#dc322f gui=NONE
                hi StatusLine ctermfg=0 ctermbg=1 cterm=NONE
            else
                hi StatusLine guifg=#073642 guibg=#93a1a1 gui=NONE
                hi StatusLine ctermfg=12 ctermbg=10 cterm=NONE
            endif

            return ''
        endfunction
    " }}}
    " Short Message Format                       {{{
    " -------------------------------------------------------------------------
        set shortmess=atToOI
        " f -d  use "(3 of 5)" instead of "(file 3 of 5)"
        " i -d  use "[noeol]" instead of "[Incomplete last line]"
        " l -d  use "999L, 888C" instead of "999 lines, 888 characters"
        " m -   use "[+]" instead of "[Modified]"
        " n -d  use "[New]" instead of "[New File]"
        " r -   use "[RO]" instead of "[readonly]"
        " w -   use "[w]" instead of "written" for file write message
        "       and "[a]" instead of "appended" for ':w >> file' command
        " x -d  use "[dos]" instead of "[dos format]", "[unix]" instead of
        "       "[unix format]" and "[mac]" instead of "[mac format]".
        " a +   all of the above abbreviations
        "
        " o +d  overwrite message for writing a file with subsequent message
        "       for reading a file (useful for ":wn" or when 'autowrite' on)
        " O +d  message for reading a file overwrites any previous message.
        "       Also for quickfix message (e.g., ":cn").
        " s -   don't give "search hit BOTTOM, continuing at TOP" or "search
        "       hit TOP, continuing at BOTTOM" messages
        " t +d  truncate file message at the start if it is too long to fit on
        "       the command-line, "<" will appear in the left most column.
        "       Ignored in Ex mode.
        " T +d  truncate other messages in the middle if they are too long to
        "       fit on the command line.  "..." will appear in the middle.
        "       Ignored in Ex mode.
        " W -   don't give "written" or "[w]" when writing a file
        " A -   don't give the "ATTENTION" message when an existing swap file
        "       is found.
        " I +   don't give the intro message when starting Vim |:intro|.
    " }}}
    " Screen Drawing                             {{{
    " -------------------------------------------------------------------------
        set ttyfast     "indicates a fast terminal connection (fast redraw)
        set lazyredraw  "do not redraw while running macros
                        "necessary for correct usage of status line colours
    " }}}
" }}}
" Text Formatting/Layout                         {{{
" -----------------------------------------------------------------------------
    " Wrap, Join                                 {{{
    " -------------------------------------------------------------------------
        set wrap          "auto wrap line view, but not text itself
        set textwidth=79  "maximum text width (column for text wrapping)
        set nojoinspaces  "when joining lines insert only one space after .?!
    " }}}
    " Tabs, Indentation                          {{{
    " -------------------------------------------------------------------------
        set expandtab      "use spaces instead of tabs
        set tabstop=4      "how many columns a tab counts for
        set softtabstop=4  "how many columns to use when you hit tab
        set shiftwidth=4   "how many columns text is indented
        set smarttab       "use shiftwidth value for inserting
                           "tabs at the beggining of a line
        set shiftround     "indentation is rounded to multiple of shiftwidth
        set autoindent    "automatically indent a new line
        set smartindent   "smart autoindentation when starting new line
    " }}}
    " Format Options                             {{{
    " -------------------------------------------------------------------------
        set formatoptions=tcqronlj
        " t +d  Auto-wrap text using textwidth
        " c +d  Auto-wrap comments using textwidth, inserting the current
        "       comment leader automatically.
        " r +   Automatically insert the current comment leader after hitting
        "       <Enter> in Insert mode.
        " o +   Automatically insert the current comment leader after hitting
        "       'o' or 'O' in Normal mode.
        " q +d  Allow formatting of comments with "gq".
        "       Note that formatting will not change blank lines or lines
        "       containing only the comment leader. A new paragraph starts
        "       after such a line, or when the comment leader changes.
        " w -   Trailing white space indicates a paragraph continues in the
        "       next line. A line that ends in a non-white character ends a
        "       paragraph.
        " a -   Automatic formatting of paragraphs. Every time text is inserted
        "       or deleted the paragraph will be reformatted. See
        "       |auto-format|. When the 'c' flag is present this only happens
        "       for recognized comments.
        " n +   When formatting text, recognize numbered lists. This actually
        "       uses the 'formatlistpat' option, thus any kind of list can be
        "       used. The indent of the text after the number is used for the
        "       next line. The default is to find a number, optionally followed
        "       by '.', ':', ')', ']' or '}'. Note that 'autoindent' must be
        "       set too. Doesn't work well together with "2".
        "       Example:
        "               1. the first item
        "                  wraps
        "               2. the second item
        " 2 -   When formatting text, use the indent of the second line of a
        "       paragraph for the rest of the paragraph, instead of the indent
        "       of the first line. This supports paragraphs in which the first
        "       line has a different indent than the rest. Note that
        "       'autoindent' must be set too.
        "       Example:
        "                       first line of a paragraph
        "               second line of the same paragraph
        "               third line.
        "       This also works inside comments, ignoring the comment leader.
        " v -   Vi-compatible auto-wrapping in insert mode: Only break a line
        "       at a blank that you have entered during the current insert
        "       command.
        "       Note: this is not 100% Vi compatible. Vi has some
        "       "unexpected features" or bugs in this area. It uses the screen
        "       column instead of the line column.
        " b -   Like 'v', but only auto-wrap if you enter a blank at or before
        "       the wrap margin. If the line was longer than 'textwidth' when
        "       you started the insert, or you do not enter a blank in the
        "       insert before reaching 'textwidth', Vim does not perform
        "       auto-wrapping.
        " l +   Long lines are not broken in insert mode: When a line was
        "       longer than 'textwidth' when the insert command started, Vim
        "       does not automatically format it.
        " m -   Also break at a multi-byte character above 255. This is useful
        "       for Asian text where every character is a word on its own.
        " M -   When joining lines, don't insert a space before or after a
        "       multi-byte character. Overrules the 'B' flag.
        " B -   When joining lines, don't insert a space between two multi-byte
        "       characters. Overruled by the 'M' flag.
        " 1 -   Don't break a line after a one-letter word. It's broken before
        "       it instead (if possible).
        " j +   Where it makes sense, remove a comment leader when joining
        "       lines.
        "       For example, joining:
        "               int i;   // the index
        "                        // in the list
        "       becomes:
        "               int i;   // the index in the list
    " }}}
    " C Indent Options                           {{{
    " -------------------------------------------------------------------------
        set cinoptions=l1,t0,U1
        " lN  If N != 0 Vim will align with a case label instead of the
        "     statement after it in the same line.
        "
        "       cino=                       cino=l1
        "           switch (a) {              switch (a) {
        "               case 1: {                 case 1: {
        "                           break;            break;
        "                       }                 }
        "
        " tN  Indent a function return type declaration N characters from the
        "     margin. (default 'shiftwidth').
        "
        "       cino=              cino=t0              cino=t7
        "             int            int                         int
        "         func()             func()               func()
        "
        " UN  When N is non-zero, do not ignore the indenting specified by ( or
        "     u in case that the unclosed parentheses is the first non-white
        "     character in its line. (default 0).
        "
        "       cino= or cino=(s          cino=(s,U1
        "         c = c1 &&	              c = c1 &&
        "             (                         (
        "              c2 ||                        c2 ||
        "              c3                           c3
        "             ) && c4;                  ) && c4;
    " }}}
" }}}
" Maps & Functions                               {{{
" -----------------------------------------------------------------------------
    " Leader                                     {{{
    " -------------------------------------------------------------------------
        let mapleader = "\\"
    " }}}
    " Autocommands                               {{{
    " -------------------------------------------------------------------------
        "autocmd FileType haskell,python setlocal expandtab
        autocmd FileType haskell setlocal foldmethod=indent
        autocmd FileType html,xml,xslt setlocal matchpairs+=<:>
        autocmd FileType c setlocal omnifunc=ccomplete#Complete
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType erlang setlocal omnifunc=erlang_complete#Complete
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
        autocmd FileType html,markdown
                    \ setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript
                    \ setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType c nnoremap
            \ <leader>c9 :Shell gcc -Wall -pedantic -O3 -std=c99 -o %:r %<cr>
        " when vimrc is edited, reload it.
        au! BufWritePost .vimrc source $MYVIMRC | setlocal foldmethod=marker
        " don't show trailing spaces in insert mode
        augroup trailing
            au!
            au InsertEnter * :set listchars-=trail:·
            au InsertLeave * :set listchars+=trail:·
        augroup END
    " }}}
    " Clipboard                                  {{{
    " -------------------------------------------------------------------------
        nnoremap <leader>y "+yy
        vnoremap <leader>y "+ygv
        nnoremap <leader>d "+dd
        vnoremap <leader>d "+d
        nnoremap <leader>p "+p
        nnoremap <leader>P "+gP
        vnoremap <leader>p "+gp
        vnoremap <leader>P "+gP
        nnoremap <silent> <F3> :set paste!<cr>
        nnoremap <silent> <leader>tp :set paste!<cr>
    " }}}
    " Search, Copy, Replace                      {{{
    " -------------------------------------------------------------------------
        nnoremap <leader>/ :noh<cr>
        noremap n nzz
        noremap N Nzz
        noremap / /\v
        noremap ? ?\v
        cnoremap s/ s/\v
        nnoremap Y y$
    " }}}
    " Navigation                                 {{{
    " -------------------------------------------------------------------------
        noremap k gk
        noremap j gj
        noremap gk k
        noremap gj j
        noremap <up> gk
        noremap <down> gj
        noremap <tab> %
    " }}}
    " Folding                                    {{{
    " -------------------------------------------------------------------------
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
    " }}}
    " Location Indicators                        {{{
    " -------------------------------------------------------------------------
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
        nnoremap <silent> <leader>tl :set list!<cr>
        nnoremap <silent> <leader>tn :call g:ToggleNumMode()<cr>
        nnoremap <silent> <leader>tv :call g:ToggleColorColumn()<cr>
        nnoremap <silent> <leader>tc :call g:ToggleCursorColumn()<cr>
    " }}}
    " Tabs, Indentation, Whitespace              {{{
    " -------------------------------------------------------------------------
        function! <sid>StripTrWhSp()
            " preparation: save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " Do the business:
            %s/\s\+$//e
            " clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endfunction
        nnoremap <leader>[ <<
        nnoremap <leader>] >>
        vnoremap <leader>[ <gv
        vnoremap <leader>] >gv
        nnoremap <leader>rt :retab!<cr>
        vnoremap <leader>rt :retab!<cr>
        nnoremap <silent> <leader>te :set expandtab!<cr>
        nnoremap <leader>w :call <sid>StripTrWhSp()<cr>
    " }}}
    " Shell                                      {{{
    " -------------------------------------------------------------------------
        " Display output of shell commands in new window.
        " Only one window by command, if a window already exists for a command,
        " it will be reused.
        function! s:ExecuteInShell(command, bang)
            let _ = a:bang != '' ? s:_ : a:command == '' ? ''
                        \ : join(map(split(a:command), 'expand(v:val)'))

            if (_ != '')
                let s:_ = _
                let bufnr = bufnr('%')
                let winnr = bufwinnr('^' . _ . '$')
                silent! execute  winnr < 0 ? 'belowright new '
                            \ . fnameescape(_) : winnr . 'wincmd w'
                setlocal buftype=nowrite bufhidden=wipe nobuflisted
                            \ noswapfile wrap number
                silent! :%d
                let message = 'Execute ' . _ . '...'
                call append(0, message)
                echo message
                silent! 2d | resize 1 | redraw
                silent! execute 'silent! %!'. _
                silent! execute 'resize ' . line('$')
                silent! execute 'syntax on'
                silent! execute 'autocmd BufUnload <buffer> execute bufwinnr('
                            \ . bufnr . ') . ''wincmd w'''
                silent! execute 'autocmd BufEnter <buffer> execute ''resize'
                            \ . ' '' . line(''$'')'
                silent! execute 'nnoremap <silent> <buffer> <cr> :call '
                            \ . '<SID>ExecuteInShell(''' . _ . ''', '''')<cr>'
                " reexecute command with <localleader>r
                " in a window opened by :Shell.
                silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r '
                            \ . ':call <SID>ExecuteInShell(''' . _
                            \ . ''', '''')<cr>'
                " go to the previous window with <localleader>g.
                silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g'
                            \ . ':execute bufwinnr(' . bufnr
                            \ . ') . ''wincmd w''<cr>'
                nnoremap <silent> <buffer> <C-W>_ :execute 'resize '
                            \ . line('$')<cr>
                silent! syntax on
            endif
        endfunction

        command! -complete=shellcmd -nargs=* -bang Shell
                    \ call s:ExecuteInShell(<q-args>, '<bang>')
    " }}}
    " Other                                      {{{
    " -------------------------------------------------------------------------
        nnoremap ; :
        inoremap jk <Esc>
        "nnoremap <leader>o m`o<Esc>``
        "nnoremap <leader>O m`O<Esc>``
        nnoremap <leader>o o<Esc>
        nnoremap <leader>O O<Esc>
        nnoremap <leader>s `[v`]
        nnoremap <leader>S `[V`]
        nnoremap <silent> <leader>ts :set spell!<cr>
        " save file even when you edited it without the needed permissions
        cnoremap w!! execute ':silent w !sudo tee % > /dev/null' <bar> edit!
    " }}}
" }}}
" Plugins                                        {{{
" -----------------------------------------------------------------------------
    " Latex-Suite                                {{{
    " -------------------------------------------------------------------------
        let g:Tex_DefaultTargetFormat = 'pdf'
        let g:Tex_MultipleCompileFormats = 'pdf'
        let g:Tex_CompileRule_pdf =
                    \ 'xelatex -shell-escape -interaction=nonstopmode'
                    \ . ' -file-line-error-style $*'
        let g:Tex_UseMakefile = 0
        let g:Imap_UsePlaceHolders = 0
    " }}}
    " Tagbar                                     {{{
    " -------------------------------------------------------------------------
        nnoremap <silent> <leader>tt :TagbarToggle<cr>
    " }}}
    " Nerdtree                                   {{{
    " -------------------------------------------------------------------------
        nnoremap <silent> <leader>td :NERDTreeToggle<cr>
    " }}}
    " Undotree                                   {{{
    " -------------------------------------------------------------------------
        let g:undotree_setfocuswhentoggle = 1
        nnoremap <silent> <leader>tu :UndotreeToggle<cr>
    " }}}
    " Neocomplete & Neosnippet                   {{{
    " -------------------------------------------------------------------------
        let g:neocomplete#enable_at_startup = 1
        "let g:neocomplete#enable_smart_case = 0
        "let g:neocomplete#enable_auto_select = 1
        let g:neocomplete#force_overwrite_completefunc = 1
        let g:neocomplete#auto_completion_start_length = 1
        let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'

        let g:neosnippet#enable_snipmate_compatibility = 1
        let g:neosnippet#snippets_directory =
                    \ '~/.vim/bundle/vim-snippets/snippets'

        function! s:check_back_space()
            let col = col('.') - 1
            return !col || getline('.')[col - 1] =~ '\s'
        endfunction

        imap <C-s> <Plug>(neosnippet_expand_or_jump)
        smap <C-s> <Plug>(neosnippet_expand_or_jump)
        xmap <C-s> <Plug>(neosnippet_expand_target)

        inoremap <expr><C-g> neocomplete#undo_completion()
        inoremap <expr><C-l> neocomplete#complete_common_string()
        "inoremap <expr><C-h> neocomplete#smart_close_popup()
        "inoremap <expr><C-y> neocomplete#close_popup()
        inoremap <expr><C-e> neocomplete#cancel_popup()

        inoremap <expr><left>  neocomplete#cancel_popup()."\<left>"
        inoremap <expr><right> neocomplete#cancel_popup()."\<right>"
        inoremap <expr><up>    pumvisible() ? "\<up>"
                    \ : neocomplete#cancel_popup()."\<up>"
        inoremap <expr><down>  pumvisible() ? "\<down>"
                    \ : neocomplete#cancel_popup()."\<down>"

        inoremap <expr><bs>       pumvisible()
                    \ ? neocomplete#smart_close_popup()."\<C-h>" : "\<bs>"
        inoremap <expr><cr>       pumvisible()
                    \ ? neocomplete#close_popup()                : "\<cr>"
        inoremap <expr><space>    pumvisible()
                    \ ? neocomplete#close_popup()."\<space>"     : "\<space>"
        inoremap <expr><kenter>   pumvisible()
                    \ ? neocomplete#close_popup()                : "\<cr>"
        inoremap <expr><S-kenter> pumvisible()
                    \ ? neocomplete#close_popup()."\<cr>"        : "\<cr>"

        imap     <expr><tab> pumvisible() ? "\<C-n>"
                    \ : neosnippet#expandable_or_jumpable()
                    \ ? "\<Plug>(neosnippet_expand_or_jump)"
                    \ : <SID>check_back_space() ? "\<tab>"
                    \ : neocomplete#start_manual_complete()
        smap     <expr><tab> neosnippet#expandable_or_jumpable()
                    \ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
        inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "\<tab>"

        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
        endif
        "if has('gui_running')
            "let g:neocomplete#sources#omni#input_patterns.python = ''
        "endif

        if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
        endif
        let g:neocomplete#force_omni_input_patterns.ruby =
                    \ '[^. *\t]\.\w*\|\h\w*::'
        let g:neocomplete#force_omni_input_patterns.erlang =
                    \ '\<[[:digit:][:alnum:]_-]\+:[[:digit:][:alnum:]_-]*'
    " }}}
    " Syntastic                                  {{{
    " -------------------------------------------------------------------------
        let g:syntastic_mode_map = { 'mode': 'active',
                    \ 'active_filetypes': [],
                    \ 'passive_filetypes': ['html', 'python'] }

        let g:syntastic_auto_loc_list = 1
        "let g:syntastic_error_symbol = '✗'
        "let g:syntastic_warning_symbol = '!'

        let g:syntastic_python_checkers = ['pylint']
        let g:syntastic_python_pylint_args =
                    \ '--disable=C0103 -f parseable -r n -i y'
    " }}}
    " Python-Mode                                {{{
    " -------------------------------------------------------------------------
        let g:pymode_rope = 0
        "let g:pymode_lint_ignore = 'E501'
        let g:pymode_lint_mccabe_complexity = 15
    " }}}
    " Tabular                                    {{{
    " -------------------------------------------------------------------------
        if exists(":Tabularize")
            nmap <leader>a= :Tabularize /=<cr>
            vmap <leader>a= :Tabularize /=<cr>
            nmap <leader>a: :Tabularize /:\zs<cr>
            vmap <leader>a: :Tabularize /:\zs<cr>
        endif

        "function! s:align()
           "let p = '^\s*|\s.*\s|\s*$'
           "if exists(':Tabularize') && getline('.') =~# '^\s*|' &&
                       "\ (getline(line('.')-1) =~# p ||
                       "\ getline(line('.')+1) =~# p)
               "let column = strlen(substitute(
                           "\ getline('.')[0:col('.')],'[^|]','','g'))
               "let position = strlen(matchstr(
                           "\ getline('.')[0:col('.')],'.*|\s*\zs.*'))
               "Tabularize/|/l1
               "normal! 0
               "call search(repeat('[^|]*|',column).'\s\{-\}'.
                           "\ repeat('.',position),'ce',line('.'))
           "endif
        "endfunction

        "inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
    " }}}
    " Yankstack                                  {{{
    " -------------------------------------------------------------------------
        let g:yankstack_map_keys = 0

        nmap <leader>pp <Plug>yankstack_substitute_older_paste
        nmap <leader>PP <Plug>yankstack_substitute_newer_paste
    " }}}
" }}}
" -----------------------------------------------------------------------------
" vim: foldmethod=marker foldlevel=1
" -----------------------------------------------------------------------------
