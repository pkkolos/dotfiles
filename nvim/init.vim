" ------------------------------------------------------------------------------
" Environment                                    {{{
" ------------------------------------------------------------------------------
    " Shada File                                 {{{
    " --------------------------------------------------------------------------
        if exists("g:sudoedit")
            set shada=
        endif
    " }}}
    " Setup Plugins                              {{{
    " --------------------------------------------------------------------------
        if !exists("g:sudoedit")
            lua require 'paqs'
        endif
    " }}}
    " Syntax Highlighting, Theme                 {{{
    " --------------------------------------------------------------------------
        filetype plugin indent on
        syntax enable
        set background=dark
        colorscheme darkarc
        " when opening .tex-files, don't treat them as plaintext
        " if there are no LaTeX commands inside yet
        let g:tex_flavor='latex'
    " }}}
    " Swap, Backup, Undo                         {{{
    " --------------------------------------------------------------------------
        set updatetime=250
        if exists("g:sudoedit")
            set noswapfile
        else
            set swapfile
        endif

        set nobackup

        if has('persistent_undo')
            if exists("g:sudoedit")
                set noundofile
            else
                set undofile
            endif
        endif
    " }}}
    " General Settings                           {{{
    " --------------------------------------------------------------------------
        set shell=$SHELL
        set grepprg=grep\ -nH\ $*
        set pastetoggle=<F3>

        set title         "set the title of the window
        set mouse=a       "use mouse in normal, visual, insert and command mode
        set autochdir
        set autowrite     "save current buffer when changing buffers
        set confirm       "operations on unsaved buffers don't fail
                          "instead they are asking for confirmation

        if exists("g:sudoedit")
            set nomodeline
            set modelines=0
        else
            set modeline
            set modelines=2
        endif

        set history=100   "history of previous commands and search patterns

        set notimeout        "wait indefinitely on mappings
        set ttimeout         "timeout on keycodes
        set ttimeoutlen=100  "configure keycode timeout

        set spelllang=en,el
        set nospell

        set cedit=<C-g>      "open command-line with ctrl+g instead of ctrl+f
    " }}}
    " Compatible Options                         {{{
    " --------------------------------------------------------------------------
        set cpoptions=aABceFsIn
        " a +d  When included, a ":read" command with a file name argument will
        "       set the alternate file name for the current window.
        " A +d  When included, a ":write" command with a file name argument will
        "       set the alternate file name for the current window.
        " b -   "\|" in a ":map" command is recognized as the end of the map
        "       command.  The '\' is included in the mapping, the text after the
        "       '|' is interpreted as the next command.  Use a CTRL-V instead of
        "       a backslash to include the '|' in the mapping.  Applies to all
        "       mapping, abbreviation, menu and autocmd commands.
        "       See also |map_bar|.
        " B +d  A backslash has no special meaning in mappings, abbreviations
        "       and the "to" part of the menu commands.  Remove this flag to be
        "       able to use a backslash like a CTRL-V.  For example, the command
        "       ":map X \<Esc>" results in X being mapped to:
        "               'B' included:   "\^["     (^[ is a real <Esc>)
        "               'B' excluded:   "<Esc>"   (5 characters)
        " c +d  Searching continues at the end of any match at the cursor
        "       position, but not further than the start of the next line.  When
        "       not present searching continues one character from the cursor
        "       position.  With 'c' "abababababab" only gets three matches when
        "       repeating "/abab", without 'c' there are five matches.
        " C -   Do not concatenate sourced lines that start with a backslash.
        "       See |line-continuation|.
        " d -   Using "./" in the 'tags' option doesn't mean to use the tags
        "       file relative to the current file, but the tags file in the
        "       current directory.
        " D -   Can't use CTRL-K to enter a digraph after Normal mode commands
        "       with a character argument, like |r|, |f| and |t|.
        " e +d  When executing a register with ":@r", always add a <CR> to the
        "       last line, also when the register is not linewise.  If this flag
        "       is not present, the register is not linewise and the last line
        "       does not end in a <CR>, then the last line is put on the
        "       command-line and can be edited before hitting <CR>.
        " E -   It is an error when using "y", "d", "c", "g~", "gu" or "gU" on
        "       an Empty region.  The operators only work when at least one
        "       character is to be operated on.  Example: This makes "y0" fail
        "       in the first column.
        " f -   When included, a ":read" command with a file name argument will
        "       set the file name for the current buffer, if the current buffer
        "       doesn't have a file name yet.
        " F +d  When included, a ":write" command with a file name argument will
        "       set the file name for the current buffer, if the current buffer
        "       doesn't have a file name yet.  Also see |cpo-P|.
        " i -   When included, interrupting the reading of a file will leave it
        "       modified.
        " I +   When moving the cursor up or down just after inserting indent
        "       for 'autoindent', do not delete the indent.
        " J -   A |sentence| has to be followed by two spaces after the '.', '!'
        "       or '?'.  A <Tab> is not recognized as white space.
        " K -   Don't wait for a key code to complete when it is halfway through
        "       a mapping.  This breaks mapping <F1><F1> when only part of the
        "       second <F1> has been read.  It enables cancelling the mapping by
        "       typing <F1><Esc>.
        " l -   Backslash in a [] range in a search pattern is taken literally,
        "       only "\]", "\^", "\-" and "\\" are special.
        "       See |/[]|
        "               'l' included:   "/[ \t]"  finds <Space>, '\' and 't'
        "               'l' excluded:   "/[ \t]"  finds <Space> and <Tab>
        " L -   When the 'list' option is set, 'wrapmargin', 'textwidth',
        "       'softtabstop' and Virtual Replace mode (see |gR|) count a <Tab>
        "       as two characters, instead of the normal behavior of a <Tab>.
        " m -   When included, a showmatch will always wait half a second.  When
        "       not included, a showmatch will wait half a second or until a
        "       character is typed.  |'showmatch'|
        " M -   When excluded, "%" matching will take backslashes into account.
        "       Thus in "( \( )" and "\( ( \)" the outer parenthesis match.
        "       When included "%" ignores backslashes, which is Vi compatible.
        " n +   When included, the column used for 'number' and 'relativenumber'
        "       will also be used for text of wrapped lines.
        " o -   Line offset to search command is not remembered for next search.
        " O -   Don't complain if a file is being overwritten, even when it
        "       didn't exist when editing it.  This is a protection against a
        "       file unexpectedly created by someone else.  Vi didn't complain
        "       about this.
        " p -   Vi compatible Lisp indenting.  When not present, a slightly
        "       better algorithm is used.
        " P -   When included, a ":write" command that appends to a file will
        "       set the file name for the current buffer, if the current buffer
        "       doesn't have a file name yet and the 'F' flag is also included
        "       |cpo-F|.
        " q -   When joining multiple lines leave the cursor at the position
        "       where it would be when joining two lines.
        " r -   Redo ("." command) uses "/" to repeat a search command, instead
        "       of the actually used search string.
        " R -   Remove marks from filtered lines.  Without this flag marks are
        "       kept like |:keepmarks| was used.
        " s +d  Set buffer options when entering the buffer for the first time.
        "       This is like it is in Vim version 3.0.  And it is the default.
        "       If not present the options are set when the buffer is created.
        " S -   Set buffer options always when entering a buffer (except
        "       'readonly', 'fileformat', 'filetype' and 'syntax').  This is the
        "       (most) Vi compatible setting.  The options are set to the values
        "       in the current buffer.  When you change an option and go to
        "       another buffer, the value is copied.  Effectively makes the
        "       buffer options global to all buffers.
        "               's'    'S'      copy buffer options
        "               no     no       when buffer created
        "               yes    no       when buffer first entered (default)
        "                X     yes      each time when buffer entered (vi comp.)
        " t -   Search pattern for the tag command is remembered for "n"
        "       command.  Otherwise Vim only puts the pattern in the history for
        "       search pattern, but doesn't change the last used search pattern.
        " u -   Undo is Vi compatible.  See |undo-two-ways|.
        " v -   Backspaced characters remain visible on the screen in Insert
        "       mode.  Without this flag the characters are erased from the
        "       screen right away.  With this flag the screen newly typed text
        "       overwrites backspaced characters.
        " W -   Don't overwrite a readonly file.  When omitted, ":w!" overwrites
        "       a readonly file, if possible.
        " x -   <Esc> on the command-line executes the command-line.  The
        "       default in Vim is to abandon the command-line, because <Esc>
        "       normally aborts a command.  |c_<Esc>|
        " X -   When using a count with "R" the replaced text is deleted only
        "       once.  Also when repeating "R" with "." and a count.
        " y -   A yank command can be redone with ".".
        " Z -   When using "w!" while the 'readonly' option is set, don't reset
        "       'readonly'.
        " ! -   When redoing a filter command, use the last used external
        "       command, whatever it was.  Otherwise the last used -filter-
        "       command is used.
        " $ -   When making a change to one line, don't redisplay the line, but
        "       put a '$' at the end of the changed text.  The changed text will
        "       be overwritten when you type the new text.  The line is
        "       redisplayed if you type any command that moves the cursor from
        "       the insertion point.
        " % -   Vi-compatible matching is done for the "%" command.
        "       Does not recognize "#if", "#endif", etc.
        "       Does not recognize "/*" and "*/".
        "       Parens inside single and double quotes are also counted, causing
        "       a string that contains a paren to disturb the matching.  For
        "       example, in a line like "if (strcmp("foo(", s))" the first paren
        "       does not match the last one.  When this flag is not included,
        "       parens inside single and double quotes are treated specially.
        "       When matching a paren outside of quotes, everything inside
        "       quotes is ignored.  When matching a paren inside quotes, it will
        "       find the matching one (if there is one).  This works very well
        "       for C programs.  This flag is also used for other features, such
        "       as C-indenting.
        " + -   When included, a ":write file" command will reset the 'modified'
        "       flag of the buffer, even though the buffer itself may still be
        "       different from its file.
        " > -   When appending to a register, put a line break before the
        "       appended text.
        " ; -   When using |,| or |;| to repeat the last |t| search and the
        "       cursor is right in front of the searched character, the cursor
        "       won't move.  When not included, the cursor would skip over it
        "       and jump to the following occurrence.
        " _ -   When using |cw| on a word, do not include the whitespace
        "       following the word in the motion.
    " }}}
" }}}
" Vim UI                                         {{{
" ------------------------------------------------------------------------------
    " Insert Mode                                {{{
    " --------------------------------------------------------------------------
        set backspace=indent,eol,start  "make backspace more flexible
    " }}}
    " Search, Replace                            {{{
    " --------------------------------------------------------------------------
        set hlsearch    "highlight what you search for
        set incsearch   "highlight as you type
        set ignorecase  "case-insensitive search by default
        set smartcase   "case-sensitive if there is an upper-case letter
        set gdefault    "when replacing, use /g by default
        set inccommand=nosplit
    " }}}
    " Display                                    {{{
    " --------------------------------------------------------------------------
        set list                             "show special characters
        set listchars=tab:▸\ ,trail:·,eol:↲  "for tabs, trailing spaces, end of
        set listchars+=extends:❯,precedes:❮  "line, long lines, non breakable
        set listchars+=nbsp:␣,conceal:✘      "spaces, and conceal characters

        set showmatch               "bracket match highlighting
        set matchtime=3             "time of bracket matching
        set matchpairs=(:),[:],{:}  "type of brackets to match

        set splitbelow        "put the new window below the current one
        set splitright        "put the new window right of the current one
        set display=lastline  "display as much as possible of the last line
        set conceallevel=1    "show cchar or listchar for conceal text
        set concealcursor=nc  "conceal text even in the cursorline in
                              "normal mode and command-line editing mode
    " }}}
    " Navigation                                 {{{
    " -------------------------------------------------------------------------
        set scrolloff=2         "lines to keep around the cursor
        set sidescroll=1        "scroll one column at a time
        set sidescrolloff=5     "columns to keep around the cursor
        set nostartofline       "try to keep the cursor in the same column
                                "when scrolling in the buffer, changing
                                "buffers, indenting or deleting
        set selection=old       "don't let the cursor move past
                                "the last char in visual mode
        set virtualedit=block   "let the cursor move past the
                                "last char in visual block mode
        set whichwrap=<,>,[,]   "left/right arrows move the cursor
                                "to previous/next line
        set switchbuf+=useopen  "when switching between buffers jump to the
                                "first window that contains the specified
                                "buffer; don't consider windows on other tabs
    " }}}
    " Completion                                 {{{
    " -------------------------------------------------------------------------
        set wildmenu                          "command-line completion
                                              "shows a list of matches
        set wildmode=list:longest,full
        set completeopt=menuone,noinsert,noselect
        set omnifunc=syntaxcomplete#Complete
    " }}}
    " Folding                                    {{{
    " --------------------------------------------------------------------------
        set foldenable         "enable folding
        set foldmethod=syntax  "fold based on syntax
        set foldlevelstart=99  "start with all foldings opened
        set foldnestmax=3      "sets the maximum nesting of folds for indent
                               "and syntax methods
        "set foldcolumn=4       "use 4 columns to indicate open/closed folds
    " }}}
    " Location Indicators                        {{{
    " --------------------------------------------------------------------------
        set number           "show line numbers (if set with relativenumber it
                             "shows the number of the current line instead of 0)
        set relativenumber   "show relative line numbers
        set numberwidth=5    "minimal digits in line numbers
        set cursorline       "highlight current line
        set nocursorcolumn   "don't highlight current column
        set colorcolumn=+1   "list of highlighted screen columns
        set showbreak=❯❯❯❯❯  "string for wrapped lines
    " }}}
    " Status Indicators                          {{{
    " --------------------------------------------------------------------------
        set showcmd       "show partial command and selected chars,
                          "lines or blocks in visual mode
        set showmode      "show message in insert, replace and visual mode
        set laststatus=2  "always show status line
        set novisualbell  "don't use visual bell (flash)
        set report=0      "always report number of lines changed
    " }}}
    " Short Message Format                       {{{
    " --------------------------------------------------------------------------
        set shortmess=atToOIc
        " f -d  use "(3 of 5)" instead of "(file 3 of 5)"
        " i -d  use "[noeol]" instead of "[Incomplete last line]"
        " l -d  use "999L, 888C" instead of "999 lines, 888 characters"
        " m -   use "[+]" instead of "[Modified]"
        " n -d  use "[New]" instead of "[New File]"
        " r -   use "[RO]" instead of "[readonly]"
        " w -   use "[w]" instead of "written" for file write message and "[a]"
        "       instead of "appended" for ':w >> file' command
        " x -d  use "[dos]" instead of "[dos format]", "[unix]" instead of
        "       "[unix format]" and "[mac]" instead of "[mac format]".
        " a +   all of the above abbreviations
        "
        " o +d  overwrite message for writing a file with subsequent message for
        "       reading a file (useful for ":wn" or when 'autowrite' on)
        " O +d  message for reading a file overwrites any previous message.
        "       Also for quickfix message (e.g., ":cn").
        " s -   don't give "search hit BOTTOM, continuing at TOP" or "search hit
        "       TOP, continuing at BOTTOM" messages
        " t +d  truncate file message at the start if it is too long to fit on
        "       the command-line, "<" will appear in the left most column.
        "       Ignored in Ex mode.
        " T +d  truncate other messages in the middle if they are too long to
        "       fit on the command line.  "..." will appear in the middle.
        "       Ignored in Ex mode.
        " W -   don't give "written" or "[w]" when writing a file
        " A -   don't give the "ATTENTION" message when an existing swap file is
        "       found.
        " I +   don't give the intro message when starting Vim |:intro|.
        " c +   don't give |ins-completion-menu| messages.  For example,
        "       "-- XXX completion (YYY)", "match 1 of 2", "The only match",
        "       "Pattern not found", "Back at original", etc.
        " q -   use "recording" instead of "recording @a"
        " F -d  don't give the file info when editing a file, like `:silent` was
        "       used for the command
    " }}}
    " Screen Drawing                             {{{
    " --------------------------------------------------------------------------
        set lazyredraw  "do not redraw while running macros
                        "necessary for correct usage of status line colours
    " }}}
" }}}
" Text Formatting/Layout                         {{{
" ------------------------------------------------------------------------------
    " Wrap, Join                                 {{{
    " --------------------------------------------------------------------------
        set wrap          "auto wrap line view, but not text itself
        set linebreak     "break at a 'breakat' character; by default one of
                          "' ', '^I', '!', '@', '*', '-', '+', ';', ':',
                          "',', '.', '/', '?'
        set textwidth=80  "maximum text width (column for text wrapping)
        set nojoinspaces  "when joining lines insert only one space after .?!
    " }}}
    " Tabs, Indentation                          {{{
    " --------------------------------------------------------------------------
        set expandtab      "use spaces instead of tabs
        set tabstop=4      "how many columns a tab counts for
        set softtabstop=4  "how many columns to use when you hit tab
        set shiftwidth=4   "how many columns text is indented
        set smarttab       "use shiftwidth value for inserting
                           "tabs at the beggining of a line
        set shiftround     "indentation is rounded to multiple of shiftwidth
        set autoindent     "automatically indent a new line
    " }}}
    " Format Options                             {{{
    " --------------------------------------------------------------------------
        set formatoptions=tcrqnlj
        " t +d  Auto-wrap text using textwidth
        " c +d  Auto-wrap comments using textwidth, inserting the current
        "       comment leader automatically.
        " r +   Automatically insert the current comment leader after hitting
        "       <Enter> in Insert mode.
        " o -   Automatically insert the current comment leader after hitting
        "       'o' or 'O' in Normal mode.
        " q +d  Allow formatting of comments with "gq".
        "       Note that formatting will not change blank lines or lines
        "       containing only the comment leader.  A new paragraph starts
        "       after such a line, or when the comment leader changes.
        " w -   Trailing white space indicates a paragraph continues in the next
        "       line.  A line that ends in a non-white character ends a
        "       paragraph.
        " a -   Automatic formatting of paragraphs.  Every time text is inserted
        "       or deleted the paragraph will be reformatted.  See
        "       |auto-format|.  When the 'c' flag is present this only happens
        "       for recognized comments.
        " n +   When formatting text, recognize numbered lists.  This actually
        "       uses the 'formatlistpat' option, thus any kind of list can be
        "       used.  The indent of the text after the number is used for the
        "       next line.  The default is to find a number, optionally followed
        "       by '.', ':', ')', ']' or '}'.  Note that 'autoindent' must be
        "       set too.  Doesn't work well together with "2".
        "       Example:
        "               1. the first item
        "                  wraps
        "               2. the second item
        " 2 -   When formatting text, use the indent of the second line of a
        "       paragraph for the rest of the paragraph, instead of the indent
        "       of the first line.  This supports paragraphs in which the first
        "       line has a different indent than the rest.  Note that
        "       'autoindent' must be set too.
        "       Example:
        "                       first line of a paragraph
        "               second line of the same paragraph
        "               third line.
        "       This also works inside comments, ignoring the comment leader.
        " v -   Vi-compatible auto-wrapping in insert mode: Only break a line at
        "       a blank that you have entered during the current insert command.
        "       (Note: this is not 100% Vi compatible.  Vi has some "unexpected
        "       features" or bugs in this area.  It uses the screen column
        "       instead of the line column.)
        " b -   Like 'v', but only auto-wrap if you enter a blank at or before
        "       the wrap margin.  If the line was longer than 'textwidth' when
        "       you started the insert, or you do not enter a blank in the
        "       insert before reaching 'textwidth', Vim does not perform
        "       auto-wrapping.
        " l +   Long lines are not broken in insert mode: When a line was longer
        "       than 'textwidth' when the insert command started, Vim does not
        "       automatically format it.
        " m -   Also break at a multi-byte character above 255.  This is useful
        "       for Asian text where every character is a word on its own.
        " M -   When joining lines, don't insert a space before or after a
        "       multi-byte character.  Overrules the 'B' flag.
        " B -   When joining lines, don't insert a space between two multi-byte
        "       characters.  Overruled by the 'M' flag.
        " 1 -   Don't break a line after a one-letter word.  It's broken before
        "       it instead (if possible).
        " j +d  Where it makes sense, remove a comment leader when joining
        "       lines.
        "       For example, joining:
        "               int i;   // the index
        "                        // in the list
        "       Becomes:
        "               int i;   // the index in the list
    " }}}
    " C Indent Options                           {{{
    " --------------------------------------------------------------------------
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
        "     margin.  (default 'shiftwidth').
        "
        "       cino=               cino=t0             cino=t7
        "             int             int                        int
        "         func()              func()              func()
        "
        " UN  When N is non-zero, do not ignore the indenting specified by ( or
        "     u in case that the unclosed parentheses is the first non-white
        "     character in its line.  (default 0).
        "
        "       cino= or cino=(s          cino=(s,U1
        "         c = c1 &&                 c = c1 &&
        "             (                         (
        "              c2 ||                        c2 ||
        "              c3                           c3
        "             ) && c4;                  ) && c4;
    " }}}
" }}}
" Maps & Functions                               {{{
" ------------------------------------------------------------------------------
    " Leader                                     {{{
    " --------------------------------------------------------------------------
        let mapleader = "\\"
    " }}}
    " Autocommands                               {{{
    " --------------------------------------------------------------------------
        " don't show trailing spaces in insert mode
        augroup trailing
            autocmd!
            autocmd InsertEnter * set listchars-=trail:·
            autocmd InsertLeave * set listchars+=trail:·
        augroup END
    " }}}
    " Clipboard                                  {{{
    " --------------------------------------------------------------------------
        xnoremap <expr> p 'pgv"'.v:register.'y'
        nnoremap <leader>y "+yy
        xnoremap <leader>y "+ygv
        nnoremap <leader>d "+dd
        xnoremap <leader>d "+d
        nnoremap <leader>p "+p
        nnoremap <leader>P "+gP
        xnoremap <leader>p "+gp
        xnoremap <leader>P "+gP
    " }}}
    " Search, Copy, Replace                      {{{
    " --------------------------------------------------------------------------
        nnoremap <leader>/ :noh<cr>
        noremap n <cmd>exe "norm! " . (v:count > 1 ? v:count : '') . "nzzzv"<cr>
        sunmap n
        noremap N <cmd>exe "norm! " . (v:count > 1 ? v:count : '') . "Nzzzv"<cr>
        sunmap N
        noremap / /\v
        sunmap /
        noremap ? ?\v
        sunmap ?
        cnoremap s// s/\v
        nnoremap Y y$
    " }}}
    " Navigation, Windows, Tabs                  {{{
    " --------------------------------------------------------------------------
        " move vertically by screen lines instead of physical lines.
        " exchange meanings for physical and screen motion keys
        " down
        nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
        xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
        nnoremap gj   j
        xnoremap gj   j
        " up
        nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
        xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
        nnoremap gk   k
        xnoremap gk   k
        " start of line
        nnoremap  0  g0
        xnoremap  0  g0
        nnoremap g0   0
        xnoremap g0   0
        nnoremap  ^  g^
        xnoremap  ^  g^
        nnoremap g^   ^
        xnoremap g^   ^
        " end of line
        nnoremap  $  g$
        xnoremap  $  g$
        nnoremap g$   $
        xnoremap g$   $
        " use tab to jump between matching pairs
        noremap <tab> %
        " move between windows
        nnoremap <M-h> <C-w>h
        nnoremap <M-t> <C-w>j
        nnoremap <M-c> <C-w>k
        nnoremap <M-n> <C-w>l
        " resize window
        nnoremap <M-up> <C-w>-
        nnoremap <M-down> <C-w>+
        nnoremap <M-left> <C-w><
        nnoremap <M-right> <C-w>>
        nnoremap <leader>vr :exe "vertical resize " . (&textwidth + 9)<cr>
        " create new tab/window
        nnoremap <leader>T :tabnew<cr>
        nnoremap <leader>- :split<cr>
        nnoremap <leader>\| :vsplit<cr>
    " }}}
    " Folding                                    {{{
    " --------------------------------------------------------------------------
        function! s:ToggleFoldColumn()
            if (&foldcolumn == "0")
                set foldcolumn=4
            else
                set foldcolumn=0
            endif
        endfunction
        command! -nargs=0 ToggleFoldColumn call <SID>ToggleFoldColumn()
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
        nnoremap <silent> <leader>tf :ToggleFoldColumn<cr>
    " }}}
    " Location Indicators                        {{{
    " --------------------------------------------------------------------------
        function! s:ToggleColorColumn()
            if (&colorcolumn == "0")
                set colorcolumn=+1
            else
                set colorcolumn=0
            endif
        endfunction
        command! -nargs=0 ToggleColorColumn call <SID>ToggleColorColumn()
        nnoremap <silent> <leader>tl :set list!<cr>
        nnoremap <silent> <leader>tn :ToggleNumbers<cr>
        nnoremap <silent> <leader>tr :ToggleRelNums<cr>
        nnoremap <silent> <leader>tc :set cursorcolumn!<cr>
        nnoremap <silent> <leader>tv :ToggleColorColumn<cr>
    " }}}
    " Tabs, Indentation, Whitespace              {{{
    " --------------------------------------------------------------------------
        function! s:StripTrWhSp()
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
        command! -nargs=0 StripTrWhiteSpace call <SID>StripTrWhSp()
        xnoremap < <gv
        xnoremap > >gv
        nnoremap <leader>rt :retab!<cr>
        xnoremap <leader>rt :retab!<cr>
        nnoremap <silent> <leader>te :set expandtab!<cr>
        nnoremap <leader>w :StripTrWhiteSpace<cr>
    " }}}
    " Other                                      {{{
    " --------------------------------------------------------------------------
        inoremap jk <esc>
        nnoremap <leader>o o<esc>
        nnoremap <leader>O O<esc>
        " format
        nnoremap Q gq
        xnoremap Q gq
        " break line and return at the end of the previous line
        nnoremap <leader>b i<cr><esc>k$
        " toggle spell
        nnoremap <silent> <leader>ts :set spell!<cr>
        " setup emacs-style command-line editing keys
        cnoremap <C-a> <home>
        cnoremap <C-b> <left>
        cnoremap <C-d> <del>
        cnoremap <C-f> <right>
        cnoremap <C-n> <down>
        cnoremap <C-p> <up>
        cnoremap <M-b> <S-left>
        cnoremap <M-f> <S-right>
        cnoremap <C-o><C-a> <C-a>
        cnoremap <C-o><C-b> <C-b>
        cnoremap <C-o><C-d> <C-d>
        cnoremap <C-o><C-n> <C-n>
        cnoremap <C-o><C-p> <C-p>
    " }}}
" }}}
" ------------------------------------------------------------------------------
" vim: foldmethod=marker foldlevel=1
" ------------------------------------------------------------------------------
