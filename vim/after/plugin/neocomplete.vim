function! s:check_back_space()
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <expr><cr>     pumvisible() ? "\<C-y>"         : "\<cr>"
inoremap <expr><space>  pumvisible() ? "\<C-y>\<space>" : "\<space>"
inoremap <expr><kenter> pumvisible() ? "\<C-y>"         : "\<cr>"
inoremap <expr><S-tab>  pumvisible() ? "\<C-p>"         : "\<tab>"

if exists("g:loaded_neocomplete")
    inoremap <expr><C-g> neocomplete#undo_completion()
    "inoremap <expr><C-l> neocomplete#complete_common_string()
    "inoremap <expr><C-h> neocomplete#smart_close_popup()

    inoremap <expr><bs>     pumvisible()
                \ ? neocomplete#smart_close_popup()."\<C-h>" : "\<bs>"

    inoremap <expr><tab>   pumvisible() ? "\<C-n>"
                \ : <SID>check_back_space() ? "\<tab>"
                \ : neocomplete#start_manual_complete()
else
    inoremap <expr><bs>     pumvisible() ? "\<C-e>\<bs>"    : "\<bs>"

    inoremap <expr><tab>    pumvisible() ? "\<C-n>" : <SID>check_back_space()
                \ ? "\<tab>" : "\<C-x>\<C-p>"
endif
