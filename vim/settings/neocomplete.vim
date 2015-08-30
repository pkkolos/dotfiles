"let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_fuzzy_completion = 0
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"if has('gui_running')
    "let g:neocomplete#sources#omni#input_patterns.python = ''
"endif

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby =
            \ '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.erlang =
            \ '\<[[:digit:][:alnum:]_-]\+:[[:digit:][:alnum:]_-]*'
