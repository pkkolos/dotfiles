" deoplete mappings

function! s:check_back_space()
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <expr><cr>     pumvisible() ? "\<C-y>"         : "\<cr>"
inoremap <expr><space>  pumvisible() ? "\<C-y>\<space>" : "\<space>"
inoremap <expr><kenter> pumvisible() ? "\<C-y>"         : "\<cr>"
inoremap <expr><S-tab>  pumvisible() ? "\<C-p>"         : "\<tab>"

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

if exists("g:loaded_deoplete")
    inoremap <expr><C-g> deoplete#undo_completion()

    inoremap <expr><bs>  pumvisible()
                \ ? deoplete#smart_close_popup()."\<C-h>" : "\<bs>"

    inoremap <expr><tab> pumvisible() ? "\<C-n>" : <SID>check_back_space()
                \ ? "\<tab>" : deoplete#mappings#manual_complete()
else
    inoremap <expr><bs>  pumvisible() ? "\<C-e>\<bs>" : "\<bs>"

    inoremap <expr><tab> pumvisible() ? "\<C-n>" : <SID>check_back_space()
                \ ? "\<tab>" : "\<C-x>\<C-p>"
endif
