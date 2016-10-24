" numbers.vim
"
" Inspired by:
"     Numbers (https://github.com/myusuf3/numbers.vim)

if exists('g:loaded_Numbers')
    finish
endif
let g:loaded_Numbers = 1

if !exists('g:numbers_off')
    let g:numbers_off = ['undotree']
endif

if !exists('g:numbers_abs')
    let g:numbers_abs = ['help', 'diffpanel_3']
endif

function! s:InitNumbers()
    if index(g:numbers_off, &ft) >= 0 || index(g:numbers_off, @%) >= 0
        set nonumber
        set norelativenumber
    else
        call s:ResetNumbers()
    endif
endfunction

function! s:ResetNumbers()
    if index(g:numbers_off, &ft) >= 0 || index(g:numbers_off, @%) >= 0
        return
    elseif index(g:numbers_abs, &ft) >= 0 || index(g:numbers_abs, @%) >= 0
        let w:numbers_mode = 0
    elseif !exists('w:numbers_mode')
        let w:numbers_mode = 1
    endif

    set number
    if w:numbers_mode == 0
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

function! s:SetAbsolute()
    let w:numbers_mode = 0
    call s:ResetNumbers()
endfunction

function! s:SetRelative()
    let w:numbers_mode = 1
    call s:ResetNumbers()
endfunction

function! s:LostFocus()
    if exists('w:numbers_mode')
        let s:numbers_mode = w:numbers_mode
    endif
    call s:SetAbsolute()
endfunction

function! s:GainFocus()
    if exists('s:numbers_mode')
        let w:numbers_mode = s:numbers_mode
    else
        let w:numbers_mode = 1
    endif
    call s:ResetNumbers()
endfunction

function! s:SetNumbers()
    call s:ResetNumbers()
    augroup NumbersEnable
        autocmd!
        autocmd VimEnter    * call <SID>InitNumbers()
        autocmd WinNew      * call <SID>InitNumbers()
        autocmd FileType    * call <SID>InitNumbers()
        autocmd WinEnter    * call <SID>SetRelative()
        autocmd WinLeave    * call <SID>SetAbsolute()
        autocmd InsertEnter * call <SID>SetAbsolute()
        autocmd InsertLeave * call <SID>SetRelative()
        autocmd FocusLost   * call <SID>LostFocus()
        autocmd FocusGained * call <SID>GainFocus()
    augroup END
endfunction

function! s:UnsetNumbers()
    set nonumber
    set norelativenumber
    augroup NumbersDisable
        autocmd!
        autocmd! NumbersEnable
    augroup END
endfunction

function! s:ToggleNumbers()
    if &number == 1
        call s:UnsetNumbers()
    else
        call s:SetNumbers()
    endif
endfunction

function! s:ToggleRelNums()
    if &relativenumber == 1
        let w:numbers_mode = 0
    else
        let w:numbers_mode = 1
    endif
    call s:ResetNumbers()
endfunction

command! -nargs=0 ToggleNumbers call <SID>ToggleNumbers()
command! -nargs=0 ToggleRelNums call <SID>ToggleRelNums()

call s:SetNumbers()
