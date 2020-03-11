" yankstack mappings

if exists("g:miniyank_filename")
    nmap p <Plug>(miniyank-autoput)
    nmap P <Plug>(miniyank-autoPut)
    xmap p <Plug>(miniyank-autoput)
    xmap P <Plug>(miniyank-autoPut)
    nmap <leader>n <Plug>(miniyank-cycle)
    nmap <leader>N <Plug>(miniyank-cycleback)
endif
