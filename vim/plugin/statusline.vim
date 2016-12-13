" statusline.vim: change statusline colour depending on buffer state
"
" Inspired by:
"     StatusLineHighlight (http://www.vim.org/scripts/script.php?script_id=3383)

if exists('g:loaded_StatusLine') || (! has('gui_running') && &t_Co <= 2)
    finish
endif
let g:loaded_StatusLine = 1

function! SLFileType()
    if (&ff ==# 'dos')
        let l:ff = 'CRLF'
    elseif (&ff ==# 'unix')
        let l:ff = 'LF'
    elseif (&ff ==# 'mac')
        let l:ff = 'CR'
    else
        let l:ff = '?'
    endif

    return l:ff
endfun

function! SLEncoding()
    if (strlen(&fenc) > 0)
        let l:enc = toupper(&fenc)
    else
        let l:enc = toupper(&enc)
    endif
    if (&bomb)
        let l:enc .= '╱BOM'
    endif

    return l:enc
endfun

function! SLTabStops()
    if (&et)
        let l:ts = 'S'
    else
        let l:ts = 'T'
    endif
    let l:ts .= '┊' . &ts
    if (&ts != &sts && &sts == &sw)
        let l:ts .= '╱' . &sts
    elseif (&ts != &sts && &sts != &sw)
        let l:ts .= '╱' . &sts . '╱' . &sw
    endif

    return l:ts
endfun

" paste status
let s:stl_paste = "%{&paste?'PASTE':''}%*"
" buffer number, file name
let s:stl_filename = "%{&paste?'▊':''}%n┊%t%*"
" change status line's colour in visual and select mode
let s:stl_visual = '%{SLUpdateNormMode()}'
" help, preview, read-only, modified, file format, file type
let s:stl_rest = '▋%(%H│%)%(%W│%)%(%R│%)%(%M│%)%{SLFileType()}%(│%Y%)'
" encoding & byte order mark
let s:stl_rest .= '│%{SLEncoding()}'
" expandtab, tabstop, softtabstop, shiftwidth
let s:stl_rest .= '┃%{SLTabStops()}'
" right align
let s:stl_rest .= '┃%<%='
" spelling language(s)
let s:stl_rest .= "%{&spell?'┃SP┊'.toupper(&spelllang):''}"
" line number, column number, character code, top/bot
let s:stl_rest .= '┃LN┊%l╱%L┃CL┊%c%V┃CH┊0x%04B┃%P'

function! s:Hi(group, bgcolour, style)
    if exists('g:ss_fg_default')
        let l:fg_default    = g:ss_fg_default
    elseif &background == 'dark'
        let l:fg_default    = ' ctermfg=0  guifg=#002b36'
    else
        let l:fg_default    = ' ctermfg=15 guifg=#fdf6e3'
    endif
    if exists('g:ss_bg_default')
        let l:bg_default    = g:ss_bg_default
    elseif &background == 'dark'
        let l:bg_default    = ' ctermbg=12 guibg=#93a1a1'
    else
        let l:bg_default    = ' ctermbg=8  guibg=#586e75'
    endif
    if exists('g:ss_bg_default_nc')
        let l:bg_default_nc = g:ss_bg_default_nc
    elseif &background == 'dark'
        let l:bg_default_nc = ' ctermbg=8  guibg=#657b83'
    else
        let l:bg_default_nc = ' ctermbg=12 guibg=#839496'
    endif
    if exists('g:ss_bg_red')
        let l:bg_red        = g:ss_bg_red
    else
        let l:bg_red        = ' ctermbg=1  guibg=#dc322f'
    endif
    if exists('g:ss_bg_green')
        let l:bg_green      = g:ss_bg_green
    else
        let l:bg_green      = ' ctermbg=2  guibg=#719e07'
    endif
    if exists('g:ss_bg_yellow')
        let l:bg_yellow     = g:ss_bg_yellow
    else
        let l:bg_yellow     = ' ctermbg=3  guibg=#b58900'
    endif
    if exists('g:ss_bg_blue')
        let l:bg_blue       = g:ss_bg_blue
    else
        let l:bg_blue       = ' ctermbg=4  guibg=#268bd2'
    endif
    if exists('g:ss_bg_magenta')
        let l:bg_magenta    = g:ss_bg_magenta
    else
        let l:bg_magenta    = ' ctermbg=5  guibg=#d33682'
    endif
    if exists('g:ss_bg_cyan')
        let l:bg_cyan       = g:ss_bg_cyan
    else
        let l:bg_cyan       = ' ctermbg=6  guibg=#2aa198'
    endif
    if exists('g:ss_bg_orange')
        let l:bg_orange     = g:ss_bg_orange
    else
        let l:bg_orange     = ' ctermbg=9  guibg=#cb4b16'
    endif
    if exists('g:ss_bg_violet')
        let l:bg_violet     = g:ss_bg_violet
    else
        let l:bg_violet     = ' ctermbg=13 guibg=#6c71c4'
    endif
    let l:style = ' term=' . a:style . ' cterm=' . a:style . ' gui=' . a:style

    let l:res = 'hi ' . a:group . l:style . l:fg_default
    if (a:bgcolour ==? 'red')
        let l:res .= l:bg_red
    elseif (a:bgcolour ==? 'green')
        let l:res .= l:bg_green
    elseif (a:bgcolour ==? 'yellow')
        let l:res .= l:bg_yellow
    elseif (a:bgcolour ==? 'blue')
        let l:res .= l:bg_blue
    elseif (a:bgcolour ==? 'magenta')
        let l:res .= l:bg_magenta
    elseif (a:bgcolour ==? 'cyan')
        let l:res .= l:bg_cyan
    elseif (a:bgcolour ==? 'orange')
        let l:res .= l:bg_orange
    elseif (a:bgcolour ==? 'violet')
        let l:res .= l:bg_violet
    elseif (a:bgcolour ==? 'default_nc')
        let l:res .= l:bg_default_nc
    else
        let l:res .= l:bg_default
    endif

    exec l:res
endfun

function! s:SLDefaultHighlightings()
    call s:Hi('User1',                   'default',    'bold')
    call s:Hi('StatusLine',              'default',    'bold')
    call s:Hi('StatusLineNC',            'default_nc', 'none')
    call s:Hi('def StatusLineDefault',   'default',    'bold')
    call s:Hi('def StatusLineDefaultNC', 'default_nc', 'none')
    call s:Hi('def StatusLineRed',       'red',        'bold')
    call s:Hi('def StatusLineRedNC',     'red',        'none')
    call s:Hi('def StatusLineGreen',     'green',      'bold')
    call s:Hi('def StatusLineGreenNC',   'green',      'none')
    call s:Hi('def StatusLineYellow',    'yellow',     'bold')
    call s:Hi('def StatusLineYellowNC',  'yellow',     'none')
    call s:Hi('def StatusLineBlue',      'blue',       'bold')
    call s:Hi('def StatusLineBlueNC',    'blue',       'none')
    call s:Hi('def StatusLineViolet',    'violet',     'bold')
    call s:Hi('def StatusLineVioletNC',  'violet',     'none')
    call s:Hi('def StatusLineOrange',    'orange',     'bold')
    call s:Hi('def StatusLineOrangeNC',  'orange',     'none')
endfun

function! s:SLUpdate()
    if !exists('w:stl_paste')
        let w:stl_paste = '%#StatusLineViolet#' . s:stl_paste
    endif
    if !exists('w:stl_filename')
        let w:stl_filename = '%#StatusLineDefault#' . s:stl_filename
    endif
    if !exists('w:stl_rest')
        let w:stl_rest = s:stl_visual . '%1*' . s:stl_rest
    endif

    let &l:stl = w:stl_paste . w:stl_filename . w:stl_rest
endfun

function! s:SLSetFileNameHighlight(colour)
    let l:stl = '%#StatusLine' . a:colour . '#' . s:stl_filename

    if exists('w:stl_filename') && w:stl_filename ==# l:stl
        " The highlight is already set; nothing to do. 
        return
    endif
    let w:stl_filename = l:stl
endfun

function! s:SLSetRestHighlight(colour)
    let l:stl = '%#StatusLine' . a:colour . '#' . s:stl_rest

    if exists('w:stl_rest') && w:stl_rest ==# l:stl
        " The highlight is already set; nothing to do. 
        return
    endif
    let w:stl_rest = l:stl
endfun

function! s:SLSetHighlight(isCurrent)
    if !a:isCurrent
        let w:stl_paste = '%#StatusLineVioletNC#' . s:stl_paste
        let w:stl_rest = s:stl_rest
    else
        let w:modified = &l:modified
        let w:stl_paste = '%#StatusLineViolet#' . s:stl_paste
        if exists('w:stl_rest') && w:stl_rest !~# '^%#StatusLine\w\+#'
            let w:stl_rest = s:stl_visual . '%1*' . s:stl_rest
        endif
    endif

    let l:nc = (a:isCurrent ? '' : 'NC')
    if &l:previewwindow
        call s:SLSetFileNameHighlight('Blue' . l:nc)
    elseif &l:modified
        call s:SLSetFileNameHighlight('Red' . l:nc)
    elseif ! &l:modifiable
        call s:SLSetFileNameHighlight('Blue' . l:nc)
    elseif &l:readonly
        call s:SLSetFileNameHighlight('Green' . l:nc)
    else
        call s:SLSetFileNameHighlight('Default' . l:nc)
    endif

    call s:SLUpdate()
endfun

function! s:SLTextChanged()
    if exists('w:modified') && w:modified == &l:modified
        return
    endif

    call s:SLSetHighlight(1)
endfun

function! s:SLUpdateInsMode(mode)
    if ! &l:modified
        augroup SLModified
            autocmd!
            au CursorMovedI * if &l:modified | call <SID>SLSetHighlight(1) |
                        \ exec 'autocmd! SLModified' | endif
        augroup END
    endif

    if a:mode ==# 'i'
        call s:SLSetRestHighlight('Blue')
    elseif a:mode ==# 'v'
        call s:SLSetRestHighlight('Orange')
    else
        call s:SLSetRestHighlight('Red')
    endif

    call s:SLUpdate()
endfun

function! s:SLUpdateInsModeLeave()
    let w:stl_rest = s:stl_visual . '%1*' . s:stl_rest

    call s:SLUpdate()
endfun

function! SLUpdateNormMode()
    let l:mode = mode()

    if l:mode ==# 'i' || l:mode ==# 'R'
        return ''
    elseif l:mode ==? 'v' || l:mode ==# "\x16"
        let l:mcl = 'green'
    elseif l:mode ==? 's' || l:mode ==# "\x13"
        let l:mcl = 'yellow'
    else
        let l:mcl = 'default'
    endif

    call <SID>Hi('User1', l:mcl, 'bold')

    redraw
    return ''
endfun

augroup SLHighlight
    autocmd!
    au BufWinEnter  * call <SID>SLSetHighlight(1)
    au WinEnter     * call <SID>SLSetHighlight(1)
    au CmdwinEnter  * call <SID>SLSetHighlight(1)
    au CursorHold   * call <SID>SLSetHighlight(1)
    au CursorHoldI  * call <SID>SLSetHighlight(1)
    au BufWritePost * call <SID>SLSetHighlight(1)
    au OptionSet    * call <SID>SLSetHighlight(1)
    au BufWinLeave  * call <SID>SLSetHighlight(0)
    au WinLeave     * call <SID>SLSetHighlight(0)
    au CmdwinLeave  * call <SID>SLSetHighlight(0)

    au TextChanged  * call <SID>SLTextChanged()
    au InsertEnter  * call <SID>SLUpdateInsMode(v:insertmode)
    au InsertChange * call <SID>SLUpdateInsMode(v:insertmode)
    au InsertLeave  * call <SID>SLUpdateInsModeLeave()

    au VimEnter     * call <SID>SLDefaultHighlightings()
    au ColorScheme  * call <SID>SLDefaultHighlightings()
augroup END
