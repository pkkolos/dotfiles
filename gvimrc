" -----------------------------------------------------------------------------
" Panayiotis Kkolos
" Modified: 2013-12-16
" -----------------------------------------------------------------------------
" Theme                                          {{{
" -----------------------------------------------------------------------------
    let g:solarized_menu=0
    colorscheme solarized
    call togglebg#map("<F5>")
" }}}
" General Settings                               {{{
" -----------------------------------------------------------------------------
    set columns=103
    set lines=32
    set mousehide     "hide mouse pointer when typing
" }}}
" GUI Options                                    {{{
" -----------------------------------------------------------------------------
    set guioptions=aegimrLc
    " a +d  Autoselect: If present, then whenever VISUAL mode is started, or
    "       the Visual area extended, Vim tries to become the owner of the
    "       windowing system's global selection. This means that the Visually
    "       highlighted text is available for pasting into other applications
    "       as well as into Vim itself. When the Visual mode ends, possibly due
    "       to an operation on the text, or when an application wants to paste
    "       the selection, the highlighted text is automatically yanked into
    "       the "* selection register. Thus the selection is still available
    "       for pasting into other applications after the VISUAL mode has
    "       ended. If not present, then Vim won't become the owner of the
    "       windowing system's global selection unless explicitly told to by a
    "       yank or delete operation for the "* register. The same applies to
    "       the modeless selection.
    " P -   Like autoselect but using the "+ register instead of the "*
    "       register.
    " A -   Autoselect for the modeless selection. Like 'a', but only applies
    "       to the modeless selection.
    "
    "           'guioptions'   autoselect Visual  autoselect modeless
    "                ""              -                       -
    "                "a"            yes                     yes
    "                "A"             -                      yes
    "                "aA"           yes                     yes
    "
    " c +   Use console dialogs instead of popup dialogs for simple choices.
    " e +d  Add tab pages when indicated with 'showtabline'. 'guitablabel' can
    "       be used to change the text in the labels. When 'e' is missing a
    "       non-GUI tab pages line may be used. The GUI tabs are only supported
    "       on some systems, currently GTK, Motif, Mac OS/X and MS-Windows.
    " f -   Foreground: Don't use fork() to detach the GUI from the shell where
    "       it was started. Use this for programs that wait for the editor to
    "       finish (e.g., an e-mail program). Alternatively you can use "gvim
    "       -f" or ":gui -f" to start the GUI in the foreground.  |gui-fork|
    "       Note: Set this option in the vimrc file. The forking may have
    "       happened already when the |gvimrc| file is read.
    " i +d  Use a Vim icon. For GTK with KDE it is used in the left-upper
    "       corner of the window. It's black&white on non-GTK, because of
    "       limitations of X11. For a color icon, see |X11-icon|.
    " m +d  Menu bar is present.
    " M -   The system menu "$VIMRUNTIME/menu.vim" is not sourced. Note that
    "       this flag must be added in the .vimrc file, before switching on
    "       syntax or filetype recognition (when the |gvimrc| file is sourced
    "       the system menu has already been loaded; the ":syntax on" and
    "       ":filetype on" commands load the menu too).
    " g +d  Grey menu items: Make menu items that are not active grey. If 'g'
    "       is not included inactive menu items are not shown at all.
    "       Exception: Athena will always use grey menu items.
    " t -d  Include tearoff menu items. Currently only works for Win32, GTK+,
    "       and Motif 1.2 GUI.
    " T -d  Include Toolbar. Currently only in Win32, GTK+, Motif, Photon and
    "       Athena GUIs.
    " r +d  Right-hand scrollbar is always present.
    " R -   Right-hand scrollbar is present when there is a vertically split
    "       window.
    " l -   Left-hand scrollbar is always present.
    " L +d  Left-hand scrollbar is present when there is a vertically split
    "       window.
    " b -   Bottom (horizontal) scrollbar is present. Its size depends on the
    "       longest visible line, or on the cursor line if the 'h' flag is
    "       included. |gui-horiz-scroll|
    " h -   Limit horizontal scrollbar size to the length of the cursor line.
    "       Reduces computations. |gui-horiz-scroll|
    " v -   Use a vertical button layout for dialogs. When not included, a
    "       horizontal layout is preferred, but when it doesn't fit a vertical
    "       layout is used anyway.
    " p -   Use Pointer callbacks for X11 GUI. This is required for some window
    "       managers. If the cursor is not blinking or hollow at the right
    "       moment, try adding this flag. This must be done before starting the
    "       GUI. Set it in your |gvimrc|. Adding or removing it after the GUI
    "       has started has no effect.
    " F -   Add a footer. Only for Motif. See |gui-footer|.
" }}}
" -----------------------------------------------------------------------------
" vim: foldmethod=marker
" -----------------------------------------------------------------------------
