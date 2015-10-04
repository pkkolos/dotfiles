function! s:check_back_space()
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

if exists("g:loaded_neocomplete")
    inoremap <expr><C-g> neocomplete#undo_completion()
    "inoremap <expr><C-l> neocomplete#complete_common_string()
    "inoremap <expr><C-h> neocomplete#smart_close_popup()
    "inoremap <expr><C-y> neocomplete#close_popup()
    "inoremap <expr><C-e> neocomplete#cancel_popup()

    inoremap <expr><left>  neocomplete#cancel_popup()."\<left>"
    inoremap <expr><right> neocomplete#cancel_popup()."\<right>"
    inoremap <expr><up>    pumvisible() ? "\<up>"
                \ : neocomplete#cancel_popup()."\<up>"
    inoremap <expr><down>  pumvisible() ? "\<down>"
                \ : neocomplete#cancel_popup()."\<down>"

    inoremap <expr><bs>     pumvisible()
                \ ? neocomplete#smart_close_popup()."\<C-h>" : "\<bs>"
    inoremap <expr><cr>     pumvisible()
                \ ? neocomplete#close_popup()                : "\<cr>"
    inoremap <expr><space>  pumvisible()
                \ ? neocomplete#close_popup()."\<space>"     : "\<space>"
    inoremap <expr><kenter> pumvisible()
                \ ? neocomplete#close_popup()                : "\<cr>"

    inoremap <expr><tab>   pumvisible() ? "\<C-n>"
                \ : <SID>check_back_space() ? "\<tab>"
                \ : neocomplete#start_manual_complete()
    inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "\<tab>"
else
    inoremap <expr><left>   pumvisible() ? "\<C-e>\<left>"  : "\<left>"
    inoremap <expr><right>  pumvisible() ? "\<C-e>\<right>" : "\<right>"
    " inoremap <expr><up>     pumvisible() ? "\<up>"          : "\<C-e>\<up>"
    " inoremap <expr><down>   pumvisible() ? "\<down>"        : "\<C-e>\<down>"

    inoremap <expr><bs>     pumvisible() ? "\<C-e>\<bs>"    : "\<bs>"
    inoremap <expr><cr>     pumvisible() ? "\<C-y>"         : "\<cr>"
    inoremap <expr><space>  pumvisible() ? "\<C-y>\<space>" : "\<space>"
    inoremap <expr><kenter> pumvisible() ? "\<C-y>"         : "\<cr>"

    inoremap <expr><tab>    pumvisible() ? "\<C-n>" : <SID>check_back_space()
                \ ? "\<tab>" : "\<C-x>\<C-p>"
    inoremap <expr><S-tab>  pumvisible() ? "\<C-p>" : "\<tab>"
endif
