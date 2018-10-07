" ------------------------------------------------------------------------------
" Theme                                          {{{
" ------------------------------------------------------------------------------
    let g:solarized_diffmode = "high"
    colorscheme solarized
" }}}
" General Settings                               {{{
" ------------------------------------------------------------------------------
    set columns=100
    set lines=30
    set mousehide                    "hide mouse pointer when typing
    set guicursor+=a:block-blinkon0  "always block cursor; no blinking
    set guifont=DejaVu\ Sans\ Mono\ 10
    set winaltkeys=no                "don't use the alt key to access the menus
" }}}
" GUI Options                                    {{{
" ------------------------------------------------------------------------------
    set guioptions=cimg
    " ! -   External commands are executed in a terminal window.  Without this
    "       flag the MS-Windows GUI will open a console window to execute the
    "       command.  The Unix GUI will simulate a dumb terminal to list the
    "       command output.  The terminal window will be positioned at the
    "       bottom, and grow upwards as needed.
    " a -d  Autoselect:  If present, then whenever VISUAL mode is started, or
    "       the Visual area extended, Vim tries to become the owner of the
    "       windowing system's global selection.  This means that the Visually
    "       highlighted text is available for pasting into other applications as
    "       well as into Vim itself.  When the Visual mode ends, possibly due to
    "       an operation on the text, or when an application wants to paste the
    "       selection, the highlighted text is automatically yanked into the "*
    "       selection register.  Thus the selection is still available for
    "       pasting into other applications after the VISUAL mode has ended.
    "               If not present, then Vim won't become the owner of the
    "       windowing system's global selection unless explicitly told to by a
    "       yank or delete operation for the "* register.  The same applies to
    "       the modeless selection.
    " P -   Like autoselect but using the "+ register instead of the "*
    "       register.
    " A -   Autoselect for the modeless selection.  Like 'a', but only applies
    "       to the modeless selection.
    "
    "           'guioptions'   autoselect Visual  autoselect modeless
    "                ""              -                       -
    "                "a"            yes                     yes
    "                "A"             -                      yes
    "                "aA"           yes                     yes
    "
    " c +   Use console dialogs instead of popup dialogs for simple choices.
    " e -d  Add tab pages when indicated with 'showtabline'. 'guitablabel' can
    "       be used to change the text in the labels.  When 'e' is missing a
    "       non-GUI tab pages line may be used.  The GUI tabs are only supported
    "       on some systems, currently GTK, Motif, Mac OS/X and MS-Windows.
    " f -   Foreground: Don't use fork() to detach the GUI from the shell where
    "       it was started.  Use this for programs that wait for the editor to
    "       finish (e.g., an e-mail program).  Alternatively you can use
    "       "gvim -f" or ":gui -f" to start the GUI in the foreground.
    "       |gui-fork|
    "       Note: Set this option in the vimrc file.  The forking may have
    "       happened already when the |gvimrc| file is read.
    " i +d  Use a Vim icon.  For GTK with KDE it is used in the left-upper
    "       corner of the window.  It's black&white on non-GTK, because of
    "       limitations of X11.  For a color icon, see |X11-icon|.
    " m +d  Menu bar is present.
    " M -   The system menu "$VIMRUNTIME/menu.vim" is not sourced.  Note that
    "       this flag must be added in the .vimrc file, before switching on
    "       syntax or filetype recognition (when the |gvimrc| file is sourced
    "       the system menu has already been loaded; the ":syntax on" and
    "       ":filetype on" commands load the menu too).
    " g +d  Grey menu items: Make menu items that are not active grey.  If 'g'
    "       is not included inactive menu items are not shown at all.
    "       Exception: Athena will always use grey menu items.
    " t -d  Include tearoff menu items.  Currently only works for Win32, GTK+,
    "       and Motif 1.2 GUI.
    " T -d  Include Toolbar.  Currently only in Win32, GTK+, Motif, Photon and
    "       Athena GUIs.
    " r -d  Right-hand scrollbar is always present.
    " R -   Right-hand scrollbar is present when there is a vertically split
    "       window.
    " l -   Left-hand scrollbar is always present.
    " L -d  Left-hand scrollbar is present when there is a vertically split
    "       window.
    " b -   Bottom (horizontal) scrollbar is present.  Its size depends on the
    "       longest visible line, or on the cursor line if the 'h' flag is
    "       included. |gui-horiz-scroll|
    " h -   Limit horizontal scrollbar size to the length of the cursor line.
    "       Reduces computations. |gui-horiz-scroll|
    " v -   Use a vertical button layout for dialogs.  When not included, a
    "       horizontal layout is preferred, but when it doesn't fit a vertical
    "       layout is used anyway.
    " p -   Use Pointer callbacks for X11 GUI.  This is required for some window
    "       managers.  If the cursor is not blinking or hollow at the right
    "       moment, try adding this flag.  This must be done before starting the
    "       GUI.  Set it in your |gvimrc|.  Adding or removing it after the GUI
    "       has started has no effect.
    " F -   Add a footer.  Only for Motif.  See |gui-footer|.
    " k -   Keep the GUI window size when adding/removing a scrollbar, or
    "       toolbar, tabline, etc.  Instead, the behavior is similar to when the
    "       window is maximized and will adjust 'lines' and 'columns' to fit to
    "       the window.  Without the 'k' flag Vim will try to keep 'lines' and
    "       'columns' the same when adding and removing GUI components.
" }}}
" Maps & Functions                               {{{
" ------------------------------------------------------------------------------
    if executable('wmctrl')
        autocmd GUIEnter * call system("wmctrl -ir " . v:windowid
                    \ . " -b add,maximized_vert,maximized_horz")
        function! ToggleFullscreen()
            if &guioptions =~# 'm'
                set guioptions-=m
            else
                set guioptions+=m
            endif
            call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
        endfunction
        nnoremap <F11> :call ToggleFullscreen()<cr>
        vnoremap <F11> :call ToggleFullscreen()<cr>gv
        inoremap <F11> <C-o>:call ToggleFullscreen()<cr>
    endif
    function! AdjustFontSize(amount, relative)
        let pattern = '^\(.* \)\([1-9][0-9]*\)$'
        let fontname = substitute(&guifont, pattern, '\1', '')
        if a:relative
            let cursize = substitute(&guifont, pattern, '\2', '')
            let newsize = cursize + a:amount
        else
            let newsize = a:amount
        endif
        if (newsize >= 6) && (newsize <= 24)
            let newfont = fontname . newsize
            let &guifont = newfont
        endif
    endfunction
    nnoremap <silent> <M-+> :call AdjustFontSize(2, 1)<cr>
    nnoremap <silent> <M-=> :call AdjustFontSize(2, 1)<cr>
    nnoremap <silent> <M--> :call AdjustFontSize(-2, 1)<cr>
    nnoremap <silent> <M-0> :call AdjustFontSize(10, 0)<cr>
" }}}
" ------------------------------------------------------------------------------
" vim: foldmethod=marker
" ------------------------------------------------------------------------------
