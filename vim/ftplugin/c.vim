setlocal noexpandtab

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

nnoremap <leader>c9 :Shell gcc -Wall -Wextra -pedantic
            \ -O3 -std=gnu99 -o %:r %<cr>
