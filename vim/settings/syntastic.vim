let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['html', 'python'] }

let g:syntastic_auto_loc_list = 1
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '!'

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args =
            \ '--disable=C0103 -f parseable -r n -i y'
